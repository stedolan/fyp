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
}

%name parseProgram Program
%name parseType Type
%tokentype { Token }
%error { parseError }

%token
   if         { TRes "if" }
   elif       { TRes "elif" }
   else       { TRes "else" }
   while      { TRes "while" }
   break      { TRes "break" }
   continue   { TRes "continue" }
   def        { TRes "def" }
   var        { TRes "var" }
   ID         { TIdent $$ }
   do         { TRes "do" }
   end        { TRes "end" }
   '{'        { TRes "{" }
   '}'        { TRes "}" }
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

   Int        { TInt $$ }

%right '=>'

%%

Program
  : Block                       { $1 }

Exp
  : Var                         { do { v <- $1; lift $ varGetM v }}
  | Exp '.' Field               { do { s <- $1; lift $ structGetM s $3}}
  | Int                         { lift $ litIntM $1 }
  | '(' Exp ')'                 { $2 }
  | Struct                      { $1 }


Struct
  : '{' StructContents '}'      { $2 }

StructContents
  : {- empty -}                 { error "empty structure" }
  | DefList                     { do { s <- lift $ structNewM (map (\(a,b,c)->a) $1);
                                       forM_ $1 $ \(k,ty,v) ->  do { ty;  
                                         when (isJust v) $ do {
                                           val <- fromJust v;
                                           lift $ structSetM s k val }};
                                       return s } }


DefElem
  : ID TypeAnn OptDef           { ($1, $2, $3) }

OptDef
  : {- empty -}                 { Nothing }
  | '=' Exp                     { Just $2 }

DefList
  : DefElem                     { [$1] }
  | DefList ',' DefElem         { $1 ++ [$3]}


Block
  : Stmts                       { subscope $1 }

Stmts
  : Stmt                        { $1 }
  | Stmts ';' Stmt              { $1 >> $3 }

Stmt 
  : if Exp do Block IfTail      { doIf $2 $4 $5 }
  | while Exp do Block end      { doWhile $2 $4 }
  | LValue '=' Exp              { $3 >>= $1 }
  | do Block end                { subscope $2 }
  | break                       { throwError LoopBreak }
  | continue                    { throwError LoopContinue }
  | var VarDefs                 { $2 }

VarDefs
  : DefList                     { forM_ $1 $ \(name,ty,exp) -> do {
                                    ty;
                                    v <- scopeVarNew (Var name);
                                    when (isJust exp) $ do {
                                      val <- fromJust exp;
                                      lift $ varSetM v val }}}
IfTail
  : end                         { return () }
  | elif Exp do Block IfTail    { doIf $2 $4 $5 }
    -- "else" or "else do"?
  | else do Block end           { $3 }


LValue
  : Var                         { \e -> do {v <- $1;
                                            lift $ varSetM v e }}
  | Exp '.' Field               { \e -> do {s <- $1;
                                            lift $ structSetM s $3 e}}

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
  : TypeTerm '=>' TypeTerm      { liftM2 (\a b -> mkC "=>" [a,b]) $1 $3 }
  | any                         { return $ mkC "Top" [] }
  | none                        { return $ mkC "Bot" [] }
  | typeof Var                  { undefined }
  | Struct                      { undefined }
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


TypeVarList
  : TypeVar                     { [$1] }
  | TypeVarList ',' TypeVar     { $1 ++ [$3] }

TypeVar
  : ID                          { TyVar $1 }

{ 
parseError _ = error "wtf."
}
