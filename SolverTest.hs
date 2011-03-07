module SolverTest where
import Lattice
import Type
import Solver
import Data.Monoid
import Control.Monad

import Parser
import Lexer
import UserType
import Text.PrettyPrint
import qualified Data.Map as M
import Language
import DebugSemantics

-- type of "method(x) do return x end"
idFunc = do
  (vn,vp) <- varNewPair
  varNewConst Pos $ getC "=>" [[vn],[vp]]

twocrown = do { (an,ap) <- varNewPair; (bn,bp) <- varNewPair; f1 <- varNewConst Pos $ getC "=>" [[bn],[ap,bp]]; varNewConst Pos $ getC "=>" [[an],[f1]]; }

-- type of "if cond then id else id"
doubleID = do
  t1 <- idFunc -- noFunc Pos
  t2 <- idFunc
  (vn,vp) <- varNewPair
  incrClose (SConstraintVarVar t1 vn)
  incrClose (SConstraintVarVar t2 vn)
  return vp

extraVars v = do
  (vn,vp) <- varNewPair
  incrClose (SConstraintVarVar v vn)
  return vp


anyFunc d = do
  inp <- varNewConst (d `mappend` Neg) $ getC "Top" []
  outp <- varNewConst d $ getC "Bot" []
  varNewConst d $ getC "=>" [[inp],[outp]]

noFunc d = do
  inp <- varNewConst (opVariance d) $ getC "Bot" []
  outp <- varNewConst d $ getC "Top" []
  varNewConst d $ getC "=>" [[inp],[outp]]

coTypeOp v = do
  farg <- varNewConst (opVariance $ varDir v) $ getC "Bot" []
  varNewConst (varDir v) $ getC "=>" [[farg],[v]]

fixCoTypeOp d = do
  (ap,an) <- liftM (flipByVariance d) varNewPair
  fan <- coTypeOp an
  incrClose $ uncurry SConstraintVarVar (flipByVariance d (fan,ap))
  return an

entailmentTest = do
  b <- fixCoTypeOp Pos
  a <- noFunc Neg
  putStrLn $ "a: " ++ show a
  showTypeGraph a
  putStrLn $ "b: " ++ show b
  showTypeGraph b
  entailed (a,b)



subsumptionTest = do
  x <- noFunc Pos
  y <- anyFunc Pos
  putStrLn $ "x: " ++ show x
  showTypeGraph x
  putStrLn $ "y: " ++ show y
  showTypeGraph y
  subsumes (y,x)


testType s = do
  let ut = fmap render $ fromSingleton $ runDebugSemantics' $ runEval' (SymbolTable M.empty M.empty) $ parseType $ runLexer $ s
  print ut
  t <- fromUserType Pos ut
  showTypeGraph t
  ut' <- toUserType t
  print ut'