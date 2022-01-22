%option noyywrap
%{
	#include<stdio.h>
%}

%%

([A-Z0-9]+)?[a-z]+([A-Z0-9]+)? {
	fprintf(yyout,"%s : Does NOT match - Input contains lower-case",yytext);
}
[A-Z0-9]+ {
	fprintf(yyout,"%s : Matches - Input does NOT have lower-case",yytext);
}
%%

int main()
{
	extern FILE *yyin, *yyout; 
	yyin=fopen("input2.txt", "r");
	yyout=fopen("output2.txt", "w");
	yylex();
	return 0;
}