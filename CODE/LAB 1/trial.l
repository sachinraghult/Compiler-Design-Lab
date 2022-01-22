%option noyywrap
%{
	#include<stdio.h>
	int valid = 0;
%}

%%
[a-zA-Z][0-9a-zA-Z]* valid++;
%%

int main()
{
	yylex();
	printf("%d", valid);
	return 0;
}