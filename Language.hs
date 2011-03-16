{-# LANGUAGE MultiParamTypeClasses, FunctionalDependencies, NoMonomorphismRestriction, GeneralizedNewtypeDeriving, TypeFamilies, FlexibleInstances, FlexibleContexts #-}
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
import Data.Function
import Data.List
import Debug.Trace

traceM s = trace ("trace: " ++ s) $ return ()


data ControlFlowJump m t v e= LoopBreak | LoopContinue | FuncReturn e 
instance Error (ControlFlowJump m t v e) where
    noMsg = undefined
    strMsg = undefined


type FieldName = String

data BinOp = OpPlus | OpEq | OpNeq deriving Show


class MonadIterate m => LanguageMonad m t v e | m -> t v e where
    condM :: e -> m Bool
    primBinOpM :: BinOp -> e -> e -> m e

    litIntM :: Int -> m e
    litBool :: Bool -> m e
    voidValue :: m e

    varNewM :: m v
    varSetM :: v -> e -> m ()
    varGetM :: v -> m e

    letrec :: ([e] -> m [e -> m e]) -> m [e]

    lambdaM :: (e -> m e) -> m e
    applyM :: e -> e -> m e

    structNewM :: [FieldName] -> m e
    structSetM :: e -> FieldName -> e -> m ()
    structGetM :: e -> FieldName -> m e

    typeNew :: m t 
    typeConstrain :: Constraint t -> m ()



newtype Var = Var String deriving (Ord,Eq)
instance Show Var where
    show (Var v) = "$" ++ v
newtype TyVar = TyVar String deriving (Ord,Eq,Show)
newtype Def = Def String deriving (Ord,Eq,Show)


data SymbolTable m t v e = SymbolTable {symVar :: M.Map Var v,
                                        symVal :: M.Map Def e,
                                        symType :: M.Map TyVar t}

-- SymbolTable must be a Monoid for Eval to be a LanguageMonoid
-- We "combine" multiple symbol tables by choosing the first
-- This reflects the fact that the variables in scope at a
-- point do not depend on the path taken to reach that point.
instance Monoid (SymbolTable m t v e) where
    mempty = error "mempty not defined for symbol tables"
    s1 `mappend` _ = s1

newtype EvalT t v e m a = Eval (ErrorT (ControlFlowJump m t v e) (StateT (SymbolTable m t v e) m) a) deriving (Monad,MonadIterate,MonadCoalesce)

type Eval t v e m = EvalT (Wrap t) (Wrap v) (Wrap e) m

instance MonadTrans (EvalT t v e) where
    lift = Eval . lift . lift
instance Monad m => MonadError (ControlFlowJump m t v e) (EvalT t v e m) where
    throwError e = Eval $ throwError e
    catchError (Eval x) handler = Eval $ x `catchError` ((\(Eval x) -> x) . handler)


newtype Wrap a = Wrap {unWrap :: a}

instance (LanguageMonad m t v e) => LanguageMonad 
    (EvalT (Wrap t) (Wrap v) (Wrap e) m) 
    (Wrap t) (Wrap v) (Wrap e) 
        where

    condM (Wrap e) = lift $ condM e


    primBinOpM op (Wrap a) (Wrap b) = liftM Wrap $ lift $ primBinOpM op a b

    litIntM i = liftM Wrap $ lift $ litIntM i
    litBool b = liftM Wrap $ lift $ litBool b
    voidValue = liftM Wrap $ lift $ voidValue
    varNewM = liftM Wrap $ lift $ varNewM
    varSetM (Wrap v) (Wrap x) = lift $ varSetM v x
    varGetM (Wrap v) = liftM Wrap $ lift $ varGetM v

    letrec = undefined
      


    lambdaM f = do
      symt <- getSymbolTable
      liftM Wrap $ lift $ lambdaM (\x -> runEval' symt $ liftM unWrap $ f $ Wrap $ x)


    applyM (Wrap f) (Wrap x) = liftM Wrap $ lift $ applyM f x

    structNewM fs = liftM Wrap $ lift $ structNewM fs
    structSetM (Wrap s) f (Wrap x) = lift $ structSetM s f x
    structGetM (Wrap s) f = liftM Wrap $ lift $ structGetM s f

    typeNew = liftM Wrap $ lift $ typeNew
    typeConstrain cn = lift $ typeConstrain $ fmap unWrap cn


getSymbolTable = Eval $ lift get


--runEval :: LanguageMonad m t v e => SymbolTable m t v e -> Eval (Wrap t) (Wrap v) (Wrap e) m a -> m (Either (ControlFlowJump m (Wra) a)
runEval symt (Eval x)= do
  (a,s) <- runStateT (runErrorT x) symt
  return a

--runEval' :: LanguageMonad m => SymbolTable m -> Eval m a -> m a
runEval' symt x = do
  r <- runEval symt x
  case r of
    Left e -> error "misplaced control flow"
    Right f -> return f

--runEvalWithSyms :: LanguageMonad m => SymbolTable m -> Eval m a -> m (a, SymbolTable m)
runEvalWithSyms symt (Eval x) = do
  (a,s) <- runStateT (runErrorT x) symt
  case a of
    Left e -> error "misplaced control flow"
    Right f -> return (f,s)

--evalUntilRet :: LanguageMonad m => Eval m () -> Eval m (LVal m)
evalUntilRet (Eval f) = Eval $ lift $ do
  a <- runErrorT f
  case a of
    Left (FuncReturn f) -> return f
    Left _ -> error "misplaced break/continue"
    Right a -> liftM Wrap $ lift voidValue

--noJumps :: LanguageMonad m => Eval m a -> Eval m a
noJumps x = x `catchError` (error "misplaced control flow")

--doWhile :: LanguageMonad m => Eval m (LVal m) -> Eval m () -> Eval m ()
doWhile exp blk = do
  symt <- getSymbolTable
  lift $ loop $ do
    l <- runEval symt $ do
      e <- noJumps exp
      c <- condM e
      case c of
        True -> liftM Right $ blk
        False -> return $ Left ()
    return $ case l of
      Left (LoopBreak) -> Left ()     -- "break"
      Left (LoopContinue) -> Right () -- "continue"
-- FIXME return inside a while
      Right (Left _) -> Left ()       -- loop exited normally
      Right (Right _) -> Right ()     -- loop is looping



doIf :: LanguageMonad m t v e => Eval t v e m (Wrap e) -> Eval t v e m () -> Eval t v e m () -> Eval t v e m ()
doIf exp t f = do
  e <- noJumps exp
  b <- condM e
  if b then t else f


--subscope :: LanguageMonad m => Eval m a -> Eval m a
subscope (Eval f) = Eval $ do
  oldtable <- lift get
  ans <- f
  lift $ put oldtable
  return ans


symVarInsert v v' (SymbolTable vs ds ts) = 
  SymbolTable (M.insert v v' vs) ds ts
symVarLookup v (SymbolTable vs ds ts) =
  M.lookup v vs

symDefInsert d d' (SymbolTable vs ds ts) = 
  SymbolTable vs (M.insert d d' ds) ts
symDefLookup d (SymbolTable vs ds ts) =
  M.lookup d ds


symTyInsert t t' (SymbolTable vs ds ts) = 
  SymbolTable vs ds (M.insert t t' ts)
symTyLookup t (SymbolTable vs ds ts) =
  M.lookup t ts

scopeNew' create symadd var = do
  v <- create
  Eval $ lift $ modify (symadd var v)
  return v

scopeGet' symlookup var = Eval $ do
  lift $ gets (maybe (error $ "not in scope: " ++ show var) id . symlookup var)


scopeVarNew = scopeNew' varNewM symVarInsert
scopeTyNew = scopeNew' typeNew symTyInsert
scopeDefNew d d' = Eval $ lift $ modify $ symDefInsert d d'
scopeVar = scopeGet' symVarLookup
scopeType = scopeGet' symTyLookup
scopeDef = scopeGet' symDefLookup


scopeLookup :: 
    LanguageMonad m t v e =>
    String ->
    Eval t v e m (Wrap e)
scopeLookup name = do
  symt <- getSymbolTable
  let v = symVarLookup (Var name) symt
  let d = symDefLookup (Def name) symt
  if (isJust d) then return (fromJust d) else varGetM (fromJust v)


  

data TermDecl m t v e = TermDecl String (m ()) (Maybe (m e))
data BasicBlockDecl m t v e = DeclVar (TermDecl m t v e)
                            | DeclDef (TermDecl m t v e)
                            | NoDecl (m ())
                            | DeclDefFun Def (e -> m e)

-- zip' is lazy in its second argument
-- which must be of exactly the same length as the first
zip' (x:xs) = \ ~(y:ys) -> (x,y):(zip' xs ys)
zip' [] = \ ~[] -> []



corecFuncs :: 
    LanguageMonad m t v e =>
    [(Def, Wrap e -> Eval t v e m (Wrap e))] ->
    Eval t v e m ()
corecFuncs fndefs = do
  symt <- getSymbolTable
  let names = map fst fndefs
      bodies = map snd fndefs
  fns <- liftM (map Wrap) $ lift $ 
         letrec $ \fns -> runEval' symt $ do
           forM_ (zip' names fns) $ \(name,f) -> do
             scopeDefNew name (Wrap f)
           symt' <- getSymbolTable
           return [\x -> liftM unWrap $ runEval' symt' (body (Wrap x)) |
                   body <- bodies]
  forM_ (zip names fns) $ \(name,f) -> do
    scopeDefNew name f

evalBasicBlockDecls ::
    LanguageMonad m t v e =>
    [BasicBlockDecl (Eval t v e m) (Wrap t) (Wrap v) (Wrap e)] ->
    Eval t v e m ()

evalBasicBlockDecls bs = do
  let chunks = groupBy ((==) `on` isCorec) bs
  forM_ chunks $ \chunk -> do
    if all isCorec chunk
      then corecFuncs [(name,func) |
                       DeclDefFun name func <- chunk]
      else forM_ chunk rundecl
    where
      isCorec (DeclVar _) = False
      isCorec (DeclDef _) = False
      isCorec (NoDecl _) = False
      isCorec (DeclDefFun _ _) = True


      rundecl (DeclVar (TermDecl name ty val)) = do
        v <- scopeVarNew (Var name)
        when (isJust val) $ do
          val' <- fromJust val
          varSetM v val'

      rundecl (DeclDef (TermDecl name ty val)) = do
        val' <- fromJust $ val
        scopeDefNew (Def name) val'
      rundecl (NoDecl action) = action


data Stmt a b = ControlFlow a | BasicStmt [b]

isBasicStmt (ControlFlow _) = False
isBasicStmt (BasicStmt _) = True

evalStmts stmts = 
    let blocks = groupBy ((==) `on` isBasicStmt) stmts
    in forM_ blocks $ \block -> do
      if all isBasicStmt block
        then evalBasicBlockDecls $ concat [ss | (BasicStmt ss) <- block]
        else sequence_ [s | (ControlFlow s) <- block]
      
{-
evalClassDecl superclasses decls = do
  let methods = 
-}

--testCoRec :: LanguageMonad m => m [LVal m]
testCoRec = letrec $ \fns -> do
              let f = fns !! 0
                  g = fns !! 1
              let f' = \arg -> do
                         applyM g arg 
              let g' = \arg ->  do
                         applyM f arg
              return [f', g']
