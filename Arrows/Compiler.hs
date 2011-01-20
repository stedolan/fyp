{-# LANGUAGE Arrows, TypeSynonymInstances, MultiParamTypeClasses #-}
module Compiler where
import Data.List
import Data.Function
import Control.Arrow
import Control.Monad
import Control.Arrow.Transformer hiding (lift)
import qualified Control.Arrow.Transformer as ArrTrans
import Control.Arrow.Operations hiding (write)
import Control.Monad.RWS.Lazy

import ArrowCoalesce
import ArrowIterate
import qualified Data.Map as M
import Language 
import Data.Maybe
import ArrowState

type Label = String
runCompiler :: Compiler () () -> [String] -> (String, [String])
runCompiler p lbls = let (out, _, code) = runRWS (runKleisli (runCoalesced (runState p)) [((), lbls)]) () 1 
                     in (writeLLVM code, concat $ map snd $ out)

type Codegen = Kleisli (RWS () [LLVMInsn] Int)


data LLVMInsn = LLVMLabel [Label] | LLVMBranch Label | LLVMInsn String
writeLLVMLabels :: [Label] -> String
writeLLVMLabels (l:rest) = concat [from ++ ":\n" ++ "br label %" ++ to ++ ";\n"
                                   | (to, from) <- reverse $ zip (l:rest) rest]
                           ++
                           l ++ ":\n"

writeLLVM :: [LLVMInsn] -> String
writeLLVM [] = ""
writeLLVM (LLVMBranch l':LLVMLabel ls:rest) 
    | l' `elem` ls = case (ls \\ [l']) of
                       [] -> writeLLVM rest
                       ls' -> writeLLVM [LLVMBranch (head ls')]
                              ++ 
                              writeLLVMLabels ls'
                              ++
                              writeLLVM rest

writeLLVM (x:rest) = s ++ writeLLVM rest
                     where
                       s = case x of
                             LLVMLabel l -> writeLLVMLabels l
                             LLVMBranch l -> "br label %" ++ l ++ ";\n"
                             LLVMInsn s -> s ++ ";\n"

fresh = Kleisli $ \() -> modify (+1) >> get
writelist = Kleisli tell
write = proc x -> writelist -< [x]

freshLabel = proc () -> do
  n <- fresh -< ()
  returnA -< "L"++show n
freshVar = proc () -> do
  n <- fresh -< ()
  returnA -< "%t"++show n


type Compiler = StateArrow [Label] (MultiArrow Codegen)




codegen :: Codegen a [([Label], b)] -> Compiler a b
codegen c = (proc x -> do
              st <- fetch -< () 
              ArrTrans.lift (liftC write) -< LLVMLabel st
              out <- ArrTrans.lift (liftC c) -< x
              returnA -< out)
            >>> ArrTrans.lift distribute >>>
            (proc (s, x) -> do
               store -< s
               returnA -< x)

stmtgen c = codegen $ proc val -> do
              val' <- c -< val
              l <- freshLabel -< ()
              write -< LLVMBranch l
              returnA -< [([l],val')]

expgen exp = stmtgen $ proc val -> do
               e <- freshVar -< ()
               s <- arr exp -< val
               write -< LLVMInsn $ e ++ " = " ++ s
               returnA -< e



instance ArrowInterpreter Compiler String where
    cond = codegen $ proc b -> do
             tpart <- freshLabel -< ()
             fpart <- freshLabel -< ()
             write -< LLVMInsn$"br i1 "++b++", label %"++tpart++", label %"++fpart
             returnA -< [([tpart], True), ([fpart], False)]

    primBinOp op = expgen $ \(e1, e2) -> getop op ++ " " ++ e1 ++ ", " ++ e2
        where
          getop OpPlus = "add i32"
          getop OpEq = "icmp eq i32"
          getop OpNeq = "icmp ne i32"
    litInt i = expgen (\() -> "add i32 0, " ++ show i)
    varGet (Var v) = expgen $ const $ "load i32* %" ++ v
    varSet (Var v) = stmtgen $ proc e -> write -< LLVMInsn$"store i32 "++e++", i32* %"++v








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


