{-# LANGUAGE TypeSynonymInstances, GeneralizedNewtypeDeriving, FlexibleInstances, MultiParamTypeClasses #-}
module TypeChecker where
import Control.Monad
import Control.Monad.Reader
import Data.IORef
import Language hiding (Var)
import MonadIterate
import ListT
import MonadCoalesce
import qualified Solver
import Solver (Var,TypeScheme(TypeScheme))
import Type
import Lattice
import ObjectTypes
import UserType
import qualified Data.Map as M
import Data.Unique

type Constraints = ReaderT GeneralisationLevel IO
newtype ConstraintGen a = ConstraintGen (ListT Constraints a)
    deriving (Monad,MonadIterate,MonadCoalesce)

varNewPair :: Constraints (GVar, GVar)
varNewPair = do
  genID <- asks generalisationID
  (vn,vp) <- lift $ Solver.varNewPair
  return (Ungen $ UngenVar genID vn, Ungen $ UngenVar genID vp)
varNewConst d b = do
  genID <- asks generalisationID
  var <- lift $ Solver.varNewConst d b
  return $ Ungen $ UngenVar genID var
varNewUnconstrained d = lift $ Solver.varNewUnconstrained d
instantiateTypeScheme s = lift $ Solver.instantiateTypeScheme s
optimiseTypeScheme s = lift $ Solver.optimiseTypeScheme s
varConstrain a b = do
  a' <- getVar a
  b' <- getVar b
  lift $ Solver.incrClose (SConstraintVarVar a' b')

-- FIXME coalesceM
runConstraintGen (ConstraintGen f) = do
  rets <- runAllListT f
  (rn, rp) <- varNewPair
  forM rets $ \r -> varConstrain r rn
  return rp


cgen = ConstraintGen . lift

-- Each GeneralisationLevel represents a nested generalised construct
data GeneralisationLevel = GeneralisationLevel {
  generalisationID :: GeneralisationID,
  importedVars :: IORef (M.Map UngenVar (Var,Var))
}

newtype GeneralisationID = GeneralisationID Unique deriving (Eq,Ord)


data UngenVar = UngenVar GeneralisationID Var deriving (Eq,Ord)
instance Show UngenVar where show (UngenVar _ v) = show v

data GVar = Ungen UngenVar | Gen [UngenVar] TypeScheme

--getUngenVar :: UngenVar -> ConstraintGen Var
getUngenVar ugvar@(UngenVar gid var) = do
  currid <- asks generalisationID
  if currid == gid
    then return var
    else do
      imported <- asks importedVars
      importedMap <- lift $ readIORef imported
      case (M.lookup ugvar importedMap) of
        Just (vn,vp) -> return vp
        Nothing -> do
                   (vn,vp) <- lift $ Solver.varNewPair
                   lift $ writeIORef imported $ M.insert ugvar (vn,vp) importedMap
                   return vp


getVar :: GVar -> Constraints Var

-- Refer to an ungeneralised binding
getVar (Ungen unv) = getUngenVar unv

-- Instantiate a generalised binding
getVar (Gen closed scheme) = do
  TypeScheme closedV' ty' <- instantiateTypeScheme scheme
  lift $ do
    putStrLn "instatiation"
    print closedV'
    t <- toUserType ty'
    print t
  closedV <- mapM getUngenVar closed
  forM_ (zip closedV closedV') $ \(a,b) -> 
      lift $ Solver.incrClose $ SConstraintVarVar a b
  return ty'


generalise :: Constraints UngenVar -> Constraints GVar
generalise cn = do
  currstate <- ask
  imported <- lift $ newIORef M.empty
  genID <- lift $ newUnique
  let substate = GeneralisationLevel {
        generalisationID = GeneralisationID genID,
        importedVars = imported }
  UngenVar _ ty <- lift $ runReaderT cn substate
  (ugvars,vars) <- liftM (unzip . M.toList) $ lift $ readIORef imported
  sch <- optimiseTypeScheme (TypeScheme (map fst vars) ty)

  lift $ do
    let (TypeScheme vars ty) = sch
    putStrLn $ "Generalised closing over: " ++ show ugvars ++ show vars
    t <- toUserType ty
    print t

  return $ Gen ugvars sch

doLambda :: (GVar -> ConstraintGen GVar) -> Constraints UngenVar
doLambda f = do
  (argN, argP) <- varNewPair
  ret <- runConstraintGen $ f argP
  argN' <- getVar argN
  ret' <- getVar ret
  Ungen v <- varNewConst Pos (getC "=>" [[argN'],[ret']])
  return v
  


instance LanguageMonad ConstraintGen () (UngenVar,UngenVar) GVar where 

    condM e = ConstraintGen $ do
      bool <- lift $ varNewConst Neg (getC "bool" [])
      lift $ varConstrain e bool
      (return True `mplus` return False)


    lambdaM f = cgen $ liftM Ungen $ doLambda f

    applyM f arg = cgen $ do
      (retN, retP) <- varNewPair
      arg' <- getVar arg
      retN' <- getVar retN
      funcT <- varNewConst Neg (getC "=>" [[arg'],[retN']])
      varConstrain f funcT
      return retP

    litIntM i = cgen $ varNewConst Pos (getC "int" [])
    litBool i = cgen $ varNewConst Pos (getC "bool" [])
    voidValue = cgen $ varNewConst Pos (getC "void" [])

    varNewM = cgen $ do
      (Ungen vn, Ungen vp) <- varNewPair
      return (vn,vp)
    varSetM (vn, vp) e = cgen $ varConstrain e (Ungen vn)
    varGetM (vn, vp) = cgen $ return $ Ungen vp



    structNewM fs = cgen $ do
      vs <- liftM concat $ forM fs $ \_ -> do
              (vn,vp) <- lift Solver.varNewPair
              return [vn,vp]
      varNewConst Pos (getCFields fs (map (:[]) vs))

    structGetM s fname = cgen $ do
      (fn, fp) <- varNewPair
      unused <- varNewUnconstrained Pos
      fn' <- getVar fn
      s' <- varNewConst Neg (getCField fname ([unused], [fn']))
      varConstrain s s'
      return fp

    structSetM s fname v = cgen $ do
      unused <- varNewUnconstrained Neg
      v' <- getVar v
      s' <- varNewConst Neg (getCField fname ([v'], [unused]))
      varConstrain s s'

    -- FIXME generalisation needs to happen
    letrec fns = do
      fn <- cgen $ generalise $ do
        (vn,vp) <- varNewPair
        [[funcbody]] <- runAllListT $ (\(ConstraintGen x) -> x) $ fns [vp]
        ty <- doLambda funcbody
        varConstrain (Ungen ty) vn
        return ty
      return [fn]