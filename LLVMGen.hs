{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module LLVMGen where
import Data.Monoid
import Control.Monad.Writer
import Data.List


type LLVMCode = [LLVMInsn] 



data Type = TBaseType String | TPtr Type | TStruct [Type] | TArray Int Type | TFunc Type [Type] deriving (Show,Eq,Ord)

voidT = TBaseType "void"
labelT = TBaseType "label"

[litInt32,litInt16,litInt8] = [\i -> Value (TBaseType $ "i" ++ show (t::Int)) (show (i::Int)) | t <- [32,16,8]]

mkConstStruct :: [Value] -> Value
mkConstStruct vs = Value (TStruct $ map vType vs) ("{" ++ commaSep vParam vs ++ "}")
mkConstArr :: [Value] -> Value
mkConstArr vs | length (group $ map vType vs) == 1 =
  Value (TArray (length vs) (vType $ head vs)) ("[" ++ commaSep vParam vs ++ "]")

mkConstPtrCast :: Type -> Value -> Value
mkConstPtrCast t@(TPtr _) v@(Value (TPtr _) _) = 
  Value t ("bitcast(" +-+ vParam v +-+ "to" +-+ showType t++")")
data Value = Value Type String deriving (Show,Eq,Ord)


showType (TBaseType t) = t
showType (TPtr t) = showType t ++ "*"
showType (TStruct ts) = "{" ++ commaSep showType ts ++ "}"
showType (TArray i t) = "[" ++ show i ++ " x " ++ showType t ++ "]"
showType (TFunc ret args) = showType ret +-+ "(" ++ commaSep showType args ++ ")"

vType (Value t s) = t
vReg (Value t s) = s
vParam (Value t s) = showType t +-+ if t == labelT then "%"++s else s

data OpCode = OpCall | OpAdd | OpCmpEq | OpCmpNe | OpLoad | OpStore | OpBranch | OpRet | OpGEP | OpPtrCast  deriving (Eq,Enum,Show)
opName op = case op of
              OpCall -> "call"
              OpAdd -> "add"
              OpCmpEq -> "icmp eq"
              OpCmpNe -> "icmp ne"
              OpLoad -> "load"
              OpStore -> "store"
              OpBranch -> "br"
              OpRet -> "ret"
              OpGEP -> "getelementptr inbounds"
              OpPtrCast -> "bitcast"


data LLVMInsn = LLVMLabel [Value] | LLVMBranch Value | LLVMInsn OpCode (Maybe Value) [Value] deriving Show

writeLLVMLabels :: [Value] -> String
writeLLVMLabels (l:rest) = concat [vReg from ++ ":\n" ++ "br" +-+ vParam to ++ ";\n"
                                   | (to, from) <- reverse $ zip (l:rest) rest]
                           ++
                           vReg l ++ ":\n"

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
                             LLVMBranch l -> "br" +-+ vParam l ++ ";\n"
                             LLVMInsn _ _ _ -> writeInsn x ++ ";\n"

commaSep f x = intercalate ", " $ map f x

a +-+ b = a ++ " " ++ b


writeInsn (LLVMInsn op res args) = 
    let (prefix,resT) = case res of
                          Just (Value resT resV) -> (resV ++ " = ", resT)
                          Nothing -> ("", TBaseType "void")
    in prefix ++ 
      case op of 
        OpCall -> 
            let (target:params) = args
            in "call" +-+ showType resT +-+ vReg target ++
                   "(" ++ commaSep vParam params ++ ")"
        OpPtrCast ->
            let [source] = args
            in "bitcast" +-+ vParam source +-+ "to" +-+ showType resT

        _ | op `elem` [OpBranch,OpStore,OpGEP] ->
            opName op +-+ commaSep vParam args

        _ ->
            opName op +-+ 
            showType (if null args then voidT else vType $ head args) +-+
            commaSep vReg args

writeFunc name rettype params code = "define" +-+ showType rettype +-+ vReg name ++ "(" ++ commaSep vParam params ++ "){\n" ++ writeLLVM code ++ "}\n"