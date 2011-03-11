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


data ControlFlowJump m = LoopBreak | LoopContinue | FuncReturn (LVal m) 
instance Error (ControlFlowJump m) where
    noMsg = undefined
    strMsg = undefined


type FieldName = String

data BinOp = OpPlus | OpEq | OpNeq deriving Show

type LFunc m = LVal m -> m (LVal m)

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

    letrec :: ([LVal m] -> m [LFunc m]) -> m [LVal m]

    lambdaM :: LFunc m -> m (LVal m)
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
newtype Def = Def String deriving (Ord,Eq,Show)


data SymbolTable m = SymbolTable {symVar :: M.Map Var (LVar m),
                                  symVal :: M.Map Def (LVal m),
                                  symType :: M.Map TyVar (LType m)}

-- SymbolTable must be a Monoid for Eval to be a LanguageMonoid
-- We "combine" multiple symbol tables by choosing the first
-- This reflects the fact that the variables in scope at a
-- point do not depend on the path taken to reach that point.
instance Monoid (SymbolTable m) where
    mempty = error "mempty not defined for symbol tables"
    s1 `mappend` _ = s1

newtype Eval m a = Eval (ErrorT (ControlFlowJump m) (StateT (SymbolTable m) m) a) deriving (Monad,MonadIterate,MonadCoalesce)


instance MonadTrans Eval where
    lift = Eval . lift . lift
instance Monad m => MonadError (ControlFlowJump m) (Eval m) where
    throwError e = Eval $ throwError e
    catchError (Eval x) handler = Eval $ x `catchError` ((\(Eval x) -> x) . handler)


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
    letrec = undefined
      
    lambdaM f = do
      symt <- getSymbolTable
      lift $ lambdaM (\x -> runEval' symt $ f x)
    applyM f x = lift $ applyM f x
    structNewM fs = lift $ structNewM fs
    structSetM s f x = lift $ structSetM s f x
    structGetM s f = lift $ structGetM s f
    typeNew = lift $ typeNew
    typeConstrain cn = lift $ typeConstrain cn


getSymbolTable = Eval $ lift get

runEval :: LanguageMonad m => SymbolTable m -> Eval m a -> m (Either (ControlFlowJump m) a)
runEval symt (Eval x)= do
  (a,s) <- runStateT (runErrorT x) symt
  return a
runEval' :: LanguageMonad m => SymbolTable m -> Eval m a -> m a
runEval' symt x = do
  r <- runEval symt x
  case r of
    Left e -> error "misplaced control flow"
    Right f -> return f

runEvalWithSyms :: LanguageMonad m => SymbolTable m -> Eval m a -> m (a, SymbolTable m)
runEvalWithSyms symt (Eval x) = do
  (a,s) <- runStateT (runErrorT x) symt
  case a of
    Left e -> error "misplaced control flow"
    Right f -> return (f,s)

evalUntilRet :: LanguageMonad m => Eval m () -> Eval m (LVal m)
evalUntilRet (Eval f) = Eval $ lift $ do
  a <- runErrorT f
  case a of
    Left (FuncReturn f) -> return f
    Left _ -> error "misplaced break/continue"
    Right a -> lift voidValue

noJumps :: LanguageMonad m => Eval m a -> Eval m a
noJumps x = x `catchError` (error "misplaced control flow")

doWhile :: LanguageMonad m => Eval m (LVal m) -> Eval m () -> Eval m ()
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

doIf :: LanguageMonad m => Eval m (LVal m) -> Eval m () -> Eval m () -> Eval m ()
doIf exp t f = do
  e <- noJumps exp
  b <- condM e
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

scopeNew' create symadd var = Eval $ do
  v <- lift $ lift $ create
  lift $ modify (symadd var v)
  return v

scopeGet' symlookup var = Eval $ do
  lift $ gets (maybe (error $ "not in scope: " ++ show var) id . symlookup var)


scopeVarNew = scopeNew' varNewM symVarInsert
scopeTyNew = scopeNew' typeNew symTyInsert
scopeDefNew d d' = Eval $ lift $ modify $ symDefInsert d d'
scopeVar = scopeGet' symVarLookup
scopeType = scopeGet' symTyLookup
scopeDef = scopeGet' symDefLookup



  

data TermDecl m = TermDecl String (m ()) (Maybe (m (LVal m)))
data BasicBlockDecl m = DeclVar (TermDecl m)
                      | DeclDef (TermDecl m)
                      | NoDecl (m ())
                      | DeclDefFun Def (LFunc m)

-- zip' is lazy in its second argument
-- which must be of exactly the same length as the first
zip' (x:xs) = \ ~(y:ys) -> (x,y):(zip' xs ys)
zip' [] = \ ~[] -> []


evalBasicBlockDecls bs = do
  let corec = filter isCorec bs
  lift $ letrec $ \fns -> do
    forM_ (zip' corec fns) define
    defs <- forM bs $ \decl -> case decl of
      DeclVar (TermDecl name ty val) -> do
        v <- scopeVarNew (Var name)
        when (isJust val) $ do
          val' <- fromJust val
          varSetM v val'
        return []
      DeclDef (TermDecl name ty val) -> do 
        val' <- fromJust $ val
        v <- scopeDefNew (Def name) val'
        return []
      NoDecl action -> do
        action
        return []
      DeclDefFun name func -> do
        return [func]
    return (concat defs)
      where
        isCorec (DeclVar _) = False
        isCorec (DeclDef _) = False
        isCorec (NoDecl _) = False
        isCorec (DeclDefFun _ _) = True

        define ((DeclDefFun name _), val) =
            scopeDefNew name val
        



testCoRec :: LanguageMonad m => m [LVal m]
testCoRec = letrec $ \fns -> do
              let f = fns !! 0
                  g = fns !! 1
              let f' = \arg -> do
                         applyM g arg 
              let g' = \arg ->  do
                         applyM f arg
              return [f', g']