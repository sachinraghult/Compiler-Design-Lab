%option noyywrap
%{
	#include<stdio.h>
%}

%%
"//".*"\n"  {
	fprintf(yyout,"%s<--- This line has a comment",yytext);
}
"/".[\n]."*/"  {
	fprintf(yyout,"%s<--- This line has a comment",yytext);
}
%%

int main()
{
	extern FILE *yyin, *yyout; 
	yyin=fopen("input3.txt", "r");
	yyout=fopen("output3.txt", "w");
	yylex();
	return 0;
}