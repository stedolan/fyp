module SymbolMap (Symbol(), makeSymbol, fromSymbol, hashSymbol,
                  SymbolMap(), empty, singleton, delete, insert) where

import Data.Int
import Data.Monoid
import Data.Word
import Data.Bits
import Data.Char
import qualified Data.List
import qualified Data.IntMap as M

-- A Symbol is a string with a precomputed hash code
data Symbol = Symbol !Int !String

hashSymbol (Symbol i s) = i

-- Equality and ordering check the hash code first before falling back to string compare
instance Eq Symbol where
    (Symbol i1 s1) == (Symbol i2 s2) = i1 == i2 && s1 == s2
instance Ord Symbol where
    (Symbol i1 s1) `compare` (Symbol i2 s2) = compare i1 i2 `mappend` compare s1 s2

instance Show Symbol where
    show (Symbol i s) = show s


-- Some messiness to convert a Word32 hash to a sensible Int 
-- regardless of the number of bits in an Int.
-- (at top level to ensure this is only calculated once)
wordToIntShift = head [i | i <- [0..], (toInteger (maxBound::Word32) `shiftR` i) <= toInteger (maxBound::Int)]


makeSymbol :: String -> Symbol
makeSymbol s = Symbol (toInt hash) s
    where
      -- Hash function based on the 32-bit FNV1a hash
      hash = foldl fnv_update fnv_offset $ map (fromIntegral . ord) s
      fnv_update h d = (h `xor` d) * fnv_prime
      fnv_offset = 2166136261 :: Word32
      fnv_prime = 16777619 :: Word32
      -- truncate the necessary number of bits to make the hash fit
      -- in an Int.
      toInt :: Word32 -> Int
      toInt i = (fromIntegral (i `shiftR` wordToIntShift))


fromSymbol :: Symbol -> String
fromSymbol (Symbol h s) = s

newtype SymbolMap a = SymbolMap (M.IntMap [(Symbol,a)]) 
    deriving Show -- FIXME: the default Show will be pretty ugly


-- Manipulation functions for assocation lists
-- Used as hash buckets to resolve collisions in the IntMap
lmustfind s m = case lfind s m of
                  Nothing -> error $"Symbol "++show s++" not found in map"
                  Just x -> x
lfind s m = Data.List.lookup s m
lput x@(s,v) [] = [(s,v)]
lput x@(s,v) (p1@(s',v'):xs) | s' == s = x:xs
                             | otherwise = p1:(lput x xs)
ldel' s [] = []
ldel' s (p1@(s',v'):xs) | s == s' = xs
                        | otherwise = p1:(ldel' s xs)
ldel s m = case (ldel' s m) of
             [] -> Nothing
             x -> Just x

lsingle s v = lput (s,v) []
ljoin xs1 xs2 = foldl (flip lput) xs2 xs1


-- Actual manipulation functions for SymbolMap
-- Only a few IntMap functions are wrapped at the moment, more will be added as needed.
empty = SymbolMap$ M.empty
singleton s v = SymbolMap$ M.singleton (hashSymbol s) (lsingle s v)
insert s v (SymbolMap m) = SymbolMap$ M.insertWith ljoin (hashSymbol s) (lsingle s v) m
delete s (SymbolMap m) = SymbolMap$ M.update (ldel s) (hashSymbol s) m
lookup s (SymbolMap m) = M.lookup (hashSymbol s) m >>= lfind s
