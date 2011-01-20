{-# LANGUAGE Arrows, TypeOperators, MultiParamTypeClasses, FunctionalDependencies #-}
module Language where
import Control.Arrow
import ArrowCoalesce
import ArrowIterate
evalExpr :: (ArrowInterpreter (#) e) => Expr -> () # e
evalExpr (BinOpE op exp1 exp2) = proc () -> do
                            exp1 <- evalExpr exp1 -< ()
                            exp2 <- evalExpr exp2 -< ()
                            primBinOp op -< (exp1, exp2)
                            
evalExpr (VarRef v) = varGet v

evalExpr (LitInt i) = litInt i
    
                    

eval :: (ArrowInterpreter (#) e) => Program -> () # ()
eval prog = coalesce >>> case prog of
     (If e p1 p2) -> proc () -> do
                      e <- evalExpr e -< ()
                      c <- cond -< e
                      case c of
                        True -> eval p1 -< ()
                        False -> eval p2 -< ()
     (While e p) -> fixiter $ coalesce >>> arr (\ ~() -> ()) >>> proc () -> do
                     c <- cond <<< evalExpr e -< ()
                     case c of 
                       True -> arr Right <<< eval p -< ()
                       False -> returnA -< Left ()
     (Seq p1 p2) -> eval p1 >>> eval p2

     (Asgn v e) -> proc () -> do
                    e <- evalExpr e -< ()
                    varSet v -< e



data Var = Var String deriving (Ord,Eq)
instance Show Var where
    show (Var v) = "$" ++ v
data BinOp = OpPlus | OpEq | OpNeq
data Expr = BinOpE BinOp Expr Expr | VarRef Var | LitInt Int
data Program = If Expr Program Program
             | While Expr Program
             | Seq Program Program
             | Asgn Var Expr


class (ArrowIterate (#), ArrowCoalesce (#)) => ArrowInterpreter (#) e | (#) -> e where
    cond :: e # Bool
    primBinOp :: BinOp -> (e, e) # e
    litInt :: Int -> () # e
    varGet :: Var -> () # e
    varSet :: Var -> e # ()
