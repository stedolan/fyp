module Type where

import Data.Monoid
import Data.Maybe
import Data.Array
import Data.Ord
import Data.List
import Data.Char
import qualified Data.Set as S
import qualified Data.IntMap as IM
import Control.Monad
import Control.Arrow
import Control.Monad.ST
import Data.STRef
import Data.Function


data Variance = Pos -- Covariant, or a lower bound type
              | Neg -- Contravariant, or an upper bound type
                deriving (Eq, Ord, Show, Enum)

data Label = Label String Variance deriving (Eq,Ord,Show)
labelVariance (Label n v) = v

instance Monoid Variance where
    mempty = Pos
    Pos `mappend` Pos = Pos
    Pos `mappend` Neg = Neg
    Neg `mappend` Pos = Neg
    Neg `mappend` Neg = Pos


-- LatticeMerge t is a function representing the GLB and LUB functions
-- over a lattice whose elements are of type t
-- (f :: LatticeMerge t) Pos a b = LUB(a,b)
-- (f :: LatticeMerge t) Pos a b = GLB(a,b)
type LatticeMerge t = Variance -> t -> t -> t

-- The partial order of a lattice can be defined in terms of its GLB
-- or LUB functions, since a <= b iff a = GLB(a,b) (or b = LUB(a,b))
latticeSub :: Eq t => LatticeMerge t -> t -> t -> Bool
latticeSub f a b = f Neg a b == a

-- Same as latticeSub but gives <= or >= depending on variance parameter
-- latticeRel f Pos is <=, latticeRel f Neg is <=
latticeRel :: Eq t => LatticeMerge t -> Variance -> t -> t -> Bool
latticeRel f Pos a b = latticeSub f a b
latticeRel f Neg a b = latticeSub f b a

data GroundSig = GroundSig [Constructor]
data Constructor = Constructor String [Label]
instance Eq Constructor where
    Constructor s1 _ == Constructor s2 _ = s1 == s2
instance Ord Constructor where
    compare (Constructor s1 _) (Constructor s2 _) = compare s1 s2
instance Show Constructor where
    show (Constructor s _) = s


getGroundSig :: GroundSig
getGroundSig = GroundSig [Constructor "Bot" [],
                          Constructor "->" [Label "arg" Neg, Label "ret" Pos],
                          Constructor "Top" []]

-- least upper bound or greatest lower bound, depending on variance
groundMerge :: GroundSig -> LatticeMerge Constructor

groundMerge (GroundSig cs) var a b = 
    let
        ia = fromJust $ findIndex (==a) cs
        ib = fromJust $ findIndex (==b) cs
        m = cs !! (combine ia ib)
    in m
    where
      combine = case var of {Pos -> max; Neg -> min;}


[groundTop,groundBot] = 
    let (GroundSig cs) = getGroundSig 
    in map (\x -> fromJust $ find (==Constructor x undefined) cs) ["Top","Bot"]
                                                

-- ground ordering on head type constructors
-- defined in terms of lattice operation (groundMerge)
groundSub :: GroundSig -> Constructor -> Constructor -> Bool
groundSub g = latticeSub (groundMerge g)

groundRel g = latticeRel (groundMerge g)

commonLabels (Constructor _ l1) (Constructor _ l2) =
    -- PERF (sorted lists/merge)
    unzip3 [(i1,i2,l) | (i1,l) <- en l1, (i2, l') <- en l2, l == l']
    where
      en = zip [0..]



type Constructed a = (Constructor, [a])



mergeIdentity :: Variance -> Constructed v
mergeIdentity Neg = (groundTop, [])
mergeIdentity Pos = (groundBot, [])
mergeZero v = mergeIdentity (Neg `mappend` v)


mergeConstructed :: Variance -> Constructed a -> Constructed a -> 
                    (Constructor, [(Variance, Maybe a, Maybe a)])
mergeConstructed v (c1@(Constructor _ lbls1), t1) (c2@(Constructor _ lbls2), t2) = 
    -- PERF (sorted lists/merge)
    let c'@(Constructor _ lbls') = groundMerge getGroundSig v c1 c2
        find l x t = do { i<- findIndex (==l) x; return$ t !! i; }
    in (c', [(labelVariance l, find l lbls1 t1, find l lbls2 t2) | l <- lbls'])

