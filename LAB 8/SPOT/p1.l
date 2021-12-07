%{
    #include<stdio.h>
    #include "p1.tab.h"
    extern int yylval;
%}

%%
[0-9]+ {
	yylval=atoi(yytext);
	return NUMBER;
}
"==" {return EQ;}
">=" {return GE;}
"<=" {return LE;}
"!=" {return NE;}
[\t] ;
[\n] return 0;
. return yytext[0]; 
%%
int yywrap()
{
	return 1;
}