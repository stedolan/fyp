module ObjectTypes where
import Data.List
import Data.Function
import Data.Maybe
import qualified Data.Set as S

import Lattice

type FieldName = String

type FieldSet = S.Set FieldName

data StructType = StructType FieldSet
data NomType = NomType {nomName :: String,
                        nomParents :: [NomType],
                        nomFields :: FieldSet}

instance Eq NomType where
    (==) = (==) `on` nomName
instance Ord NomType where
    compare = compare `on` nomName
instance Show NomType where
    show = nomName


-- Should probably implement C3 or somesuch...
allParents n = 
    let n' = nub (n ++ (n >>= nomParents))
    in if n' == n then n else allParents n'


data ObjType = ObjType (S.Set NomType) (S.Set FieldName) | BottomObj deriving (Eq,Ord)

-- an upper set of nominative types can be represented by its set of minimal elements
-- i.e. a type, represented by the set of supertypes, can equally be represented
-- by the most derived type(s)
-- this form is mostly used for displaying types to the user.
mostDerived :: S.Set NomType -> S.Set NomType
mostDerived s =
    let parents = S.fromList $ concatMap nomParents (S.toList s)
    in s `S.difference` parents

fromNomType n = 
    let noms = S.fromList $ allParents [n]
    in ObjType noms (fromJust $ allNomFields noms)
fromStructType s = ObjType (S.empty) s


instance Show ObjType where
    show BottomObj = "_|_"
    show (ObjType noms fields) = 
        let d = S.toAscList (S.map show $ mostDerived noms)
            (Just nomfields) = allNomFields noms
            f = [if x `S.member` nomfields then x else "*" ++ x | x <- S.toAscList fields]
            j = intercalate
            nomtypes = " & " `j` d
            fieldlist = ", " `j` f
        in nomtypes ++ if null fieldlist then "" else "{" ++ fieldlist ++ "}"


allNomFields noms =
    let allfields = sort [(f,n) | n <- S.toList noms, f <- S.toList $ nomFields n]
        fieldsources = groupBy ((==) `on` fst) allfields
        valid = all (==1) $ map length fieldsources
    in if valid then Just (S.fromList $ map fst allfields) else Nothing

{-
wrong!

validObjType (ObjType noms fields) = 
    noms == S.fromList (allParents (S.toList noms)) && 
    S.unions (map nomFields $ S.toList noms) `S.isSubsetOf` fields
-}

nomTypes (ObjType n _) = n
objTypeFields (ObjType _ f) = S.toAscList f

instance Lattice ObjType where
    extremum Pos = ObjType (S.empty) (S.empty)
    extremum Neg = BottomObj

    merge v a b = case [a,b] \\ [BottomObj] of
                    [x] -> if v == Pos then x else BottomObj
                    [ObjType noms1 fields1, ObjType noms2 fields2] ->
                        let newnom = merge v' noms1 noms2
                            newfields = merge v' fields1 fields2
                        in case allNomFields newnom of
                             Nothing -> BottomObj
                             Just _ -> ObjType newnom newfields
                            where
                              v' = opVariance v
                            


nt a b c = fromNomType $ NomType a (concatMap (S.toList . mostDerived . (\(ObjType n f) -> n)) b) (S.fromList c)
hairy = nt "Hairy" [] ["growHair"]
student = nt "Student" [hairy] ["study","wobble"]
animal = nt "Animal" [] ["eat", "sleep"]
dog = nt "Dog" [animal,hairy] ["bark"]
labrador = nt "Labrador" [dog] []
fish = nt "Fish" [animal] ["wobble"]



data Label = LabelArg | LabelRet | LabelField String Variance deriving (Eq,Ord,Show)
labelVariance LabelArg = Neg
labelVariance LabelRet = Pos
labelVariance (LabelField _ v) = v

data Constructor = CnTop | CnBot | CnVoid | CnFunc | CnObj ObjType deriving (Eq,Ord,Show)
instance Lattice Constructor where
    extremum Pos = CnTop
    extremum Neg = CnBot
    
    merge v CnTop CnTop = CnTop
    merge v CnBot CnBot = CnBot
    merge v CnVoid CnVoid = CnVoid
    merge v CnFunc CnFunc = CnFunc
    merge v (CnObj o1) (CnObj o2) = CnObj (merge v o1 o2)
    merge v c1 c2 | c1 == mergeIdentity v = c2
                  | c2 == mergeIdentity v = c1
                  | otherwise = mergeFailure v

constLabels CnTop = []
constLabels CnBot = []
constLabels CnVoid = []
constLabels CnFunc = [LabelArg, LabelRet]
constLabels (CnObj o) = concat [[LabelField s Neg, LabelField s Pos] | 
                                s <- objTypeFields o]

constLabelDirs = map labelVariance . constLabels
constCommonLabels c1 c2 =
    -- PERF (sorted lists/merge)
    unzip3 [(i1,i2,l) | (i1,l) <- en c1, (i2, l') <- en c2, l == l']
    where
      en c = zip [0..] (constLabels c)


data Constructed a = CN {cnConstructor :: Constructor,
                         cnFields :: [a]}
                     deriving (Eq,Ord)
instance Functor Constructed where
    fmap f (CN c xs) = CN c $ fmap f xs
instance Show a => Show (Constructed a) where
--    show (CN (Constructor "=>" _) [a,b]) = show a ++ " -> " ++ show b
    show (CN CnTop []) = "any"
    show (CN CnBot []) = "none"
    show (CN CnVoid []) = "void"
    show (CN CnFunc [arg,ret]) = "(" ++ show arg ++ " => " ++ show ret ++ ")"
    show (CN (CnObj xs) fs) = show xs ++ show fs

mkCN c ts | length ts == length (constLabels c) = CN c ts

getC "any" [] = mkCN CnTop []
getC "none" [] = mkCN CnBot []
getC "=>" [a,b] = mkCN CnFunc [a,b]
--FIXME
getC "bool" [] = mkCN CnTop []
getC s _ = error $ "unknown type constructor " ++ s

getCFields fs vs = mkCN (CnObj (fromStructType $ S.fromList fs)) vs
getCField f (vn,vp) = mkCN (CnObj (fromStructType $ S.singleton f)) [vn,vp]

--mkC n ts = Const $ getC n ts

