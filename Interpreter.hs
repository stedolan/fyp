{-# LANGUAGE MultiParamTypeClasses, TypeSynonymInstances, GeneralizedNewtypeDeriving #-}
module Interpreter where
import qualified Data.Map as M
import Data.Map ((!))
import Data.Maybe
import Data.List

import Language hiding (Var)

import MonadIterate
import MonadCoalesce
import Control.Monad.Identity
import Control.Monad.State
import Data.IORef

data Val = ValBool Bool | ValInt Int | ValVoid | ValFunc (Val -> Interpreter Val) | ValStruct (M.Map FieldName Var)
type Var = IORef Val
    

newtype Interpreter a = Interpreter (IO a) deriving (Monad,MonadFix)
instance MonadCoalesce Interpreter where
    coalesceLeft = id
instance MonadIterate Interpreter where
    fixiterM f x = do
      y <- f x
      case y of
        Left l -> return l
        Right r -> fixiterM f r



instance LanguageMonad Interpreter () Var Val where

    condM (ValBool b) = return b

    litIntM i = return (ValInt i)
    litBool b = return (ValBool b)
    primBinOpM OpPlus (ValInt i1) (ValInt i2) =return$ ValInt $ i1 + i2
    primBinOpM OpEq (ValInt i1) (ValInt i2) =return$ ValBool $ i1 == i2
    primBinOpM OpNeq (ValInt i1) (ValInt i2) =return$ ValBool $ i1 /= i2

    varSetM v e = Interpreter $ writeIORef v e
    varNewM = Interpreter $ newIORef (error "uninitialised variable")
    varGetM v = Interpreter $ readIORef v

    voidValue = return ValVoid

    lambdaM f = return $ ValFunc f
    applyM (ValFunc f) v = f v
    
    letrec fns = mfix (fns >=> mapM lambdaM)

    structNewM fs = do
      vars <- mapM (const varNewM) fs
      return $ ValStruct $ M.fromList $ zip fs vars
    structSetM (ValStruct s) f e = Interpreter $ writeIORef (s ! f) e
    structGetM (ValStruct s) f = Interpreter $ readIORef (s ! f)

    typeConstrain _ = return ()
    typeNew = return ()

showVal (ValBool b) = return $ show b
showVal (ValInt i) = return $ show i
showVal (ValFunc f) = return $ "<function>"
showVal (ValVoid) = return $ "<void>"
showVal (ValStruct s) = do
  let (ks,vs') = unzip $ M.toList s
  vs <- mapM (showVal <=< readIORef) vs'
  return $ "{" ++ intercalate ", " [k ++ " = " ++ v |
                                    (k,v) <- zip ks vs] ++ "}"

runInterpreter (Interpreter x) = showVal =<< x
printFunc = ValFunc $ \v -> Interpreter $ do
  putStrLn =<< showVal v
  return $ ValVoid