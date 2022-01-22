%option noyywrap
%{
	#include<stdio.h>
%}

%%
[a-z]+ {
	fprintf(yyout,"\nLowercase letter = "); ECHO;
	fprintf(yyout,"\nFirst letter - %c, Last letter - %c",yytext[0], yytext[yyleng-1]);
	yymore();
}
[A-Z]+ {
	fprintf(yyout,"\nUppercase letter = "); ECHO;
	fprintf(yyout,"\nFirst letter - %c, Last letter - %c",yytext[0], yytext[yyleng-1]);
	yymore();
}
%%

int main()
{
	extern FILE *yyin, *yyout; 
	yyin=fopen("input1.txt", "r");
	yyout=fopen("output1.txt", "w");
	yylex();
	return 0;
}