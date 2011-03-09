{-# LANGUAGE MultiParamTypeClasses, FunctionalDependencies, NoMonomorphismRestriction, GeneralizedNewtypeDeriving, TypeFamilies #-}
module Language where

import Control.Monad
import Control.Monad.Error
import Control.Monad.Trans
import Control.Monad.State
import Data.Monoid
import qualified Data.Map as M
import Data.Maybe
import ListT
import MonadCoalesce
import MonadIterate
import Type
import UserType


data LoopQuitException = LoopBreak | LoopContinue deriving Eq
instance Error LoopQuitException where
    noMsg = undefined
    strMsg = undefined


type FieldName = String

data Decl m = DType (LType m)
            | DVar (LVar m)
            | DVal (LVal m)
toLType ~(DType x) = x
toLVar ~(DVar x) = x
toLVal ~(DVal x) = x


data BinOp = OpPlus | OpEq | OpNeq deriving Show
class MonadIterate m => LanguageMonad m where
    type LType m
    type LVar m
    type LVal m
    condM :: LVal m -> m Bool
    primBinOpM :: BinOp -> LVal m -> LVal m -> m (LVal m)
    litIntM :: Int -> m (LVal m)
    voidValue :: m (LVal m)

    varNewM :: m (LVar m)
    varSetM :: LVar m -> LVal m -> m ()
    varGetM :: LVar m -> m (LVal m)

    letrec :: ([Decl m] -> m [Decl m]) -> m [Decl m]
    
    lambdaM :: (LVal m -> m (LVal m)) -> m (LVal m)
    applyM :: LVal m -> LVal m -> m (LVal m)

    structNewM :: [FieldName] -> m (LVal m)
    structSetM :: LVal m -> FieldName -> (LVal m) -> m ()
    structGetM :: LVal m -> FieldName -> m (LVal m)

    typeNew :: m (LType m)
    typeConstrain :: Constraint (LType m) -> m ()



newtype Var = Var String deriving (Ord,Eq)
instance Show Var where
    show (Var v) = "$" ++ v
newtype TyVar = TyVar String deriving (Ord,Eq,Show)


data SymbolTable m = SymbolTable {symVar :: M.Map Var (LVar m),
                                  symType :: M.Map TyVar (LType m)}
newtype Eval m a = Eval (ErrorT LoopQuitException (StateT (SymbolTable m) m) a) deriving (Monad)


evLift = Eval . lift . lift




instance MonadTrans Eval where
    lift = evLift
instance Monad m => MonadError LoopQuitException (Eval m) where
    throwError e = Eval $ throwError e
    catchError (Eval x) handler = Eval $ x `catchError` ((\(Eval x) -> x) . handler)

{-
instance LanguageMonad m => LanguageMonad (Eval m) where
    type LType (Eval m) = LType m
    type LVar (Eval m) = LVar m
    type LVal (Eval m) = LVal m
    condM e = lift $ condM e
    primBinOpM op a b = lift $ primBinOpM op a b
    litIntM i = lift $ litIntM i
    voidValue = lift $ voidValue
    varNewM = lift $ varNewM
    varSetM v x = lift $ varSetM v x
    varGetM v = lift $ varGetM v
    lambdaM f = lift $ lambdaM f
    applyM f x = lift $ applyM f x
    structNewM fs = lift $ structNewM fs
    structSetM s f x = lift $ structSetM s f x
    structGetM s f = lift $ structGetM s f
    typeNew = lift $ typeNew
    typeConstrain cn = lift $ typeConstrain cn
-}

getSymbolTable = Eval $ lift get

runEval :: LanguageMonad m => SymbolTable m -> Eval m a -> m (Either LoopQuitException a)
runEval symt (Eval x)= do
  (a,s) <- runStateT (runErrorT x) symt
  return a
runEval' :: LanguageMonad m => SymbolTable m -> Eval m a -> m a
runEval' symt x = do
  r <- runEval symt x
  case r of
    Left e -> error "misplaced control flow"
    Right f -> return f

noJumps :: LanguageMonad m => Eval m a -> Eval m a
noJumps x = x `catchError` (error "misplaced control flow")

doWhile :: LanguageMonad m => Eval m (LVal m) -> Eval m () -> Eval m ()
doWhile exp blk = do
  symt <- getSymbolTable
  lift $ loop $ do
    l <- runEval symt $ do
      e <- noJumps exp
      c <- lift $ condM e
      case c of
        True -> liftM Right $ blk
        False -> return $ Left ()
    return $ case l of
      Left (LoopBreak) -> Left ()     -- "break"
      Left (LoopContinue) -> Right () -- "continue"
      Right (Left _) -> Left ()       -- loop exited normally
      Right (Right _) -> Right ()     -- loop is looping

doIf :: LanguageMonad m => Eval m (LVal m) -> Eval m () -> Eval m () -> Eval m ()
doIf exp t f = do
  e <- noJumps exp
  b <- lift $ condM e
  if b then t else f


{-
ErrorT e m a = m (e + a)
ReaderT r m a = r -> m a
StateT s m a = s -> m (s,a)

ErrorT e (ReaderT r m) a = (ReaderT r m) (e + a) = r -> m (e + a)
ReaderT r (ErrorT e m) a = r -> ErrorT e m a = r -> m (e + a)

ErrorT e (StateT s m) a = (StateT s m) (e + a) = s -> m (s, (e + a))
StateT s (ErrorT e m) a = s -> (ErrorT e m) (s, a) = s -> m (e + (s,a))
-}

subscope :: LanguageMonad m => Eval m a -> Eval m a
subscope (Eval f) = Eval $ do
  oldtable <- lift get
  ans <- f
  lift $ put oldtable
  return ans


symVarInsert v v' (SymbolTable vs ts) = 
  SymbolTable (M.insert v v' vs) ts
symTyInsert t t' (SymbolTable vs ts) = 
  SymbolTable vs (M.insert t t' ts)
symVarLookup v (SymbolTable vs ts) =
  M.lookup v vs
symTyLookup t (SymbolTable vs ts) =
  M.lookup t ts

scopeNew' create symadd var = Eval $ do
  v <- lift $ lift $ create
  lift $ modify (symadd var v)
  return v

scopeGet' symlookup var = Eval $ do
  lift $ gets (maybe (error $ "not in scope: " ++ show var) id . symlookup var)


scopeVarNew = scopeNew' varNewM symVarInsert
scopeTyNew = scopeNew' typeNew symTyInsert
scopeVar = scopeGet' symVarLookup
scopeType = scopeGet' symTyLookup



  



