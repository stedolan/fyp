{-# LANGUAGE Arrows, TypeOperators, MultiParamTypeClasses, FunctionalDependencies #-}
module Language where
import Control.Arrow
import ArrowCoalesce
import ArrowIterate
import Control.Arrow.Transformer.Error
import Control.Arrow.Transformer
import Control.Arrow.Operations

evalExpr :: (ArrowInterpreter (#) e) => Expr -> () # e
evalExpr (BinOpE op exp1 exp2) = proc () -> do
                            exp1 <- evalExpr exp1 -< ()
                            exp2 <- evalExpr exp2 -< ()
                            primBinOp op -< (exp1, exp2)
                            
evalExpr (VarRef v) = varGet v

evalExpr (LitInt i) = litInt i
    

data LoopQuitException = LoopBreak | LoopContinue deriving Eq

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

runProgram p = proc () -> (eval p -< ()) `runError` \x -> error "misplaced break/continue" -< ()

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
