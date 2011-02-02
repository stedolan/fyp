{-# LANGUAGE Arrows, TypeOperators, MultiParamTypeClasses, FunctionalDependencies, NoMonomorphismRestriction #-}
module Language where
import Control.Arrow
import ArrowCoalesce
import ArrowIterate
import Control.Arrow.Transformer.Error
import Control.Arrow.Transformer
import Control.Arrow.Operations

import Control.Monad
import qualified Control.Monad.Error as E
import Data.Monoid
import ListT
import MonadCoalesce
import MonadIterate

evalExpr :: (ArrowInterpreter (#) e) => Expr -> () # e
evalExpr (BinOpE op exp1 exp2) = proc () -> do
                            exp1 <- evalExpr exp1 -< ()
                            exp2 <- evalExpr exp2 -< ()
                            primBinOp op -< (exp1, exp2)
                            
evalExpr (VarRef v) = varGet v

evalExpr (LitInt i) = litInt i
    

data LoopQuitException = LoopBreak | LoopContinue deriving Eq
instance E.Error LoopQuitException where
    noMsg = undefined
    strMsg = undefined

eval :: (ArrowInterpreter (#) e) => Program -> ErrorArrow LoopQuitException (#) () ()
eval prog = lift coalesce >>> case prog of
     (If e p1 p2) -> proc () -> do
                      e <- lift (evalExpr e) -< ()
                      c <- lift cond -< e
                      case c of
                        True -> eval p1 -< ()
                        False -> eval p2 -< ()
     (While e p) -> lift (fixiter $ coalesce >>> proc _ -> 
                          (do
                            c <- lift cond <<< lift (evalExpr e) -< ()
                            case c of 
                              True -> arr Right <<< eval p -< ()
                              False -> returnA -< Left ())
                           `runError` \ex -> case ex of
                                               LoopBreak -> returnA -< Left ()
                                               LoopContinue -> returnA -< Right ())
     (Seq p1 p2) -> eval p1 >>> eval p2

     (Asgn v e) -> proc () -> do
                    e <- lift (evalExpr e) -< ()
                    lift (varSet v) -< e

     Break -> proc () -> raise -< LoopBreak
     Continue -> proc () -> raise -< LoopContinue

{-
distribM = msum
collectM f =  do {x <- f; return [x]}
coalesceM f = do {xs <- collectM f; return (mconcat xs);}
-}

class MonadIterate m => LanguageMonad m v e | m -> v e where
    condM :: e -> m Bool
    primBinOpM :: BinOp -> e -> e -> m e
    litIntM :: Int -> m e
    varSetM :: Var -> e -> m ()
    varGetM :: Var -> m e

evalExprM :: LanguageMonad m v e => Expr -> m e
evalExprM (BinOpE op exp1 exp2) = do
                            exp1 <- evalExprM exp1
                            exp2 <- evalExprM exp2
                            primBinOpM op exp1 exp2
                            
evalExprM (VarRef v) = varGetM v

evalExprM (LitInt i) = litIntM i
    



--type InterpM a = forall s . ST s a
--type InterpM a = StateMonad (Map Int Val) a
--type CompilerM a = StateMonad [LabelSet] (ListT Codegen)


evalM :: LanguageMonad m v e => Program -> E.ErrorT LoopQuitException m ()
evalM prog = coalesceM $ case prog of
     (If e p1 p2) -> do val <- E.lift $ evalExprM e
                        c <- E.lift $ condM val
                        case c of
                          True -> evalM p1
                          False -> evalM p2

     (While e p) -> E.lift $ MonadIterate.loop $ do
                              loop <- E.runErrorT $
                                      do
                                        v <- E.lift $ evalExprM e
                                        c <- E.lift $ condM v
                                        case c of
                                          True -> liftM Right $ evalM p
                                          False -> return $ Left ()
                              return $ case loop of
                                         Left (LoopBreak) -> Left ()
                                         Left (LoopContinue) -> Right ()
                                         Right (Left _) -> Left ()
                                         Right (Right _) -> Right ()

     (Seq p1 p2) -> evalM p1 >> evalM p2

     (Asgn v exp) -> do
                    e <- E.lift $ evalExprM exp
                    E.lift $ varSetM v e

     Break -> E.throwError LoopBreak
     Continue -> E.throwError LoopContinue



runProgram p = proc () -> (eval p -< ()) `runError` \x -> error "misplaced break/continue" -< ()
runProgramM p = do
  x <- E.runErrorT (evalM p)
  case x of 
    Left e -> error "misplaced break/continue"
    Right f -> return f

data Var = Var String deriving (Ord,Eq)
instance Show Var where
    show (Var v) = "$" ++ v
data BinOp = OpPlus | OpEq | OpNeq
data Expr = BinOpE BinOp Expr Expr | VarRef Var | LitInt Int
data Program = If Expr Program Program
             | While Expr Program
             | Seq Program Program
             | Asgn Var Expr
             | Break
             | Continue


class (ArrowIterate (#), ArrowCoalesce (#)) => ArrowInterpreter (#) e | (#) -> e where
    cond :: e # Bool
    primBinOp :: BinOp -> (e, e) # e
    litInt :: Int -> () # e
    varGet :: Var -> () # e
    varSet :: Var -> e # ()
