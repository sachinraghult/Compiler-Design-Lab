%option noyywrap
%{
	#include<stdio.h>
	int i, first=0;
	char arr[50];
%}
%%
"switch("[a-zA-Z_][a-zA-Z0-9_]*")" {
	for(i=7; i<yyleng-1; i++)
		arr[i-7]=yytext[i];
	arr[i]='\0';
}
"case ""\'"?[a-zA-Z_][a-zA-Z0-9_]*"\'"?":" {
	if(first){fprintf(yyout,"else ");}
	fprintf(yyout,"if(%s == ",arr);
	for(i=5; i<yyleng-1; i++)
		fprintf(yyout,"%c",yytext[i]);
	fprintf(yyout,"){\n");
	first++;
}
[ \t\n]*([a-zA-Z0-9]+";"[ \t\n]*)+"break;" {
	for(i=0; i<yyleng-8; i++)
		fprintf(yyout,"%c",yytext[i]);
	fprintf(yyout,"}\n");
}
"default:"[ \t\n]*([a-zA-Z0-9]+";"[ \t\n]*)+"}" {
	fprintf(yyout,"else{");
	for(i=8; i<yyleng-1; i++)
		fprintf(yyout,"%c",yytext[i]);
	fprintf(yyout,"}");
}
. ;
%%

void main()
{
	extern FILE *yyin, *yyout; 
	yyin=fopen("input.txt", "r");
	yyout=fopen("output.txt", "w");
	yylex();
}

