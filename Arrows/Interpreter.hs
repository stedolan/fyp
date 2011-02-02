{-# LANGUAGE Arrows, FlexibleInstances, MultiParamTypeClasses, GeneralizedNewtypeDeriving #-}
module Interpreter where
import Control.Arrow
import qualified Control.Category as Cat
import Control.Arrow.Transformer hiding (lift)
import qualified Control.Arrow.Transformer as ArrTrans
import Control.Arrow.Operations hiding (write)

import qualified Data.Map as M
import Data.Maybe

import Language
import ArrowIterate
import ArrowCoalesce
import ArrowState


import MonadIterate
import MonadCoalesce
import Control.Monad.Identity
import Control.Monad.State

data Val = ValBool Bool | ValInt Int
instance Show Val where
    show (ValBool b) = show b
    show (ValInt i) = show i

newtype Interpreter a b = Interpreter (StateArrow (M.Map Var Val) (->) a b) deriving (Arrow,ArrowChoice,ArrowIterate,Cat.Category)
instance ArrowState (M.Map Var Val) Interpreter where {fetch = Interpreter fetch; store = Interpreter store;}

instance ArrowCoalesce Interpreter where

instance ArrowInterpreter Interpreter Val where
    cond = proc c -> case c of
                       ValBool True -> returnA -< True
                       ValBool False -> returnA -< False
    primBinOp OpPlus = arr $ \(ValInt i1, ValInt i2) -> ValInt $ i1 + i2
    primBinOp OpEq = arr $ \(ValInt i1, ValInt i2) -> ValBool $ i1 == i2
    primBinOp OpNeq = arr $ \(ValInt i1, ValInt i2) -> ValBool $ i1 /= i2

    litInt i = arr (const $ ValInt i)

    varGet v = fetch >>> arr (\s -> fromJust $ M.lookup v s)
    varSet v = proc e -> do
                 s <- fetch -< () 
                 store -< M.insert v e s

--runInterpreter :: (StateArrow (M.Map Var Val) (->)) () () -> M.Map Var Val
runInterpreter (Interpreter p) x = snd $ ArrowState.runState p ((), x)


newtype InterpreterM a = InterpreterM (StateT (M.Map Var Val) Identity a) deriving (Monad,MonadIterate,MonadCoalesce)

instance MonadState (M.Map Var Val) InterpreterM where { get = InterpreterM get; put x = InterpreterM $ put x; }

instance LanguageMonad InterpreterM Var Val where
    condM (ValBool b) = return b

    litIntM i = return (ValInt i)
    primBinOpM OpPlus (ValInt i1) (ValInt i2) =return$ ValInt $ i1 + i2
    primBinOpM OpEq (ValInt i1) (ValInt i2) =return$ ValBool $ i1 == i2
    primBinOpM OpNeq (ValInt i1) (ValInt i2) =return$ ValBool $ i1 /= i2
    varSetM v e = do
      s <- get
      put (M.insert v e s)
    varGetM v = do
      s <- get
      return (fromJust $ M.lookup v s)

runInterpreterM (InterpreterM p) x = snd $ runIdentity $ Control.Monad.State.runStateT p x