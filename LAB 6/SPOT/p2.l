%option noyywrap
%{
	#include<stdio.h>
	int i, first=1;
%}

%%
{
}
"if("[a-zA-Z0-9]+" == "[a-zA-Z0-9]+"){" {
	if(first){
		fprintf(yyout,"switch(");
		for(i=3; yytext[i]!=' '; i++)
			fprintf(yyout,"%c",yytext[i]);
		fprintf(yyout,"){\n");
	}
	first=0;
	fprintf(yyout,"case ");
	for(i=3; yytext[i]!=' '; i++);
	i+=3;
	for(; i<yyleng-2; i++)
		fprintf(yyout,"%c",yytext[i]);
	fprintf(yyout,": ");
}
[ \t\n]*([a-zA-Z0-9]+";"[ \t\n]*)+"}" {
	for(i=0; i<yyleng-1; i++)
		fprintf(yyout,"%c",yytext[i]);
	fprintf(yyout,"\tbreak;");
}
"else{"[ \t\n]*([a-zA-Z0-9]+";"[ \t\n]*)+"}" {
	fprintf(yyout,"default:");
	for(i=5; i<yyleng-1; i++)
		fprintf(yyout,"%c",yytext[i]);
	fprintf(yyout,"}");
}
. ;
%%

void main()
{
	extern FILE *yyin, *yyout; 
	yyin=fopen("input2.txt", "r");
	yyout=fopen("output2.txt", "w");
	yylex();
}