/*2019103573*/
%option noyywrap
%{
	#include<stdio.h>
%}

number [0-9]+
symbol ("+"|"-"|"*"|"/")?
%%
^{symbol}?{number}? { printf("Match Found\n"); }
.* { printf("Match not Found\n"); }
%%
int main()
{
	yyin=fopen("INPUT35731a1.txt","r");
	yyout=fopen("OUTPUT35731a1.txt","w");
	yylex();
	return 0;
}