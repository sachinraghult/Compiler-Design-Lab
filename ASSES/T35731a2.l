/*2019103573*/
%option noyywrap
%{
	#include<stdio.h>
	#include<string.h>
	int tchar=0,tword=0,tspace=0;
%}
lower [a-z]
upper [A-Z]
%%
{lower} {tchar++;printf(" % c",yytext[0]-32);}
{upper} {tchar++;printf(" % c",yytext[0]);}
" " {tword++;}
[\t\n] tword++;
[^\n\t] {tchar++;}

%%

int main()
{
	  FILE *fp;
	  fp = fopen("INPUT35731a2.txt", "r");
	  if (fp == NULL) { printf("File not found"); }
	  yyin = fp;
	  yylex();
	  printf("\nNumber of character:: %d\nNumber of words:: %d\n",tchar,tword);
	  return 0;
}