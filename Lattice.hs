{-# LANGUAGE EmptyDataDecls,MultiParamTypeClasses,FunctionalDependencies #-}
module Lattice where
import Data.Monoid


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






data PosT
data NegT

class VarianceT t where
    variance :: t -> Variance
instance VarianceT PosT where variance = const Pos
instance VarianceT NegT where variance = const Neg
class (VarianceT v1, VarianceT v2) => OpVariance v1 v2 | v1 -> v2, v2 -> v1 where
instance OpVariance PosT NegT
instance OpVariance NegT PosT