getC n ts = 
    let (GroundSig cs) = getGroundSig 
    in (fromJust $ find (==Constructor n undefined) cs, ts)

mkC n ts = Const $ getC n ts
        



data GroundInstance = GroundInstance [Constructed Int] deriving (Show,Eq)


--sample =GroundInstance$ let c a x = (Constructor a [], x) in [c "c" [1], c"a" [1,3], c"b"[4,5], c"c"[4], c"c"[6], c"c"[7], c"d"[7]]
sample =GroundInstance$ let c a x = (Constructor a [], x) in [c"a" [2,3], c"c"[2], c"b"[4,5], c"c"[4], c"c"[6], c"c"[7], c"d"[7]]

fntoptop = GroundInstance $ [getC "->" [2,3], getC "Top" [], getC "Top" []]
fnbotbot = GroundInstance $ [getC "->" [2,3], getC "Bot" [], getC "Bot" []]
fn1 = GroundInstance $ [getC "->" [2,3], getC "Bot" [], getC "->" [4,5], getC "Top" [], getC "Top" []]
fn2 = GroundInstance $ [getC "->" [3,2], getC "Top" [], getC "->" [4,5], getC "Bot" [], getC "Bot" []]

f1 = GroundInstance$ [getC "->" [1,2], getC "Bot" [], getC "Top" []]
f2 = GroundInstance$ [getC "->" [2,3], getC "->" [1,4], getC "Bot" [], getC "Top" []]

toDot (GroundInstance g) = 
    let edges = [(x,y,p) | (x,(_, succ)) <- zip [1..] g, (p,y) <- zip [1..] succ]
        nodes = [(c,x) | (x,(Constructor c _, _)) <- zip [1..] g]
        n x = "n"++show x
        edgetxt = unlines$ [n x ++ " -> " ++ n y ++ "[label=" ++ show p++"]" | (x,y,p) <- edges]
        nodetxt = unlines$ [n x ++ "[label = \""++s++":"++show x++"\"]" | (s,x) <- nodes]
    in "digraph{\n"++nodetxt++edgetxt++"}\n"

minimiseGroundInstance (GroundInstance txtable) = 
    toGroundInstance (recSplit initPartition)
    where
      nstates = length txtable

      states = array (1, nstates) (zip [1..] txtable)

      getPartition :: [[Int]] -> Array Int Int
      getPartition parts = array (1, nstates) $ concat $
                           [[(state, partidx) | state <- partition] 
                                | (partidx, partition) <- zip [1..] parts]
      successors :: Int -> [Int]
      successors = snd . (states!)


      -- Initial (coarsest possible) partition
      initPartition = map (map fst) $ groupOn (fst . snd) $ zip [1..] txtable

      -- Keep splitting partitions until they stop changing
      recSplit p = 
          let newp = splitPartition p
          in if newp == p then p else recSplit newp

      -- Convert final partition into a minimal state-machine (term automaton)
      toGroundInstance parts = 
          let stateP p = (states ! (head (parts !! (p-1))))
              con = fst . stateP
              succS = snd . stateP
              partlist = getPartition parts
              succP = map (partlist!) . succS
              
              nparts = length parts
              partMachine = array (1,nparts) [(i,succP i) | i <- [1..nparts]]

              -- Find a relabeling of the reduced state machine (partMachine) to normal form
              -- i.e. with all states numbered in depth-first-search order from the root
              -- This has the side-effect of removing unreachable states, as they won't be
              -- assigned a label
              relabel :: Int -> IM.IntMap Int -> IM.IntMap Int
              relabel node mapped =
                  case (IM.lookup node mapped) of
                    Just x -> mapped -- this node has already been visited
                    Nothing -> -- visit this node
                        let succs = partMachine ! node
                            visitall = foldl (flip (.)) id $ map relabel succs
                            newmap = IM.insert node (IM.size mapped + 1) mapped
                        in visitall newmap

              -- We have to ensure that we start from the node in partMachine containing
              -- the original state 1
              relabelmap = relabel (partlist!1) IM.empty
              
              lookuplabel node = fromJust $ IM.lookup node relabelmap
                    
              relabeledMachine = array (1,IM.size relabelmap) [(lookuplabel i, (con i, map lookuplabel $ succP i)) | i <- [1..nparts], i `IM.member` relabelmap]

          in GroundInstance $ elems relabeledMachine
