{-# LANGUAGE TypeSynonymInstances, GeneralizedNewtypeDeriving, FlexibleInstances, MultiParamTypeClasses #-}
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
import ObjectTypes

newtype ConstraintGen a = ConstraintGen (ListT IO a)
    deriving (Monad,MonadIterate,MonadCoalesce)

-- FIXME coalesceM
runConstraintGen (ConstraintGen f) = do
  [ret] <- runAllListT f
  return ret


cgen = ConstraintGen . lift

{- letrec must also do something silly with strictness -}


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

    litIntM i = cgen $ varNewConst Pos (getC "int" [])
    litBool i = cgen $ varNewConst Pos (getC "bool" [])
    voidValue = cgen $ varNewConst Pos (getC "void" [])

    varNewM = cgen $ varNewPair
    varSetM (vn, vp) e = cgen $ incrClose (SConstraintVarVar e vn)
    varGetM (vn, vp) = cgen $ return vp


    structNewM fs = cgen $ do
      vs <- liftM concat $ forM fs $ \_ -> do
              (vn,vp) <- varNewPair
              return [vn,vp]
      varNewConst Pos (getCFields fs (map (:[]) vs))

    structGetM s fname = cgen $ do
      (fn, fp) <- varNewPair
      unused <- varNewUnconstrained Pos
      s' <- varNewConst Neg (getCField fname ([unused], [fn]))
      incrClose (SConstraintVarVar s s')
      return fp

    structSetM s fname v = cgen $ do
      unused <- varNewUnconstrained Neg
      s' <- varNewConst Neg (getCField fname ([v], [unused]))
      incrClose (SConstraintVarVar s s')

    -- FIXME generalisation needs to happen
    letrec = undefined