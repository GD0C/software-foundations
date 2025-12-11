(*
    @author: { @Override }
    @since: { 20251130 : @17:13 }
    -----------------------------
    Design of the Lexer is a simple language:


   <expr> ::= <term> 
           | <addop> <term> 
           | <expr> <addop> <term>
   <term> ::= <factor>
           | <term> <multop> <factor>
 <factor> ::= <primary>
           | <factor> ^ <primary>
<primary> ::= <number> 
           | <variables>   
           | (<expr>)
  <addop> ::= '+' | '-'
 <multop> ::= '*' | '/'

*) 


type token =
    | number of int
    | plus
    | minus
    | star
    | slash
    | lparen
    | rparen
    | eof

type lexer = {
    text : string;
    mutable pos : int;
    len : int;
}



