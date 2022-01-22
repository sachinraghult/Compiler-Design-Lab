%option noyywrap
%{
    #include<stdio.h>
    int i, a=0, b=0, ans=0;
%}

%%
[ab]* { 
    for(i=0; i<yyleng; i++) {
        if(yytext[i]=='a')
            a++;
        else if(yytext[i]=='b')
            b++;
    }
    if(((a%2)==0)&&((b%2)!=0)) 
        ans=1;
}
.* ;
%%

int main()
{
    yylex();
    if(ans==1) 
	printf("String has even number of a's and odd number of b's\n"); 
    else 
	printf("String does not have even number of a's and odd number of b's\n");
    return 0;
}