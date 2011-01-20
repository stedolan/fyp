{-# LANGUAGE Arrows, FlexibleInstances, MultiParamTypeClasses, GeneralizedNewtypeDeriving #-}
module Interpreter where
import Control.Arrow
import qualified Control.Category as Cat
import Control.Arrow.Transformer hiding (lift)
import qualified Control.Arrow.Transformer as ArrTrans
import Control.Arrow.Operations hiding (write)

import qualified Data.Map as M
import Data.Maybe

import Language
import ArrowIterate
import ArrowCoalesce
import ArrowState


data Val = ValBool Bool | ValInt Int
instance Show Val where
    show (ValBool b) = show b
    show (ValInt i) = show i

newtype Interpreter a b = Interpreter (StateArrow (M.Map Var Val) (->) a b) deriving (Arrow,ArrowChoice,ArrowIterate,Cat.Category)
instance ArrowState (M.Map Var Val) Interpreter where {fetch = Interpreter fetch; store = Interpreter store;}

instance ArrowCoalesce Interpreter where

instance ArrowInterpreter Interpreter Val where
    cond = proc c -> case c of
                       ValBool True -> returnA -< True
                       ValBool False -> returnA -< False
    primBinOp OpPlus = arr $ \(ValInt i1, ValInt i2) -> ValInt $ i1 + i2
    primBinOp OpEq = arr $ \(ValInt i1, ValInt i2) -> ValBool $ i1 == i2
    primBinOp OpNeq = arr $ \(ValInt i1, ValInt i2) -> ValBool $ i1 /= i2

    litInt i = arr (const $ ValInt i)

    varGet v = fetch >>> arr (\s -> fromJust $ M.lookup v s)
    varSet v = proc e -> do
                 s <- fetch -< () 
                 store -< M.insert v e s

--runInterpreter :: (StateArrow (M.Map Var Val) (->)) () () -> M.Map Var Val
runInterpreter (Interpreter p) x = snd $ runState p ((), x)
