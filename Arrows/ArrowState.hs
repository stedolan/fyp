{-# LANGUAGE Arrows, TypeOperators, MultiParamTypeClasses, FlexibleInstances #-}
module ArrowState where
import Control.Arrow
import qualified Control.Category as Cat
import Control.Arrow.Transformer hiding (lift)
import qualified Control.Arrow.Transformer as ArrTrans
import Control.Arrow.Operations hiding (write)
import ArrowIterate
import ArrowCoalesce
import Data.Monoid


-- State arrow transformers
-- More or less entirely stolen from Ross Paterson's arrows package
-- http://hackage.haskell.org/package/arrows-0.4.2.0
-- This version is lazier and has support for ArrowIterate

newtype StateArrow s a b c = ST {runState :: a (b, s) (c, s)}

swapsnd :: ((a, b), c) -> ((a, c), b)
swapsnd ~(~(x, y), z) = ((x, z), y)

instance Arrow a => Cat.Category (StateArrow s a) where
	id = ST Cat.id
	(ST g) . (ST f) = ST $ f >>> g

lazypair = \ ~(x,y) -> (x,y)
instance Arrow a => Arrow (StateArrow s a) where
	arr f = ST (arr (\ ~(x, s) -> (f x, s)))
	first (ST f) = ST (arr swapsnd >>> first f >>> arr swapsnd)

instance Arrow a => ArrowTransformer (StateArrow s) a where
	lift f = ST (first f)

mkStateArrow :: Arrow (#) => (a,s) # (b,s) -> StateArrow s (#) a b
mkStateArrow = ST


-- operations

instance Arrow a => ArrowState s (StateArrow s a) where
	fetch = ST (arr (\ ~(_, s) -> (s, s)))
	store = ST (arr (\ ~(s, _) -> ((), s)))


instance ArrowChoice a => ArrowChoice (StateArrow s a) where
	left (ST f) = ST (arr distr >>> left f >>> arr undistr)
		where	distr (Left y, s) = Left (y, s)
			distr (Right z, s) = Right (z, s)
			undistr (Left (y, s)) = (Left y, s)
			undistr (Right (z, s)) = (Right z, s)

instance ArrowApply a => ArrowApply (StateArrow s a) where
	app = ST (arr (\ ~(~(ST f, x), s) -> (f, (x, s))) >>> app)

instance ArrowLoop a => ArrowLoop (StateArrow s a) where
	loop (ST f) = ST (loop (arr swapsnd >>> f >>> arr swapsnd))


instance ArrowIterate (#) => ArrowIterate (StateArrow s (#)) where
    fixiter (ST f) = ST $ fixiter (f >>> arr (\ ~(e,s) -> either (\l -> Left (l,s)) (\r -> Right (r,s)) e))


instance (Monoid s, ArrowCoalesce x) => ArrowCoalesce (StateArrow s x) where
    coalesce = mkStateArrow $ coalesce
