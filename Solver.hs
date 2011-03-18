module Solver where
import Type
import System.Mem.Weak
import Control.Monad
import Data.IORef
import Data.Unique
import qualified Data.Set as S
import qualified Data.Map as M
import Data.Map ((!))
import Control.Arrow ((&&&))
import Data.Function
import Data.List
import Data.Maybe
import Lattice
import Data.Monoid
import ObjectTypes

data Var = Var { varDir :: Variance,
                 varID :: Unique,
                 varVarBounds :: IORef (M.Map Unique (Weak Var)),
                 varConstBound :: IORef (SmallTerm Var) }

instance Eq Var where (==) = (==) `on` varID
instance Ord Var where compare = compare `on` varID
instance Show Var where
    show v = "$" ++ show (hashUnique (varID v)) ++ show (varDir v)

varNewUnconstrained dir = do
  id <- newUnique
  varBounds <- newIORef (M.empty)
  varConstBound <- newIORef (identitySmallTerm dir)
  return $ Var dir id varBounds varConstBound

varGetVarBounds v = do
  bounds <- readIORef $ varVarBounds v
  vars <- forM (M.toList bounds) (deRefWeak . snd)
  -- FIXME: remove gc-ed vars from bounds?
  return $ map fromJust $ filter isJust vars

varNewCloned' v = do
  id <- newUnique
  varBounds <- readIORef (varVarBounds v)
  constBound <- readIORef (varConstBound v)
  varBoundsR <- newIORef varBounds
  constBoundR <- newIORef constBound
  return $ Var (varDir v) id varBoundsR constBoundR

varSetVarBounds' v vs = do
  refs <- forM vs (\x -> mkWeakPtr x Nothing)
  let bndmap = M.fromList $ zip (map varID vs) refs
  writeIORef (varVarBounds v) bndmap

varAddVarBound (vneg, vpos) 
    | varDir vneg == Neg && varDir vpos == Pos = do
  varAddVarBound' vneg vpos
  varAddVarBound' vpos vneg
      where
        varAddVarBound' v b = do
          ref <- mkWeakPtr b Nothing
          modifyIORef (varVarBounds v) $ M.insert (varID b) ref

varDelVarBound (vneg, vpos) = do
  True <- varCheckVarBound vneg vpos
  del vneg vpos
  del vpos vneg
      where
        del v1 v2 = modifyIORef (varVarBounds v1) $
                    M.delete (varID v2)

varCheckVarBound v b | varDir v == Neg && varDir b == Pos = do
  bounds <- readIORef $ varVarBounds v
  return $ M.member (varID b) bounds


varGetConstBound v = readIORef $ varConstBound v
varSetConstBound v = writeIORef $ varConstBound v


--varConstrainConstBound :: v* -> T* -> IO ()
varConstrainConstBound v bnd = do
  oldbnd <- varGetConstBound v
  let newbnd = mergeSmallTerm (varDir v) oldbnd bnd
  varSetConstBound v newbnd


varNewPair = do
  vpos <- varNewUnconstrained Pos
  vneg <- varNewUnconstrained Neg
  varAddVarBound (vneg, vpos) -- vneg <= vpos
  return (vneg, vpos)

varNewConst dir bound = do
  v <- varNewUnconstrained dir
  varSetConstBound v bound
  return v


--FIXME verify
decomposeSmallConstraint :: (SmallTerm Var, SmallTerm Var) -> Maybe [(Var,Var)]
decomposeSmallConstraint (t1, t2) = -- t1 <= t2
  let (ctor, ts) = mergeConstructed Pos t1 t2
      valid = ctor == cnConstructor t2
      mkConstraint (dir, Just v1, Just v2) =
          [flipByVariance dir (v1', v2') |
           v1' <- v1, v2' <- v2]
      mkConstraint _ = []
  in if valid then Just $ ts >>= mkConstraint else Nothing


