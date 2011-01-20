{-# LANGUAGE Arrows, TypeOperators #-}
module ArrowCoalesce where
import Control.Arrow
import qualified Control.Category as Cat
import ArrowIterate
import Data.Monoid

class Arrow (#) => ArrowCoalesce (#) where
    coalesce :: Monoid a => a # a
    coalesce = arr id


mapA f = proc list ->
         case list of 
           [] -> returnA -< []
           (x:xs) -> do
                     y <- f -< x
                     ys <- mapA f -< xs
                     returnA -< (y:ys)



-- The version in Data.Either is not lazy enough
-- at least in oldish GHC versions
partitionEithers :: [Either a b] -> ([a],[b])
partitionEithers = foldr (either left right) ([],[])
 where
  left  a ~(l, r) = (a:l, r)
  right a ~(l, r) = (l, a:r)


newtype MultiArrow (#) a b = MultiArrow {runCoalesced :: [a] # [b]}
collect :: Arrow (#) => MultiArrow (#) a [a]
collect = MultiArrow $ arr $ (:[])
distribute :: Arrow (#) => MultiArrow (#) [a] a
distribute = MultiArrow $ arr $ concat

liftC f = (MultiArrow $ mapA f)

instance ArrowChoice (#) => Cat.Category (MultiArrow (#)) where
    id = arr id
    (MultiArrow a1) . (MultiArrow a2) = MultiArrow ((Cat..) a1 a2)

instance ArrowChoice (#) => Arrow (MultiArrow (#)) where
    arr f = MultiArrow $ arr $ map f
    first (MultiArrow f) = (MultiArrow $ mapA (proc ~(a,s) -> do 
                                                         b <- f -< [a]
                                                         returnA -< map (\x -> (x,s)) b
                                                      )) >>> distribute


instance ArrowChoice (#) => ArrowChoice (MultiArrow (#)) where
    left (MultiArrow f) = MultiArrow $ proc xs -> do
                                let (lefts, rights) = partitionEithers xs
                                lefts' <- if null lefts then returnA -< [] else f -< lefts
                                returnA -< map Right rights ++ map Left lefts'

instance (ArrowChoice (#), ArrowLoop (#)) => ArrowIterate (MultiArrow (#)) where
    fixiter (MultiArrow f) = MultiArrow $ loop $ 
                                 proc (init, looped) -> do
                                   (final, cont) <- arr partitionEithers <<< f -< init ++ looped
                                   returnA -< (final, cont)

instance ArrowChoice (#) => ArrowCoalesce (MultiArrow (#)) where
    coalesce = collect >>> arr mconcat
