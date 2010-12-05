module Type where

import Data.Monoid
import Data.Maybe
import Data.List
import Data.Char
import qualified Data.Set as S
import Control.Monad
import Control.Arrow
import Control.Monad.ST
import Data.STRef
import Data.Function


data Variance = Pos -- Covariant, or a lower bound type
              | Neg -- Contravariant, or an upper bound type
                deriving (Eq, Ord, Show)

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


data GroundSig = GroundSig [Constructor]
data Constructor = Constructor String [Label] deriving (Show)
instance Eq Constructor where
    Constructor s1 _ == Constructor s2 _ = s1 == s2


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


commonLabels (Constructor _ l1) (Constructor _ l2) =
    -- PERF (sorted lists/merge)
    unzip3 [(i1,i2,l) | (i1,l) <- en l1, (i2, l') <- en l2, l == l']
    where
      en = zip [0..]


-- A type bound
-- A note on "deriving Eq":
--  Structural equality does not hold for general TypeTerms, for instance
--  Merge [Merge[t]] == Merge[t]. However, we make sure never to directly
--  construct a Merge type, rather we use "merge" to normalise the types
--  so that structural equality holds.
data TypeTerm v = Const Constructor [TypeTerm v]
                | TVar v
                | Merge [TypeTerm v] -- in a Pos type, Merge is least-upper-bound
                  deriving Eq

-- for debugging
instance Show a => Show (TypeTerm a) where
    show (Const (Constructor name _) ts) =
        if not (any isAlpha name) && length ts == 2 then
            show (ts !! 0) ++ " " ++ name ++ " " ++ show (ts !! 1)
        else
            name ++ (concat $ map ((" "++) . show) ts)
    show (TVar v) = "$" ++ filter (/='"') (show v)
    show (Merge ts) = "{" ++ intercalate ", " (map show ts) ++ "}"


mergeIdentity :: Variance -> TypeTerm v
mergeIdentity Neg = Const groundTop []
mergeIdentity Pos = Const groundBot []
mergeZero v = mergeIdentity (Neg `mappend` v)


mergeConstructed :: Variance -> TypeTerm v -> TypeTerm v -> 
                    (Constructor, [(Variance, Maybe (TypeTerm v), Maybe (TypeTerm v))])
mergeConstructed v (Const c1@(Constructor _ lbls1) t1) (Const c2@(Constructor _ lbls2) t2) = 
    -- PERF (sorted lists/merge)
    let c'@(Constructor _ lbls') = groundMerge getGroundSig v c1 c2
        find l x t = do { i<- findIndex (==l) x; return$ t !! i; }
    in (c', [(labelVariance l, find l lbls1 t1, find l lbls2 t2) | l <- lbls'])
        
        


merge v xs =
    let flat = xs >>= flatten
        (varslong, consts) = partition sepVarConst flat
        const = if null consts then identity else foldl1 mergeConst consts 
        vars = nub varslong
        identity = mergeIdentity v
        zero = mergeZero v
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
          sepVarConst (Const _ _) = False
          mergeConst t1 t2 = 
              let (ctor, ts) = mergeConstructed v t1 t2
              in Const ctor (map mergeSubterm ts)
                 where
                   mergeSubterm (v', Nothing, Just y) = y
                   mergeSubterm (v', Just x, Nothing) = x
                   mergeSubterm (v', Nothing, Nothing) = mergeIdentity (v `mappend` v')
                   mergeSubterm (v', Just x, Just y) = merge (v `mappend` v') [x,y]

-- Type containment: a partial order on positive or negative type bounds
typeContained :: Eq v => Variance -> TypeTerm v -> TypeTerm v -> Bool
typeContained Pos a b = merge Pos [a,b] == b
typeContained Neg a b = merge Neg [a,b] == a

mkC n ts =
    let (GroundSig cs) = getGroundSig 
    in Const (fromJust $ find (==Constructor n undefined) cs) ts
    
-- Constraints are of the form PosType <= NegType
data Constraint v = Constraint (TypeTerm v) (TypeTerm v) deriving Show

-- Elementary constraints are of the forms
--  Var <= Var, Var <= ConstructedTerm or ConstructedTerm <= Var
data ElementaryConstraint v = ConstraintVarVar v v
                            | ConstraintVarBound Variance v (TypeTerm v)
                              deriving Show

checkElementaryConstraint (Constraint a b) = 
    case (a,b) of
      (TVar v, Const _ _) -> Just $ ConstraintVarBound Neg v b
      (Const _ _, TVar v) -> Just $ ConstraintVarBound Pos v a
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
            (t1@(Const c1 _), t2@(Const c2 _)) -> 
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
checkSmallConstraint (ConstraintVarBound v var (Const c ts)) = 
    SConstraintVarBound v var (SmallTerm c (map fromMergeVar ts))
        where
          fromMergeVar (Merge vs) = map fromVar vs
          fromMergeVar (TVar v) = [v]
          fromVar (TVar v) = v

fromSmallTerm v (SmallTerm c ms) = Const c (map (merge v . map TVar) ms)
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