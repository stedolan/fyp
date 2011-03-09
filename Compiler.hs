{-# LANGUAGE Arrows, TypeSynonymInstances, MultiParamTypeClasses, TypeFamilies #-}
module Compiler where
import Data.List
import Data.Function
import Control.Monad
import Control.Monad.RWS.Lazy

import qualified Data.Map as M
import qualified Data.Set as S
import Language 
import Data.Maybe

import ListT
import MonadCoalesce
import MonadIterate
import LLVMGen
import Structs
import Scoping
import qualified Control.Monad.State.Lazy as STM


type CompilerM = STM.StateT [Value] (ListT Scoping)

instance LLVMWriter CompilerM where
    writelist xs = lift $ lift $ writelist xs



codegenM :: Scoping [([Value], b)] -> CompilerM b
codegenM c = do
  st <- get
  write $ LLVMLabel st
  out <- lift $ lift $  c
  (s, x) <- lift (liftList out)
  put s
  return x


stmtgen c = codegenM $ do
  val <- c
  l <- lift $ freshLabel
  write $ LLVMBranch l
  return [([l],val)]



dethread :: CompilerM a -> Scoping a
-- FIXME coalesceM
dethread c = do
  beforelbl <- lift $ freshLabel
  write $ LLVMBranch beforelbl
  [(ret, afterlbl)] <- runAllListT (STM.runStateT (c) [beforelbl])
  write $ LLVMLabel afterlbl
  return ret


instance LanguageMonad CompilerM where
    type LType CompilerM = ()
    type LVal CompilerM = Value
    type LVar CompilerM = Value
    condM b = codegenM $ do
             tpart <- lift $ freshLabel
             fpart <- lift $ freshLabel
             write $ LLVMInsn OpBranch Nothing [b,tpart,fpart]
             return [([tpart], True), ([fpart], False)]


{-
    primBinOpM op e1 e2 = stmtgen $ lift $ expgen objectT' (getop op) [e1,e2]
        where
          getop OpPlus = OpAdd
          getop OpEq = OpCmpEq
          getop OpNeq = OpCmpNe
-}
    primBinOpM OpPlus e1 e2 = stmtgen $ lift $ expgen objectT' OpCall [rtIntAdd, e1, e2]

--    litIntM i = return (Value (TBaseType "i32") (show i))
    litIntM i = stmtgen $ lift $ expgen objectT' OpCall [rtIntNew, (Value (TBaseType "i32") (show i))]

    voidValue = return (Value objectT' "null")

    varNewM = stmtgen $ varNew
    varGetM v = stmtgen $ varGet v
    varSetM v val = stmtgen $ varSet v val

    structNewM fs = stmtgen $ lift $ structNew fs
    structGetM s f = stmtgen $ lift $ structGet s f
    structSetM s f x = stmtgen $ lift $ structSet s f x

    lambdaM fn = stmtgen $ lambda (dethread . fn)
    applyM f v = stmtgen $ apply f v

    typeNew = return ()
    typeConstrain _ = return ()

runCompiler x = generateCode (dethread x)






{-



data Type = TyUnknown | TyInt | TyBool | TyInvalid deriving (Eq,Show)
instance Monoid Type where
    TyUnknown `mappend` x = x
    x `mappend` TyUnknown = x
    TyInt `mappend` TyInt = TyInt
    TyBool `mappend` TyBool = TyBool
    _ `mappend` _ = TyInvalid

    mempty = TyUnknown

newtype CombiningMap k a = CombiningMap {getMap :: M.Map k a} deriving Show
instance (Ord k, Monoid a) => Monoid (CombiningMap k a) where
    x `mappend` y = CombiningMap $ (M.unionWith mappend `on` getMap) x y
    mempty = CombiningMap $ M.empty


type TypeChecker = StateArrow (CombiningMap Var Type) (MultiArrow (Kleisli (RWS () [String] ())))

checkType :: Eq a => a -> TypeChecker a ()
checkType t' = ArrTrans.lift $ liftC $ Kleisli $ \t -> 
               tell $ if t == t' then [] else ["type error"]

instance ArrowInterpreter TypeChecker Type where
    cond = checkType TyBool >>> proc _ -> ArrTrans.lift distribute -< [True,False]
    primBinOp op = checkType (fst $ types op) >>> arr (const $ snd $ types op)
        where
          types OpPlus = ((TyInt, TyInt), TyInt)
          types OpEq = ((TyInt, TyInt), TyBool)
          types OpNeq = ((TyInt, TyInt), TyBool)
    litInt _ = arr (const TyInt)

    varGet v = fetch >>> arr (\s -> fromJust $ M.lookup v (getMap s))
    varSet v = proc e -> do
                 s <- fetch -< () 
                 store -< CombiningMap $ M.insert v e (getMap s)

runTypeChecker :: TypeChecker () () -> ([((), CombiningMap Var Type)], (), [String])
runTypeChecker p = runRWS (runKleisli (runCoalesced (runState p)) [((), mempty)]) () ()


-}