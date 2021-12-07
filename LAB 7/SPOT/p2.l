%option noyywrap
%{
	#include<stdio.h>
	#include<string.h>
	char startbuff[200], endbuff[200], funcnamebuff[200], funcargbuff[200], funcdefbuff[200];
	int i, k=0, start=1, end=0, funcname=0, funcarg=0, funcdef=0;
%}
wsn [ \t\n]*
%%
"int main()"{wsn}"{"	{strcat(endbuff,yytext); end=1; funcdef=0;}
"#define " { start=0; funcname=1; }
"(" { if(funcname) {funcname=0; funcarg=1;} 
	else if(end) strcat(endbuff,yytext);}
[\t\n] {if(end) strcat(endbuff,yytext);}
")"{wsn} {if(funcarg) {funcarg=0; funcdef=1;}
		else if(end) strcat(endbuff,yytext);}
.	{if(start) strcat(startbuff,yytext); 
	else if(end) strcat(endbuff,yytext);
	else if(funcname) strcat(funcnamebuff,yytext);
	else if(funcarg) { if(strcmp(yytext," ")==0) continue;
				else if(strcmp(yytext,",")==0) strcat(funcargbuff,yytext);
				else { strcat(funcargbuff,"int "); strcat(funcargbuff,yytext);} }
	else if(funcdef && strcmp(yytext,";")!=0) strcat(funcdefbuff,yytext);}
%%
int main()
{
	extern FILE *yyin, *yyout;
	yyin = fopen("input.txt","r");
	yyout = fopen("output.txt","w");
	yylex();
	fprintf(yyout,"%s\nint %s(%s) {\n\treturn (%s);\n}\n%s",startbuff,funcnamebuff,funcargbuff,funcdefbuff,endbuff);
	return 0;
}