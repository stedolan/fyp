{-# LANGUAGE GeneralizedNewtypeDeriving, TypeSynonymInstances #-}
module Structs where
import Data.List
import Data.Function
import Control.Monad
import Control.Monad.State
import Control.Monad.RWS.Lazy

import qualified Data.Map as M
import qualified Data.Set as S
import LLVMGen
import Data.Maybe

type FieldName = String

type Field obj field = (obj -> field, field -> obj -> obj)

focus :: MonadState obj m => Field obj field -> State field a -> m a 
focus (getter,setter) mod = do
  st <- get
  let (a, st') = runState mod (getter st)
  put (setter st' st)
  return a


type StructGen = RWS () LLVMCode StructGenState

data StructGenState = StructGenState {
      freshCtr' :: Int,
      structs' :: M.Map (S.Set FieldName) Value,
      internedNames' :: M.Map String Value
}

freshCtr = (freshCtr', \x s -> s{freshCtr'=x})
structs = (structs', \x s -> s{structs'=x})
internedNames = (internedNames', \x s -> s{internedNames'=x})



typetableT = TBaseType "%typetable"
typetableT' = TPtr typetableT
typetableT'' = TPtr typetableT'
fieldnameT = TBaseType "%fieldname"
fieldnameT' = TPtr fieldnameT
objectT = TBaseType "%object"
objectT' = TPtr objectT
objectT'' = TPtr objectT'


--runtime functions
--rtSetField = Value (TBaseType "<func>") "@object_set_field"
--rtGetField = Value (TBaseType "<func>") "@object_get_field"
rtIndexType = Value (TBaseType "<func>") "@typetable_get_index"
rtGetType = Value (TBaseType "<func>") "@object_get_type"
rtAlloc = Value (TBaseType "<func>") "@gcalloc"

rtIntNew = Value (TBaseType "<func>") "@int_new"
rtIntAdd = Value (TBaseType "<func>") "@int_add"



fresh :: StructGen Int
fresh = focus freshCtr $ do
  modify (+1)
  get


internName s = focus internedNames $ do
  found <- gets $ M.lookup s
  if isJust found
    then return $ fromJust found
    else do
      let i32 = TBaseType "i32"
          i8 = TBaseType "i8"
          sz = length s
          g = Value (TPtr (TStruct [i32,i32,TArray sz i8])) ("@F."++s)
      modify $ M.insert s g
      return g


class Monad m => LLVMWriter m where
    writelist :: [LLVMInsn] -> m ()
    write :: LLVMInsn -> m ()
    write x = writelist [x]

instance LLVMWriter StructGen where
    writelist = tell

freshLabel = do
  n <- fresh
  return $ Value labelT ("L"++show n)

freshVar typ = do
  n <- fresh
  return $ Value typ ("%t"++show n)
freshGlobal typ = do
  n <- fresh
  return $ Value (TPtr typ) ("@g" ++ show n)

freshInfVar typ = do
  n <- fresh
  return $ [Value typ ("%t"++show n++"$"++show i) | i <- [0..]]

-- returns a typetable*
genStructTable :: S.Set FieldName -> StructGen Value
genStructTable fs = do
  found <- focus structs $ gets $ M.lookup fs
  forM (S.toList fs) internName
  case found of
    Just x -> return x
    Nothing -> do
      let i32 = TBaseType "i32"
          i16 = TBaseType "i16"
          i8 = TBaseType "i8"
          typ = TStruct [TStruct [i8,i8,i16], TPtr (TArray 0 objectT), TArray (S.size fs) (TStruct [fieldnameT', TBaseType "i16" ])]
      sname <- freshGlobal typ
      focus structs $ modify (M.insert fs sname)
      return sname

expgen typ op args = do
  e <- freshVar typ
  write $ LLVMInsn op (Just e) args
  return e

structTable s = do
  expgen typetableT' OpCall [rtGetType, s]
structGetIndex vtable field = do
  fieldstr <- internName field
  expgen (TBaseType "i16") OpCall [rtIndexType, vtable, mkConstPtrCast fieldnameT' fieldstr]

structGetPtr s idx = do
  expgen objectT'' OpGEP [s, i32 0, i32 1, idx]
          where
            i32 x = Value (TBaseType "i32") (show x)
structIndex s field = do
  vtable <- structTable s
  idx <- structGetIndex vtable field
  structGetPtr s idx

structNew fields = do
  sname <- genStructTable $ S.fromList fields
  obj <- expgen objectT' OpCall [rtAlloc, mkConstPtrCast typetableT' sname]
  ttptr <- expgen typetableT'' OpGEP [obj, Value (TBaseType "i32") "0", Value (TBaseType "i32") "0"]
  write $ LLVMInsn OpStore Nothing [mkConstPtrCast typetableT' sname, ttptr]
  return obj

structSet s field val = do
  ptr <- structIndex s field
  write $ LLVMInsn OpStore Nothing [val, ptr]

structGet s field = do
  ptr <- structIndex s field
  expgen objectT' OpLoad [ptr]

objRename newval obj = do
  write $ LLVMInsn OpGEP (Just newval) [obj, Value (TBaseType "i32") "0"]

collectCode :: StructGen a -> StructGen (a, LLVMCode)
collectCode f = censor (const mempty) (listen f)
