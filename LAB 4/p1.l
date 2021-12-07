%option noyywrap
%{
	#include<stdio.h>
	int flag=0;
%}

%%
(abc) {
	printf("ABC");
	flag++;
}
. {
	printf("%s", yytext);
	}
%%
int main()
{
	yylex();
	if(flag>=1){
	printf("\n \'abc\' has been changed in %d instances.\n", flag);
	}else{
	printf("\n No substring matches \'abc\'.\n");
	}
	return 0;
}