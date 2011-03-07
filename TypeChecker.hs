{-# LANGUAGE TypeSynonymInstances, MultiParamTypeClasses, GeneralizedNewtypeDeriving, FlexibleInstances #-}
module TypeChecker where
import Control.Monad
import Control.Monad.RWS.Lazy
import Language hiding (Var)
import MonadIterate
import ListT
import MonadCoalesce
import Solver
import Type
import Lattice

newtype ConstraintGen a = ConstraintGen (ListT IO a)
    deriving (Monad,MonadIterate,MonadCoalesce)

-- FIXME coalesceM
runConstraintGen (ConstraintGen f) = do
  [ret] <- runAllListT f
  return ret


cgen = ConstraintGen . lift


instance LanguageMonad ConstraintGen (Var,Var) (Var,Var) Var where
    condM e = cgen $ do
      bool <- varNewConst Neg (getC "bool" [])
      incrClose (SConstraintVarVar e bool)
      return True `mplus` return False

    lambdaM f = cgen $ do
      (argN, argP) <- varNewPair
      ret <- runConstraintGen $ f argP
      varNewConst Pos (getC "=>" [[argN],[ret]])

    applyM f arg = cgen $ do
      (retN, retP) <- varNewPair
      funcT <- varNewConst Neg (getC "=>" [[arg],[retN]])
      incrClose (SConstraintVarVar f funcT)
      return retP