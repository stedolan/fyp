{
{-# LANGUAGE NoMonomorphismRestriction #-}
module Parser where
import Lexer
import Language
import MonadIterate
import Control.Monad.Error
import Data.Monoid
import Data.Maybe
import Type
import UserType
import ObjectTypes

}

%name parseProgram Program
%name parseType Type
%name parseExp Exp
%tokentype { Token }
%error { parseError }

%token
   if         { TRes "if" }
   elif       { TRes "elif" }
   else       { TRes "else" }
   while      { TRes "while" }
   break      { TRes "break" }
   continue   { TRes "continue" }
   return     { TRes "return" }
   def        { TRes "def" }
   var        { TRes "var" }
   ID         { TIdent $$ }
   do         { TRes "do" }
   end        { TRes "end" }
   true       { TRes "true" }
   false      { TRes "false" }
   function   { TRes "function" }
   '{'        { TRes "{" }
   '}'        { TRes "}" }
   '['        { TRes "[" }
   ']'        { TRes "]" }
   '('        { TRes "(" }
   ')'        { TRes ")" }
   ';'        { TRes ";" }
   '='        { TRes "=" }
   '.'        { TRes "." }
   ','        { TRes "," }

   '=>'       { TRes "=>"}
   ':'        { TRes ":" }
   '<:'       { TRes "<:" }
   forall     { TRes "forall" }
   where      { TRes "where" }
   any        { TRes "any" }
   none       { TRes "none" }
   typeof     { TRes "typeof" }
   class      { TRes "class" }

   Int        { TInt $$ }

%right '=>'

%%

Program
  : Block                       { $1 }


{-
ClassDef
  : class ID TypeParamList SuperclassList TypeConstraintSet
      BasicBlock
    end                         { }

SuperclassList
  : {- empty -}                 { [] }
  | '<:' InstantiatedClassList  { $2 }

InstantiatedClassList
  : InstantiatedClass           { [$1] }
  | InstantiatedClassList ',' InstantiatedClass
                                { $1 ++ [$3] }

InstantiatedClass 
  : ID TypeParamList            { undefined }
-}
Exp
  : ID                          { scopeLookup $1 }
  | Exp '.' Field               { do { s <- $1; structGetM s $3}}
  | Int                         { litIntM $1 }
  | '(' Exp ')'                 { $2 }
  | ExpStmt                     { $1 } 
  | true                        { litBool True }
  | false                       { litBool False }
  | Struct                      { $1 }
  | function '(' ArgBinder ')' FuncBody
                                { lambdaM $ \e -> $3 e >> $5 }


ExpStmt
  : Exp '(' Exp ')'             { do { f <- $1; x <- $3; applyM f x}}


Struct
  : '{' StructContents '}'      { $2 }

StructContents
  : {- empty -}                 { error "empty structure" }
  | DefList                     { do { s <- structNewM (map (\(TermDecl a b c)->a) $1);
                                       forM_ $1 $ \(TermDecl k ty v) ->  do { 
                                         ty;
                                         when (isJust v) $ do {
                                           val <- fromJust v;
                                           structSetM s k val }};
                                       return s } }


DefElem
  : ID TypeAnn OptDef           { TermDecl $1 $2 $3 }

OptDef
  : {- empty -}                 { Nothing }
  | '=' Exp                     { Just $2 }

DefList
  : DefElem                     { [$1] }
  | DefList ',' DefElem         { $1 ++ [$3]}


Block
  : Stmts                       { subscope (evalStmts $1) }

Stmts
  : Stmt                        { [$1] }
  | Stmts ';' Stmt              { $1 ++ [$3] }

Stmt
  : if Exp do Block IfTail      { ControlFlow $ doIf $2 $4 $5 }
  | while Exp do Block end      { ControlFlow $ doWhile $2 $4 }
  | do Block end                { ControlFlow $ subscope $2 }
  | break                       { ControlFlow $ throwError LoopBreak }
  | continue                    { ControlFlow $ throwError LoopContinue }
  | return Exp                  { ControlFlow $ (throwError . FuncReturn)=<< $2}
  | LValue '=' Exp              { BasicStmt $ [NoDecl ($3 >>= $1)] }
  | ExpStmt                     { BasicStmt $ [NoDecl ($1 >> return ()) ] }
  | var DefList                 { BasicStmt $ map DeclVar $2 }
  | def DefList                 { BasicStmt $ map DeclDef $2 }
-- FIXME more interesting argument syntax is possible
  | def ID '(' ArgBinder ')' FuncBody
                                { BasicStmt $ [DeclDefFun (Def $2) $ 
                                  \e -> $4 e >> $6] }
ArgBinder
  : ID                          { \e -> scopeDefNew (Def $1) e }

FuncBody
  : do Block end                { evalUntilRet $2 }
  | '=' Exp                     { $2 }

IfTail
  : end                         { return () }
  | elif Exp do Block IfTail    { doIf $2 $4 $5 }
    -- "else" or "else do"?
  | else do Block end           { $3 }


LValue
  : Var                         { \e -> do {v <- $1;
                                            varSetM v e }}
  | Exp '.' Field               { \e -> do {s <- $1;
                                            structSetM s $3 e}}

Var
  : ID                          { scopeVar (Var $1) }

Field
  : ID                          { $1 }


TypeAnn
--FIXME maybe return something or other?
  : {- empty -}                 { return () }
  | ':' Type                    { $2 >> return () }

Type
  : TypeTerm TypeQuantifierSet  { do { qs <- $2; t <- $1;
                                       return $ UserType t qs}}

TypeTerm
  : TypeTerm '=>' TypeTerm      { liftM2 (\a b -> Const $ getC "=>" [a,b]) $1 $3 }
  | any                         { return $ Const $ getC "any" [] }
  | none                        { return $ Const $ getC "none" [] }
--  | typeof Var                  { undefined }
--  | Struct                      { $1 >> return undefined }
  | TypeVar                     { liftM TVar $ scopeType $1 }
  | '(' TypeTerm ')'            { $2 }


TypeQuantifierSet
  : {- empty -}                 { return [] }
  | forall TypeVarList TypeConstraintSet
                                { forM_ $2 scopeTyNew >>
                                  sequence $3 }


TypeConstraintSet
  : {- empty -}                 { [] }
  | where TypeConstraintSet1    { $2 }

TypeConstraintSet1
  : TypeConstraint              { [$1] }
  | TypeConstraintSet1 ',' TypeConstraint
                                { $1 ++ [$3] }

TypeConstraint
--FIXME: maybe allow different constraints?
  : TypeTerm '<:' TypeTerm      { liftM2 Constraint $1 $3 }
{-
TypeParamList
  : {- empty -}                 { [] }
  | '[' TypeVarList ']'         { $2 }
-}
TypeVarList
  : TypeVar                     { [$1] }
  | TypeVarList ',' TypeVar     { $1 ++ [$3] }

TypeVar
  : ID                          { TyVar $1 }

{ 
parseError _ = error "wtf."
}