incrClose' :: (SmallTerm Var, SmallTerm Var) -> IO ()
incrClose' cn =
  putStrLn ("close:" ++ show (fst cn) ++ "<:" ++ show (snd cn)) >>
  --FIXME error messages
  let (Just cns) = decomposeSmallConstraint cn
  in sequence_ [incrClose (SConstraintVarVar a b) |
                (a,b) <- cns]
{-
  let (ctor, ts) = mergeConstructed Pos t1 t2
  let valid = ctor == cnConstructor t2
  when (not valid) (putStrLn "ohshit") -- FIXME
  forM_ ts $ \(dir, v1, v2) -> do
    when (isJust v1 && isJust v2) $ do
      let vpairs = [(v1', v2') | 
                    v1' <- fromJust v1, v2' <- fromJust v2]
      forM_ (map (flipByVariance dir) vpairs) $ \(a,b) -> 
          incrClose $ SConstraintVarVar a b
-}

incrClose :: SmallConstraint Var -> IO ()
-- incrClose :: (T+ <= T-) -> IO ()

-- FIXME termination
incrClose (SConstraintVarVar vpos vneg) 
    | varDir vpos == Pos && varDir vneg == Neg = do
-- wtf  present <- varCheckVarBound vpos vneg
-- when (not present) $ do
    putStrLn $ "close:" ++ show vpos ++ "<:" ++ show vneg
    posbnd <- varGetVarBounds vpos
    negbnd <- varGetVarBounds vneg
    sequence [varAddVarBound (vn, vp) | vn <- posbnd, vp <- negbnd]
    vposbnd <- varGetConstBound vpos
    vnegbnd <- varGetConstBound vneg
    forM negbnd $ \vp -> do
      -- vpos <= vp
      varConstrainConstBound vp vposbnd
    forM posbnd $ \vn -> do
      -- vn <= vneg
      varConstrainConstBound vn vnegbnd
  
    incrClose' (vposbnd, vnegbnd)
  

incrClose (SConstraintVarBound dir var bound) = do
  varbnd <- varGetVarBounds var


  forM varbnd $ \v -> do
    varConstrainConstBound v bound
  cbnd <- varGetConstBound var

  incrClose' $ flipByVariance dir (cbnd, bound)




-- Type schemes for generalised terms (e.g. top-level functions)
data TypeScheme = TypeScheme [Var] Var

validTypeSchemeDirs (TypeScheme vs v) = 
    all ((==Neg).varDir) vs && varDir v == Pos

