{-# LANGUAGE MultiParamTypeClasses, FunctionalDependencies, NoMonomorphismRestriction, GeneralizedNewtypeDeriving #-}
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
{-
evalExpr :: (ArrowInterpreter (#) e) => Expr -> () # e
evalExpr (BinOpE op exp1 exp2) = proc () -> do
                            exp1 <- evalExpr exp1 -< ()
                            exp2 <- evalExpr exp2 -< ()
                            primBinOp op -< (exp1, exp2)
                            
evalExpr (VarRef v) = varGet v

evalExpr (LitInt i) = litInt i
  -}  

data LoopQuitException = LoopBreak | LoopContinue deriving Eq
instance Error LoopQuitException where
    noMsg = undefined
    strMsg = undefined
{-
distribM = msum
collectM f =  do {x <- f; return [x]}
coalesceM f = do {xs <- collectM f; return (mconcat xs);}
-}

type FieldName = String

class MonadIterate m => LanguageMonad m t v e | m -> t v e where
    condM :: e -> m Bool
    primBinOpM :: BinOp -> e -> e -> m e
    litIntM :: Int -> m e
    voidValue :: m e

    varNewM :: m v
    varSetM :: v -> e -> m ()
    varGetM :: v -> m e
    
    lambdaM :: (e -> m e) -> m e
    applyM :: e -> e -> m e

    structNewM :: [FieldName] -> m e
    structSetM :: e -> FieldName -> e -> m ()
    structGetM :: e -> FieldName -> m e

    typeNew :: m t
    typeConstrain :: Constraint t -> m ()


evalExprM :: LanguageMonad m t v e => M.Map Var v -> Expr -> m e

evalExprM symt (BinOpE op exp1 exp2) = do
  exp1 <- evalExprM symt exp1
  exp2 <- evalExprM symt exp2
  primBinOpM op exp1 exp2
                            
evalExprM symt (VarRef v) = varGetM (fromJust $ M.lookup v symt)

evalExprM symt (LitInt i) = litIntM i

evalExprM symt (Lambda v p) = lambdaM $ \e -> do
  param <- varNewM
  varSetM param e
  evalWithoutExitM (M.insert v param symt) p
  voidValue

evalExprM symt (Apply f' arg') = do
  f <- evalExprM symt f'
  arg <- evalExprM symt arg'
  applyM f arg

evalExprM symt (AllocStruct fs) = structNewM fs
evalExprM symt (StructField e f) = evalExprM symt e >>= (`structGetM` f)


newtype Var = Var String deriving (Ord,Eq)
instance Show Var where
    show (Var v) = "$" ++ v
newtype TyVar = TyVar String deriving (Ord,Eq,Show)


data SymbolTable t v = SymbolTable {symVar :: M.Map Var v,
                                    symType :: M.Map TyVar t}
newtype Eval t v m a = Eval (ErrorT LoopQuitException (StateT (SymbolTable t v) m) a) deriving (Monad)


evLift = Eval . lift . lift




instance MonadTrans (Eval t v) where
    lift = evLift
instance Monad m => MonadError LoopQuitException (Eval t v m) where
    throwError e = Eval $ throwError e
    catchError (Eval x) handler = Eval $ x `catchError` ((\(Eval x) -> x) . handler)


getSymbolTable = Eval $ lift get

runEval :: LanguageMonad m t v e => SymbolTable t v -> Eval t v m a -> m (Either LoopQuitException a)
runEval symt (Eval x)= do
  (a,s) <- runStateT (runErrorT x) symt
  return a
runEval' :: LanguageMonad m t v e => SymbolTable t v -> Eval t v m a -> m a
runEval' symt x = do
  r <- runEval symt x
  case r of
    Left e -> error "misplaced control flow"
    Right f -> return f

noJumps :: LanguageMonad m t v e => Eval t v m a -> Eval t v m a
noJumps x = x `catchError` (error "misplaced control flow")

doWhile :: LanguageMonad m t v e => Eval t v m e -> Eval t v m () -> Eval t v m ()
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

doIf :: LanguageMonad m t v e => Eval t v m e -> Eval t v m () -> Eval t v m () -> Eval t v m ()
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

subscope :: LanguageMonad m t v e => Eval t v m a -> Eval t v m a
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



evalM :: LanguageMonad m t v e => M.Map Var v -> Program -> ErrorT LoopQuitException m ()
evalM symt prog = coalesceM $ case prog of
     (If e p1 p2) -> do val <- lift $ evalExprM symt e
                        c <- lift $ condM val
                        case c of
                          True -> evalM symt p1
                          False -> evalM symt p2

     (While e p) -> lift $ MonadIterate.loop $ do
                              loop <- runErrorT $
                                      do
                                        v <- lift $ evalExprM symt e
                                        c <- lift $ condM v
                                        case c of
                                          True -> liftM Right $ evalM symt p
                                          False -> return $ Left ()
                              return $ case loop of
                                         Left (LoopBreak) -> Left ()
                                         Left (LoopContinue) -> Right ()
                                         Right (Left _) -> Left ()
                                         Right (Right _) -> Right ()

     (Seq p1 p2) -> evalM symt p1 >> evalM symt p2

     (Asgn v exp) -> do
                    e <- lift $ evalExprM symt exp
                    lift $ varSetM (fromJust $ M.lookup v symt) e
     (DeclVars vs prog) -> do
       vs' <- lift $ sequence $ replicate (length vs) $ varNewM
       evalM (M.fromList (vs `zip` vs') `M.union` symt) prog

     Break -> throwError LoopBreak
     Continue -> throwError LoopContinue

     (SetStructField e f v) -> lift $ do
       e' <- evalExprM symt e
       v' <- evalExprM symt v
       structSetM e' f v'



--runProgram p = proc () -> (eval p -< ()) `runError` \x -> error "misplaced break/continue" -< ()
evalWithoutExitM :: LanguageMonad m t v e => M.Map Var v -> Program -> m ()
evalWithoutExitM symt p = do
  x <- runErrorT (evalM symt p)
  case x of 
    Left e -> error "misplaced break/continue"
    Right f -> return f

runProgramM p = do
  evalWithoutExitM M.empty p
  


data BinOp = OpPlus | OpEq | OpNeq deriving Show
data Expr = BinOpE BinOp Expr Expr | VarRef Var | LitInt Int | Lambda Var Program | AllocStruct [String] | StructField Expr String | Apply Expr Expr
data Program = If Expr Program Program
             | While Expr Program
             | Seq Program Program
             | Asgn Var Expr
             | Break
             | Continue
             | SetStructField Expr String Expr
             | DeclVars [Var] Program

{-
class (ArrowIterate (#), ArrowCoalesce (#)) => ArrowInterpreter (#) e | (#) -> e where
    cond :: e # Bool
    primBinOp :: BinOp -> (e, e) # e
    litInt :: Int -> () # e
    varGet :: Var -> () # e
    varSet :: Var -> e # ()
-}

