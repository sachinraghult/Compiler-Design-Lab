%option noyywrap
%{
	#include<stdio.h>
	
%}

%%

\n {printf("\n\n");}
[A-Za-z0-9]*"ab"+[A-Za-z0-9]* {printf("Match");}
.* {printf("No Match");}
%%

int main()
{
	yylex();
	return 0;
}