-- Create a renamed copy of a type scheme
-- Used when a generalised term is referred to
instantiateTypeScheme :: TypeScheme -> IO TypeScheme
instantiateTypeScheme sch@(TypeScheme vs v) | validTypeSchemeDirs sch = do
  vars <- reachableVariables (v:vs)
  vars' <- mapM varNewCloned' vars
  putStrLn $ show vars ++ " ~~> " ++ show vars'
  applySubsitution (M.fromList $ zip vars vars') vars' sch

-- Variables which are part of a type scheme must not be aliased
-- outside the scheme. All constraints on type scheme variables
-- must already have been applied by the time the scheme is
-- optimised.
optimiseTypeScheme :: TypeScheme -> IO TypeScheme
optimiseTypeScheme sch@(TypeScheme vs v) | validTypeSchemeDirs sch = do
  vars <- reachableVariables (v:vs)
  canonise vars
  -- canonise can add more variables, so we
  -- recalculate the reachable set (this could
  -- be done faster, but this is simpler)
  vars <- reachableVariables (v:vs)
  sub <- minimise vars
  applySubsitution sub vars sch
--  return sch

-- must be given a complete set of root variables
-- also performs a complete garbage collection on the graph
reachableVariables :: [Var] -> IO [Var]
reachableVariables roots = do
  seen <- newIORef M.empty
  let visit v = do
        modifyIORef seen $ M.insert (varID v) v
        vs <- liftM (concat . cnFields) $ varGetConstBound v
        forM_ vs $ \v' -> do
          s <- readIORef seen
          when (not $ M.member (varID v') s) (visit v')
{-        vs <- varGetVarBounds v
        forM_ vs $ \v' -> do
          s <- readIORef seen
          when (not $ M.member (varID v') s) (visit v')-}
  mapM_ visit roots
  found <- readIORef seen
  -- Garbage collection: only those variables reachable
  -- via decomposing constructed bounds are kept.
  -- variables only reachable as var-var bounds are dropped.
  forM_ (M.toList found) $ \(vid,v) -> do
    modifyIORef (varVarBounds v) (`M.intersection` found)
  return $ M.elems found

-- for debugging: version of reachableVariables that performs
-- no GC. May only see a part of the type graph if not given
-- a complete set of roots.
reachableVariables' :: [Var] -> IO [Var]
reachableVariables' roots = do
  seen <- newIORef M.empty
  let visit v = do
        modifyIORef seen $ M.insert (varID v) v
        vs <- liftM (concat . cnFields) $ varGetConstBound v
        forM_ vs $ \v' -> do
          s <- readIORef seen
          when (not $ M.member (varID v') s) (visit v')
        vs <- varGetVarBounds v
        forM_ vs $ \v' -> do
          s <- readIORef seen
          when (not $ M.member (varID v') s) (visit v')
  mapM_ visit roots
  found <- readIORef seen
  return $ M.elems found


-- perform a variable renaming on a type scheme
-- does not change the shape of the constructed bounds
applySubsitution sub vars (TypeScheme vs v) = do
  let subvar v = do
        vbounds <- varGetVarBounds v
        let vbounds' = sortednub (map (sub!) vbounds)
        varSetVarBounds' v vbounds'
        cbound <- varGetConstBound v
        varSetConstBound v (fmap (map (sub!)) cbound)
  mapM_ subvar vars
  return $ TypeScheme (map (sub!) vs) (sub ! v)

-- Pick an arbitrary element from a list, whose elements
-- must all be the same.
-- equivalent to "head", with some extra asserts
same [] = error "same: empty list"
same xs | all (==(head xs)) xs = head xs
        | otherwise = error "same: elements differ"


-- canonise takes the set of reachable variables of a type scheme
canonise :: [Var] -> IO ()
canonise vars = do
  newvarsR <- newIORef M.empty
  initialisedR <- newIORef M.empty
  -- newvars represents the variables to be inserted
  -- initialised represents the set of inserted variables 
  -- that have been given correct bounds. Computing the
  -- bounds of a variable may require introducing yet more
  -- variables, so we keep iterating until newvars is empty
  let subst [] = error "wtf how did you get an empty set"
      subst [v] = return [v] -- already canonical
      subst vs' = do
        let vs = S.fromList vs'
        newvars <- readIORef newvarsR
        initialised <- readIORef initialisedR
        let varmap = newvars `M.union` initialised
        if (M.member vs varmap) 
          then return [varmap ! vs]
          else do
            let dir = same (map varDir vs')
            newv <- varNewUnconstrained dir
            modifyIORef newvarsR (M.insert vs newv)
            return [newv]
      clean v = do
        bound <- varGetConstBound v
        newfields <- mapM subst (cnFields bound)
        varSetConstBound v (bound {cnFields = newfields})
      initBounds (vars,newv) = do
        let variance = same (map varDir $ S.toList vars)
        forM_ (S.toList vars) $ \v -> do
          bnd <- varGetConstBound v
          varConstrainConstBound newv bnd
          varbnds <- varGetVarBounds v
          forM_ varbnds $ \v' -> do
            varAddVarBound $ flipByVariance (opVariance variance) (newv, v')
        modifyIORef newvarsR (M.delete vars)
        modifyIORef initialisedR (M.insert vars newv)
        clean newv
      recVarAdd = do
        newvars <- readIORef newvarsR
        initialised <- readIORef initialisedR
        if newvars == M.empty
          then return ()
          else do
            forM_ (M.toList newvars) initBounds
            recVarAdd
  forM_ vars clean
  recVarAdd


partFinder :: Ord a => [[a]] -> a -> Int
partFinder p = 
    let getp = M.fromList [(v,i) |
                           (i,vs) <- zip [0..] p, 
                           v <- vs]
    in (getp!)

fromSingleton [x] = x
fromSingleton _ = error "Not a singleton list"

minimise :: [Var] -> IO (M.Map Var Var)

minimise vars = do
  boundsets <- liftM (M.fromList . zip vars) $
               mapM (liftM M.keysSet . 
                     readIORef . varVarBounds) vars
  cbounds <- liftM (M.fromList . zip vars) $
             mapM (liftM (fmap fromSingleton) . 
                   readIORef . varConstBound) vars
  let initPartition = groupOn (varDir &&& (cnConstructor . (cbounds!)) &&& (boundsets!)) vars
      recSplit p = let newp = splitPartition p 
                   in if newp == p then p else recSplit newp
      splitPartition :: [[Var]] -> [[Var]]
      splitPartition p = 
        let part = partFinder p
        in concat $ map (groupOn (map part . cnFields . (cbounds!))) p
      bestPartition = recSplit initPartition
  -- Now we have the coarsest valid partition
  -- We can optimise the type scheme by picking a 
  -- representative variable for each equiv. class
  -- and dropping the rest.
  let replacements = M.fromList [(v,head vs) |
                                 vs <- bestPartition,
                                 v <- vs]
  return replacements


allM :: Monad m => [a] -> (a -> m Bool) -> m Bool
allM xs f = foldM (\a b -> liftM (a &&) b) True (map f xs)

entailed :: (Var,Var) -> IO Bool
--entailed (var- <= var+)
entailed cn = do
  -- hist is the set of constraints that we have already
  -- proved, and those that we have decomposed and are
  -- trying to prove. We can assume all of these to already
  -- hold: if they're part of a decomposition assuming them
  -- leads to an inductive proof.
  hist <- newIORef S.empty
  let entailed' cn = do
        putStrLn ("?:" ++ show cn)
        hfound <- liftM (S.member cn) $ readIORef hist
        if hfound 
          then putStrLn ("hist:" ++ show cn) >> return True
          else do
            let (vn,vp) = cn
            vbound <- varCheckVarBound vn vp
            if vbound 
              then putStrLn ("tauto:"++show cn) >> return True
              else do
                modifyIORef hist (S.insert cn)
                vp' <- varGetConstBound vp
                vn' <- varGetConstBound vn
                decompose (vn',vp')
      decompose (tneg,tpos) = do
        let (ctor,ts) = mergeConstructed Pos tneg tpos
            valid = ctor == cnConstructor tpos
            decompConstraint (dir, Just a, Just b) = 
                [flipByVariance dir (fromSingleton a,
                                     fromSingleton b)]
            decompConstraint _ = []
            subcns = ts >>= decompConstraint
        if valid
          then allM subcns entailed'
          else return False
  entailed' cn



subsumes :: (Var,Var) -> IO Bool
-- subsumes (var+ <= rigid+)
-- subsumes (rigid- <= var-)
subsumes cn = do
  -- We keep track of the changes we make to the constraint
  -- graph so we can undo them later
  changes <- newIORef S.empty
  rigidVars <- newIORef S.empty
  let subsumes' (v1,v2) = do
        let variance = same [varDir v1, varDir v2]
            (var,rigid) = flipByVariance variance (v1,v2)
            newcns x = flipByVariance variance (x,rigid)
        modifyIORef rigidVars $ S.insert rigid
        varbounds <- varGetVarBounds var
        --FIXME check
        valid <- allM varbounds $ \v -> do
          isrigid <- liftM (S.member v) $ readIORef rigidVars
          let cns = newcns v
          if isrigid
            then entailed cns
            else do
              varAddVarBound cns
              modifyIORef changes $ S.insert cns
              return True
        v1b <- varGetConstBound v1
        v2b <- varGetConstBound v2
        if (not valid)
          then return False
          else let cns = decomposeSmallConstraint (v1b,v2b)
               in maybe (return False) (flip allM subsumes') cns
  ans <- subsumes' cn
  changes <- liftM S.toList $ readIORef changes
  forM changes varDelVarBound
  return ans
                

showTypeGraph :: Var -> IO ()
showTypeGraph v = do
  let showV v = do
        vbounds <- varGetVarBounds v
        bound <- varGetConstBound v
        let allbounds = intercalate "," $ map show vbounds ++ [show bound]
        let (s1,s2) = flipByVariance (varDir v) (allbounds, show v)
        putStrLn $ s1 ++ " <= " ++ s2
  vars <- reachableVariables' [v]
  forM_ vars showV
     
