%option noyywrap
%{
	#include<stdio.h>
	int left=0, right=0, line=1;
%}

%%
"(" {left++;}
")" {right++;}

[\n] {
	if(left==right){
		printf("Yes. The given line has no missing parantesis.\n", line);
	}else if(left<right){
		printf("No. The given line has either extra ) paranthesis or missing ( parantesis.\n", line);
	}else if(left>right) {
		printf("No. The given line has either extra ( paranthesis or missing ) parantesis.\n", line);
	}

	left=0;
	right=0;
	line++;
}
%%
int main()
{
	yylex();
	return 0;
}