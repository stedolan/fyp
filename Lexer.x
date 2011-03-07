{
module Lexer where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z_]
@reserved = if|else|elif|else|while|break|continue|do|end|var|def|forall|where|typeof|any|none|
 "{"|"}"|"("|")"|";"|"="|"."|","|"<:"|":"|"=>"

@ident = $alpha [$alpha $digit]*

tokens :-
  $white+             ;
  @reserved           { TRes }
  @ident              { TIdent }
  $digit+             { TInt . read }

{
data Token
     = TRes String
     | TIdent String
     | TInt Int 
     deriving Show

runLexer = alexScanTokens

}
  