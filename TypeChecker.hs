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
import qualified Data.Map as M
import Data.Unique

newtype ConstraintGen a = ConstraintGen (ListT IO a)
    deriving (Monad,MonadIterate,MonadCoalesce)

-- FIXME coalesceM
runConstraintGen (ConstraintGen f) = do
  rets <- runAllListT f
  (rn, rp) <- varNewPair
  forM rets $ \r -> incrClose $ SConstraintVarVar r rn
  return rp


cgen = ConstraintGen . lift

{-

newtype GeneralisationID = GeneralisationID Unique deriving (Eq,Ord)


data GVar = Ungen GeneralisationID Var | Gen TypeScheme

currGenID :: ConstraintGen GeneralisationID
currGenID = undefined

getVar :: GVar -> ConstraintGen Var
getVar (Ungen gid var) = do
  currid <- currGenID
  if currid == gid
    then return var
    else do
      copyVarToScheme var

type ClosureMap a = M.Map a 
-}
{- letrec must also do something silly with strictness -}


instance LanguageMonad ConstraintGen (Var,Var) (Var,Var) Var where 
    condM e = ConstraintGen $ do
      bool <- lift $ varNewConst Neg (getC "bool" [])
      lift $ incrClose (SConstraintVarVar e bool)
      (return True `mplus` return False)

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