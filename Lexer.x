{
module Lexer where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z_]
@reserved = if|else|elif|else|while|break|continue|return|do|end|true|false|function|var|def|forall|where|typeof|any|none|class|
 "{"|"}"|"["|"]"|"("|")"|";"|"="|"."|","|"<:"|":"|"=>"

@ident = $alpha [$alpha $digit]*
@comment = "#" [^\r\n]*

tokens :-
  $white+             ;
  @comment            ;
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
  