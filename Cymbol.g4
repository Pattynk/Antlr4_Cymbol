grammar Cymbol;

file            : (functionDecl | varDecl)+ ;

varDecl         : type ID ('=' expr)? ';' ;
type            : 'float' | 'int' | 'void' ;

functionDecl    : type ID '(' formalParameters? ')' block ;
formalParameters: formalParameter (',' formalParameter)* ;
formalParameter : type ID ;

block           : '{' stat* '}' ;

stat            : block
                | varDecl
                | 'if' expr 'then' stat ('else' stat)?
                | 'return' expr? ';'
                | expr '=' expr ';'
                | expr ';'
                ;

expr            : ID '(' exprList? ')'
                | expr '[' expr ']'
                | '-' expr
                | '!' expr
                | expr '*' expr
                | expr ('+' | '-') expr
                | expr '==' expr
                | ID
                | INT
                | '(' expr ')'
                ;

exprList        : expr (',' expr)* ;

ID  : [a-zA-Z]+ ;
INT : [0-9]+ ;
WS  : [ \t\r\n]+ -> skip ;
COMMENT : '//' ~[\r\n]* -> skip ;