%option noyywrap
%{
	#include<stdio.h>
%}

%%
[A-Z] { printf("%s, ",yytext); }
. ;
%%
int main()
{
	yylex();
	printf("\nAre the capital letters in the given input\n");
	return 0;
}