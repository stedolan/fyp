{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Scoping where
import Data.List
import Data.Function
import Control.Monad
import Control.Monad.Trans
import Control.Monad.RWS.Lazy

import qualified Data.Map as M
import qualified Data.Set as S
import Structs
import LLVMGen
import Data.Maybe


type LLVMFunc = String

type Var = Value

newtype ScopingT m a = Scoping (RWST 
                                 (S.Set Var)  -- Variables closed over from upper scopes
                                 [LLVMFunc]   -- Functions defined
                                 (S.Set Var)  -- Variables used and defined in current function
                                 m a  -- Structs monad provides structure primitives
                                ) deriving (Monad,MonadTrans,MonadFix)
type Scoping = ScopingT (StructGen)
instance LLVMWriter m => LLVMWriter (ScopingT m) where
    writelist xs = Scoping (lift (writelist xs))

functionT = TFunc objectT' [objectT', objectT']
functionT' = TPtr functionT

runSubScope (Scoping x) inscope = do
  ((r, used, newfuncs), code) <- lift $ collectCode (runRWST x inscope S.empty)
  tell newfuncs
  return (r,code,used)

varMark v = modify $ S.insert v

varNew = Scoping $ do
  v <- lift $ structNew ["$"]
  varMark v
  return v

varGet v = Scoping $ do
  varMark v
  lift $ structGet v "$"

varSet v val = Scoping $ do
  varMark v
  lift $ structSet v "$" val

-- genFuncBody generates a new global LLVM function
-- but does not insert any code into the current function
genFuncBody fn = Scoping $ do
  -- Find the set of variables being closed over
  parentvars <- ask
  currentvars <- get
  let inscope = parentvars `S.union` currentvars
      param = Value objectT' "%$param"
  (ret, code, varsused) <- runSubScope (fn param) inscope
  let closedVars = S.toList $ varsused `S.intersection` inscope
      closed = closedVars 
               `zip` 
               ["$closure$"++show i | i <- [0..]]

  -- Mark each of the variables closed over as "used"
  forM closedVars varMark

  -- Generate the LLVM function (the code), which takes an extra parameter
  -- holding the closed environment
  let currentClosure = Value objectT' "%$closure"
  (_, fullcode) <- lift $ collectCode $ do
    forM_ closed $ \(var,field) -> do
      -- FIXME: can structGetIndex directly with some hackery
      ptr <- structIndex currentClosure field
      write $ LLVMInsn OpLoad (Just var) [ptr]
    writelist code
    write $ LLVMInsn OpRet Nothing [ret]
  funcname <- lift $ freshGlobal functionT -- better names?
  tell [writeFunc funcname objectT' [currentClosure, param] fullcode]
  return (funcname, closed)

genClosureHead funcname closed = Scoping $ lift $ do
  -- Generate the closure: a structure containing a function pointer and
  -- a partial environment
  closure <- structNew ("$code$":map snd closed)
  structSet closure "$code$" (mkConstPtrCast objectT' funcname)
  return closure

genClosureFields closure closed = Scoping $ lift $ do
  forM_ closed $ \(var, field) -> do
    structSet closure field var
  return closure

lambda fn = do
  (funcname, closed) <- genFuncBody fn
  closure <- genClosureHead funcname closed
  genClosureFields closure closed

--FIXME buggy as all hell
corecLambda :: ([Value] -> Scoping [Value -> Scoping Value]) -> Scoping [Value]
corecLambda fngen = do
  closures <- lift $ freshInfVar objectT'
  funcs <- fngen closures
  closed <- forM (zip funcs closures) $ \(f,cl) -> do
    (funcname, closed) <- genFuncBody f
    cl' <- genClosureHead funcname closed
    lift $ objRename cl cl'
    return (cl, closed)
  forM closed $ \(cl,closed) -> do
    genClosureFields cl closed

apply closure val = Scoping $ lift $ do
  rawfunction <- structGet closure "$code$"
  funcptr <- expgen functionT' OpPtrCast [rawfunction]
  expgen objectT' OpCall [funcptr, closure, val]



generateCode :: Scoping () -> String
generateCode (Scoping p) = let (((), _, funcs), st, code) = runRWS (runRWST p S.empty S.empty) () (StructGenState 0 M.empty M.empty)
                     in intercalate "\n\n" $ (map pInternedName $ M.toList $ internedNames' st) ++
                                             (map (pStructType $ internedNames' st)
                                                      (M.toList $ structs' st)) ++
                                             (funcs)
    where
      pInternedName (name, Value fieldnameT' sym) =
        let n = litInt32 $ length sym
            hash = litInt32 $ 23
            -- FIXME escaping
            str = Value (TArray (length name) (TBaseType "i8")) ("c"++show name)
            comment = "; Interned \"" ++ name ++ "\"\n"
        in comment ++ sym ++ " = constant " ++ vParam (mkConstStruct [n,hash,str])

      pStructType interns (fields', Value typetableT' sym) =
        let fields = S.toAscList fields'
            hdr = mkConstStruct [litInt8 0, litInt8 0, litInt16 $ length fields]
            perclass = Value (TPtr (TArray 0 objectT)) "null"
            entries = mkConstArr [mkConstStruct [mkConstPtrCast fieldnameT'
                                                     (fromJust $ M.lookup f interns), 
                                                 litInt16 i] 
                                  | (f,i) <- zip fields [0..]]
            comment = "; Structure table for {" ++ intercalate ", " fields ++ "}\n"
        in comment ++ sym ++ " = constant " ++ vParam (mkConstStruct [hdr,perclass,entries])
