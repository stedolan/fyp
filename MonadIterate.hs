module MonadIterate where
import Control.Monad
import Control.Monad.State.Lazy
import Control.Monad.Identity
import Control.Monad.Reader
import Control.Monad.Error

import Data.Monoid
import MonadCoalesce

class MonadCoalesce m => MonadIterate m where
    fixiterM :: Monoid a => (a -> m (Either b a)) -> a -> m b

loop f = fixiterM (const f) ()

instance (MonadIterate m, Monoid s)  => MonadIterate (StateT s m) where
    fixiterM fn init = StateT (\initst ->
                           fixiterM ( \ ~(x, s) -> liftM pullEither (runStateT (fn x) s)) 
                           (init,initst))
        where
          pullEither ~(e, s) = either (\l -> Left (l,s)) (\r -> Right (r,s)) e

instance (MonadIterate m) => MonadIterate (ReaderT r m) where
    fixiterM fn init = ReaderT $ \r -> fixiterM (\x -> runReaderT (fn x) r) init

instance (MonadIterate m, Error e) => MonadIterate (ErrorT e m) where
    fixiterM fn init = ErrorT $ fixiterM (\x -> liftM packError $ runErrorT $ fn x) init
        where
          packError :: Either e (Either b a) -> Either (Either e b) a
          packError = either (Left . Left) (either (Left . Right) Right)

instance MonadIterate Identity where
    fixiterM f x = do
      y <- f x
      case y of
        Left l -> return l
        Right r -> fixiterM f r
