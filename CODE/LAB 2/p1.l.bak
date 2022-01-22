%option noyywrap
%{
	#include<stdio.h>
	
%}

%%

\n {printf("\n\n");}
[^a-z]+ {printf("Match");}
.* {printf("No Match");}
%%

int main()
{
	yylex();
	return 0;
}