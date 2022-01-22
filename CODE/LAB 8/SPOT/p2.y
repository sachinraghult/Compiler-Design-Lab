%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror();
%}

%token ID NUM IF ELSE LE GE EQ NE OR AND LINE
%left OR AND
%left '>' '<' LE GE EQ NE
%left '!'

%%

S: ST   {
    printf("\nInput Accepted\n\n");
    return 0;
}

ST: IF '(' E ')' DEF ELSE DEF;

DEF:
    '{' BODY '}'
    | LINE
    | ST
    |
;

BODY: 
    BODY BODY
    | LINE
    | ST
    |
;

E: 
    | E '<' E
    | E '>' E
    | E LE E
    | E GE E
    | E EQ E
    | E NE E
    | E OR E
    | E AND E
    | '(' E ')'
    | ID 
    | NUM
;

%%

int main() {
    printf("\nEnter the expression:\n");
    yyparse();
    return 0;
}   

void yyerror() {
    printf("\nInvalid syntax\n\n");
}  