--            (parts, partMachine, relabelmap)
              

      splitPartition :: [[Int]] -> [[Int]]
      splitPartition parts =
          let partlist = getPartition parts
              -- to find the list of successor partitions of a state, find
              -- the partition of each successor state.
              succP :: Int -> [Int]
              succP = map (partlist!) . successors
          in concat $ map (groupOn succP) $ parts

      -- Partition a list into sets by function f s.t. x and y are in the same set
      -- iff f x == f y
      groupOn :: (Ord b) => (a -> b) -> [a] -> [[a]]
      groupOn f = map (map snd) . 
                  groupBy ((==) `on` fst) . 
                  sortBy (comparing fst) . 
                  map (f &&& id)
      partition getP states = groupOn (getP . snd) states


groundInstSub (GroundInstance tx1') (GroundInstance tx2') = 
    let tx1 = array (1,length tx1') (zip [1..] tx1')
        tx2 = array (1,length tx2') (zip [1..] tx2')
        recsub v s1 s2 checked = 
            let already = (s1,s2) `S.member` checked
                hypothesis = (s1,s2) `S.insert` checked
                (ctor, ts) = mergeConstructed Pos (tx1!s1) (tx2!s2)
                validHead = groundRel (getGroundSig) v (fst (tx1!s1)) (fst (tx2!s2))
                validSub (Pos,Just a,Just b) = recsub (v`mappend`Pos) a b hypothesis
                validSub (Neg,Just a,Just b) = recsub (v`mappend`Neg) a b hypothesis
                validSub _ = True
            in already || (validHead && all validSub ts)
        in recsub Pos 1 1 S.empty

