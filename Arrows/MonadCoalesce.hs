{-# LANGUAGE MultiParamTypeClasses #-}
module MonadCoalesce where
import Data.Monoid
import Control.Monad
import Control.Monad.State
import Control.Monad.Identity
import Control.Monad.Error
import Data.Either

class Monad m => MonadCoalesce m where
    coalesceLeft :: Monoid a => m (Either a b) -> m (Either a b)

coalesceM :: (MonadCoalesce m, Monoid a) => m a -> m a
coalesceM = liftM (either id undefined) . coalesceLeft . liftM Left

instance (MonadCoalesce m, Monoid s) => MonadCoalesce (StateT s m) where
    coalesceLeft f = StateT $ \s -> 
                       liftM pullState $ coalesceLeft $ liftM pushState $ runStateT f s
        where
          pushState (Left x, s) = Left (x,s)
          pushState (Right x, s) = Right (x,s)
          pullState (Left (x,s)) = (Left x, s)
          pullState (Right (x,s)) = (Right x, s)

instance MonadCoalesce Identity where
    coalesceLeft = id

instance (Error e, MonadCoalesce m) => MonadCoalesce (ErrorT e m) where
    coalesceLeft f = ErrorT $ liftM swapE $ coalesceLeft $ liftM swapE $ runErrorT f
        where
          swapE :: Either x (Either y z) -> Either y (Either x z)
          swapE = either (Right . Left) (either Left (Right . Right))
