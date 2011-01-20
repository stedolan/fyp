{-# LANGUAGE Arrows #-}
module ArrowIterate where
import Control.Arrow


class ArrowChoice a => ArrowIterate a where
    iter :: a (Either b s) (Either c s) -> a b c

    iter f = arr Left >>> (fixiter $ proc s -> do
               s' <- f -< s
               case s' of
                 Left l -> returnA -< Left l
                 Right r -> returnA -< Right (Right r))
    fixiter :: a s (Either x s) -> a s x
    fixiter f = iter $ proc s -> f -< either id id s


instance ArrowIterate (->) where
    iter f x = i (f (Left x))
        where
          i (Left x) = x
          i (Right s) = i (f (Right s))