groundInstMerge mergedir (GroundInstance tx1') (GroundInstance tx2') = 
    let 

        -- Our newly constructed ground instance will have O(ntx1 * ntx2) states
        -- (most of which are unneeded, this number will be reduced by normalising)
        -- There are more efficient algorithms, but this is the simplest correct
        -- one and normalising will produce the right type anyway (albeit more slowly)

        -- We require that the two input types contain a top/bottom state. This need
        -- not be the case for arbitrary input types, so we always add such states.
        -- The redundant states will be removed by normalisation later.
            

        addedstates = map mergeIdentity [Pos `mappend` mergedir, Neg `mappend` mergedir]
        tx1l = tx1' ++ addedstates
        tx2l = tx2' ++ addedstates

        dirToIdx v = fromEnum (v `mappend` mergedir)

        identState stateArr v = 
            let (1,len) = bounds stateArr
            in (len - 1) + dirToIdx v

        ntx1 = length tx1l
        ntx2 = length tx2l

        tx1 = array (1,ntx1) (zip [1..] tx1l)
        tx2 = array (1,ntx2) (zip [1..] tx2l)

        nnew = ntx1 * ntx2 * 2

        oldStateToNew v a b = 1 + (((a-1) * ntx2 + (b-1)) * 2 + dirToIdx v)

        mergeState :: Variance -> Int -> Int -> Constructed Int
        mergeState v a b =
            let (ctor,ts) = mergeConstructed v (tx1!a) (tx2!b)
                mergeSubterm (subv, ta, tb) = 
                    let v' = v `mappend` subv 
                    in oldStateToNew v' 
                           (maybe (identState tx1 v') id ta) 
                           (maybe (identState tx2 v') id tb)
            in (ctor, map mergeSubterm ts)

        newstatelist = do
          a <- [1..ntx1]
          b <- [1..ntx2]
          v <- [Pos `mappend` mergedir, Neg `mappend` mergedir]
          return (v, a, b, mergeState v a b, mergeConstructed v (tx1!a) (tx2!b))
 
        finalans = GroundInstance $ map (\(a,b,c,x,y) -> x) newstatelist
        in finalans
              
-- A type bound
-- A note on "deriving Eq":
--  Structural equality does not hold for general TypeTerms, for instance
--  Merge [Merge[t]] == Merge[t]. However, we make sure never to directly
--  construct a Merge type, rather we use "merge" to normalise the types
--  so that structural equality holds.
data TypeTerm v = Const (Constructed (TypeTerm v))
                | TVar v
                | Merge [TypeTerm v] -- in a Pos type, Merge is least-upper-bound
                  deriving (Eq,Ord)

-- for debugging
instance Show a => Show (TypeTerm a) where
    show (Const (Constructor name _, ts)) =
        if not (any isAlpha name) && length ts == 2 then
            show (ts !! 0) ++ " " ++ name ++ " " ++ show (ts !! 1)
        else
            name ++ (concat $ map ((" "++) . show) ts)
    show (TVar v) = "$" ++ filter (/='"') (show v)
    show (Merge ts) = "{" ++ intercalate ", " (map show ts) ++ "}"


sortednub :: Ord a => [a] -> [a]
sortednub = map head . group . sort


merge v xs =
    let flat = xs >>= flatten
        (varslong, consts) = partition sepVarConst flat
        const = if null consts then identity else foldl1 mergeConst consts 
        vars = sortednub varslong
        identity = Const $ mergeIdentity v
        zero = Const $ mergeZero v
    in case (const, vars) of
         (_, []) -> const
         (c, _) | c == identity -> case vars of
                                     [] -> identity
                                     [x] -> x
                                     _ -> Merge vars
         (c, _) | c == zero -> zero
         _ -> Merge (const:vars)
        where
          flatten (Merge x) = x
          flatten x = [x]
          sepVarConst (TVar _) = True
          sepVarConst (Const _) = False
          mergeConst (Const t1) (Const t2) = 
              let (ctor, ts) = mergeConstructed v t1 t2
              in Const (ctor, map mergeSubterm ts)
                 where
                   mergeSubterm (v', Nothing, Just y) = y
                   mergeSubterm (v', Just x, Nothing) = x
                   mergeSubterm (v', Nothing, Nothing) = Const $ mergeIdentity (v `mappend` v')
                   mergeSubterm (v', Just x, Just y) = merge (v `mappend` v') [x,y]

-- Type containment: a partial order on positive or negative type bounds
typeContained :: Ord v => Variance -> TypeTerm v -> TypeTerm v -> Bool
typeContained Pos a b = merge Pos [a,b] == b
typeContained Neg a b = merge Neg [a,b] == a

    
-- Constraints are of the form PosType <= NegType
data Constraint v = Constraint (TypeTerm v) (TypeTerm v) deriving Show

-- Elementary constraints are of the forms
--  Var <= Var, Var <= ConstructedTerm or ConstructedTerm <= Var
data ElementaryConstraint v = ConstraintVarVar v v
                            | ConstraintVarBound Variance v (TypeTerm v)
                              deriving Show

checkElementaryConstraint (Constraint a b) = 
    case (a,b) of
      (TVar v, Const _) -> Just $ ConstraintVarBound Neg v b
      (Const _, TVar v) -> Just $ ConstraintVarBound Pos v a
      (TVar v1, TVar v2) -> Just $ ConstraintVarVar v1 v2
      _ -> Nothing


-- Split a constraint into an equivalent set of elementary constraints
-- May fail, in which case the constraint is unsatisfiable
splitConstraint :: Constraint v -> Maybe [ElementaryConstraint v]
splitConstraint constraint@(Constraint a b) =
    case (checkElementaryConstraint constraint) of
      (Just e) -> Just [e]
      Nothing ->
          case (a,b) of
            -- Split Merge-constraints into individual constraints
            (Merge terms, _) -> splitConstraints $ map (`Constraint` b) terms
            (_, Merge terms) -> splitConstraints $ map (a `Constraint`) terms
            -- Here, we know there are no Merges or elementary constraints
            -- So, both sides must be constructed
            (Const t1@(c1,_), Const t2@(c2,_)) -> 
                -- Split a constraint between constructed terms into constraints
                -- between common type parameters according to their variances
                let (ctor, ts) = mergeConstructed Pos t1 t2
                    valid = ctor == c2
                    mkConstraint (Pos,Just a,Just b) = [Constraint a b]
                    mkConstraint (Neg,Just a,Just b) = [Constraint b a]
                    mkConstraint (_,_,_) = []
                in
                  if valid then
                      splitConstraints $ ts >>= mkConstraint
                  else
                      -- FIXME: "Nothing" is a particularly uninformative error
                      -- for an unsatisfiable constraint.
                      Nothing
    where
      splitConstraints :: [Constraint v] -> Maybe [ElementaryConstraint v]
      splitConstraints = fmap join . sequence . map splitConstraint
                  
                



-- Small terms are all of the form
-- Const c [Merge [TVar a,Tvar b,...], Merge [...], ...]
data SmallTerm v = SmallTerm Constructor [[v]] deriving Show

data SmallConstraint v = SConstraintVarVar v v 
                       | SConstraintVarBound Variance v (SmallTerm v) deriving Show



checkSmallConstraint :: ElementaryConstraint v -> SmallConstraint v
checkSmallConstraint (ConstraintVarVar v1 v2) = SConstraintVarVar v1 v2
checkSmallConstraint (ConstraintVarBound v var (Const (c,ts))) = 
    SConstraintVarBound v var (SmallTerm c (map fromMergeVar ts))
        where
          fromMergeVar (Merge vs) = map fromVar vs
          fromMergeVar (TVar v) = [v]
          fromVar (TVar v) = v

fromSmallTerm v (SmallTerm c ms) = Const (c, map (merge v . map TVar) ms)
fromSmallConstraint (SConstraintVarVar v1 v2) = ConstraintVarVar v1 v2
fromSmallConstraint (SConstraintVarBound v var t) = 
    ConstraintVarBound v var (fromSmallTerm v t)


-- Reflexive terms of <=c are not stored in the constraint graph
type GraphTermBound s = (STRef s (SmallTerm (GraphVar s)))
type GraphVarBound s = (STRef s (S.Set (GraphVar s)))
data BiBound t = BiBound t t
data GraphVar s = GraphVar Int (BiBound (GraphVarBound s)) (BiBound (GraphTermBound s))

varID (GraphVar id _ _) = id

instance Eq (GraphVar s) where
    (==) = (==) `on` varID
instance Ord (GraphVar s) where
    compare = compare `on` varID

getBound :: Variance -> BiBound t -> t
getBound Pos (BiBound a b) = a -- getBound Pos = lower bound
getBound Neg (BiBound a b) = b -- getBound Neg = upper bound

varBounds :: Variance -> GraphVar s -> ST s (S.Set (GraphVar s))
varBounds v (GraphVar n bnd _) = readSTRef (getBound v bnd)

addBound :: GraphVar s -> GraphVar s -> ST s ()
addBound v1@(GraphVar n1 bnd1 t1) v2@(GraphVar n2 bnd2 t2) = do
  upper1 <- readSTRef (getBound Neg bnd1)
  lower2 <- readSTRef (getBound Pos bnd2)
  writeSTRef (getBound Neg bnd1) (S.insert v2 upper1)
  writeSTRef (getBound Pos bnd2) (S.insert v1 lower2)

hasBound :: GraphVar s -> GraphVar s -> ST s Bool
hasBound (GraphVar n1 bnd1 t1) v2 = do
  upper1 <- readSTRef (getBound Neg bnd1)
  return (S.member v2 upper1)

{-
incrClose :: SmallConstraint (GraphVar s) -> ST s ()
incrClose (SConstraintVarVar v1 v2) = do
  present <- hasBound v1 v2
  
-}