%option noyywrap
%{
	#include<stdio.h>
	int vc=0,i,c=0;
%}

%%
[a-zA-Z]+ {
	vc=0; 
	for(i=0;i<yyleng;i++) 
		switch(yytext[i]) {
			case 'a':
			case 'e':
			case 'i':
			case 'o':
			case 'u':
			case 'A':
			case 'E':
			case 'I':
			case 'O':
			case 'U': vc++;
				  break;
		}
	if(vc>=2) {
		printf("\n%s",yytext);
		c++;
	}
}
%%
int main()
{
	yylex();
	printf("\nNumber of such words: %d",c);
	return 0;
}