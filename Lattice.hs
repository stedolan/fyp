{-# LANGUAGE EmptyDataDecls,MultiParamTypeClasses,FunctionalDependencies #-}
module Lattice where
import Data.Monoid
import qualified Data.Set as S


data Variance = Pos -- Covariant, or a lower bound type
              | Neg -- Contravariant, or an upper bound type
                deriving (Eq, Ord, Enum)

flipByVariance Pos = id
flipByVariance Neg = \(a,b) -> (b,a)

opVariance = (`mappend`Neg)

instance Monoid Variance where
    mempty = Pos
    Pos `mappend` Pos = Pos
    Pos `mappend` Neg = Neg
    Neg `mappend` Pos = Neg
    Neg `mappend` Neg = Pos

instance Show Variance where
    show Pos = "+"
    show Neg = "-"

-- A lattice whose elements are of type t
class Eq t => Lattice t where
    -- The GLB and LUB functions
    -- merge Pos a b = LUB(a,b)
    -- merge Neg a b = GLB(a,b)
    merge :: Variance -> t -> t -> t

    -- The partial order (defined in terms of merge)
    (<:=) :: t -> t -> Bool
    -- could equally be defined as merge Pos a b == b
    a <:= b = merge Neg a b == a
    
    -- cmp Pos is <=, cmp Neg is >=
    cmp :: Variance -> t -> t -> Bool
    cmp Pos a b = a <:= b
    cmp Neg a b = b <:= a

    -- extremum Pos == TOP
    -- extremum Neg == BOT
    extremum :: Variance -> t

mergeIdentity v = extremum (v `mappend` Neg)
mergeZero v = extremum v
mergeFailure v = mergeZero v

-- The powerset of a finite set forms a lattice
-- Since we don't know what exactly the finite set is,
-- we can't provide a sane implementation for "top"
instance Ord t => Lattice (S.Set t) where
    merge Pos a b = a `S.union` b
    merge Neg a b = a `S.intersection` b
    extremum Neg = S.empty
    extremum Pos = error "Top element of set lattice is not known"



data PosT
data NegT

class VarianceT t where
    variance :: t -> Variance
instance VarianceT PosT where variance = const Pos
instance VarianceT NegT where variance = const Neg
class (VarianceT v1, VarianceT v2) => OpVariance v1 v2 | v1 -> v2, v2 -> v1 where
instance OpVariance PosT NegT
instance OpVariance NegT PosT
