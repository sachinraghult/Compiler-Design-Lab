%option noyywrap
%{
	#include<stdio.h>
%}

%%
^("+"|"-")?[0-9]+ { printf("Match Found\n"); }
.* { printf("Match not Found\n"); }
%%

int main()
{
	yylex();
	return 0;
}