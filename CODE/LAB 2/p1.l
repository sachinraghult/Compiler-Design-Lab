%option noyywrap
%{
	#include<stdio.h>
	
%}

%%

\n {printf("\n\n");}
[A-Z]+ {printf("Match");}
.* {printf("No Match");}
%%

int main()
{
	yylex();
	return 0;
}