%{
 #include<stdio.h>
 int flag=0;
 int yylex();
 void yyerror();
%}
%token NUMBER
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%%
ArithmeticExpression: E{
printf("Result = %d\n",$$);
return 0;
}
E:E'+'E {$$=$1+$3;}
|E'-'E {$$=$1-$3;}
|E'*'E {$$=$1*$3;}
|E'/'E {$$=$1/$3;}
|E'%'E {$$=$1%$3;}
|'('E')' {$$=$2;}
| NUMBER {$$=$1;}
;
%%
void main()
{
printf("\nEnter an Arithmetic Expression: ");
yyparse();
}
void yyerror()
{
printf("Invalid Arithmetic Expression\n");
flag=1;
}