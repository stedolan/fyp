module UserType where
import Lattice
import Type
import Solver
import qualified Data.Set as S
import qualified Data.Map as M
import Data.Map ((!))
import Data.Monoid
import Data.List
import Data.IORef
import Control.Monad
import Control.Arrow ((&&&),(***))

import Foreign.StablePtr -- oh god

data UserType t = UserType (TypeTerm t) [Constraint t]
instance Functor UserType where
    fmap f (UserType tt cns) = UserType (fmap f tt) (map (fmap f) cns)

type UniqMap = M.Map Var (Either Var (SmallTerm Var))

-- pTypeVar uniqs norec v -> (rec, tt)
-- where tt represents v and refers to variables in "rec" 
-- and expands no variables in "norec"
pTypeVar :: UniqMap -> S.Set Var -> Var ->
            IO (S.Set Var, TypeTerm Var)
pTypeVar uniq norec v | (v `S.member` norec) || 
                        not (v `M.member` uniq) = 
  return $ (S.singleton v, TVar v)
pTypeVar uniq norec v = do
  let uniqbnd = uniq ! v
  case uniqbnd of
    Left v -> return (S.singleton v, TVar v)
    Right con -> pConst uniq (S.insert v norec) con

pConst uniq norec con = do
  parts <- forM (cnFields con) $ \[v'] -> do
             pTypeVar uniq norec v'
  let (rec, fields) = mconcat $ map (id *** (:[])) parts
  return (rec, Const (CN (cnConstructor con) fields))
  

getUniq :: Var -> IO (Maybe (Either Var (SmallTerm Var)))
getUniq v = do
  vbounds <- varGetVarBounds v
  con <- varGetConstBound v
  print (v,vbounds,con)
  case (vbounds,con) of
    ([], con) -> return $ Just $ Right con
    --FIXME varpairs?
    ([v'], con) | con == identitySmallTerm (varDir v) -> return $ Just $ Left v'
    _ -> return $ Nothing



getVarConstraints :: IORef (S.Set Var) -> UniqMap -> Var -> IO [TypeTerm Var]
getVarConstraints recR uniq v = do
  vbounds <- liftM (map TVar) $ varGetVarBounds v
  con <- varGetConstBound v
  if con == identitySmallTerm (varDir v)
    then return vbounds
    else do
      (rec,tt) <- pConst uniq (S.singleton v) con
      modifyIORef recR (S.union rec)
      return (tt:vbounds)

pVarConstraints r u v = do
  cns <- getVarConstraints r u v
  let newcn x = uncurry Constraint $ 
                flipByVariance (varDir v) $
                (x,TVar v)
  return $ map newcn cns


-- Converts a (canonical) type to a user type
toUserType :: Var -> IO (UserType Var)
toUserType rootv = do
  vars <- reachableVariables rootv
  toprint <- newIORef S.empty
  printed <- newIORef S.empty
  uniqs <- liftM (M.fromList . concat) $ 
             forM vars $ \v -> do
               u <- getUniq v
               return $ maybe [] (\x -> [(v,x)]) u
  (rec, maintype) <- pTypeVar uniqs S.empty rootv
  modifyIORef toprint (S.union rec)
  let allcns = do
        toprint' <- readIORef toprint
        printed' <- readIORef printed
        cns <- forM (S.toList (toprint' `S.difference` printed')) $
          pVarConstraints toprint uniqs
        modifyIORef printed (S.union toprint')
        print cns
        if null cns then return [] else liftM (concat cns++) allcns
  cns <- allcns
  -- FIXME: we can do better than sortednub
  return $ UserType maintype (sortednub cns)


fromUserType :: Ord t => Variance -> UserType t -> IO Var
fromUserType dir (UserType tt cns) = do
  varmapR <- newIORef M.empty
  ptrsR <- newIORef []
  let cvtType dir (TVar v) = do
        varmap <- readIORef varmapR
        vpair <- if M.member v varmap
                   then return (varmap ! v)
                   else do
                     newvpair <- varNewPair
                     ptr <- newStablePtr newvpair
                     modifyIORef ptrsR $ (ptr:)
                     modifyIORef varmapR $ M.insert v newvpair
                     return newvpair
        return $ fst $ flipByVariance (dir `mappend` Neg) vpair
      cvtType dir (Const con) = do
        parts <- sequence [cvtType (dir `mappend` d) t | 
                           (d,t) <- zip (constParamDirs (cnConstructor con))
                                        (cnFields con)]
        varNewConst dir $ fmap (:[]) $ (CN (cnConstructor con) parts)
  maintype <- cvtType dir tt
  putStrLn "\n0"
  showTypeGraph maintype
  forM cns $ \(Constraint a b) -> do
    a' <- cvtType Pos a
    b' <- cvtType Neg b
    incrClose (SConstraintVarVar a' b')
  putStrLn "\n1"
  showTypeGraph maintype
  putStrLn ""
  ptrs <- readIORef ptrsR
  forM_ ptrs freeStablePtr
  return maintype

instance Show t => Show (UserType t) where
    show (UserType tt []) = show tt
    show (UserType tt cns) = show tt ++ " | " ++ intercalate ", " (map show cns)