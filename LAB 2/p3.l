%option noyywrap
%{
    #include<stdio.h>
    int i = 0;
    int n = 0;
    int op = 0;
    int sp = 0;
    int key = 0;
    int wh = 0;
    int a = 0;
%}

%%
[ |\t|\n]   {wh++;}
if|then|else|while|int|float|for|real   {key++;}
[a-zA-Z]+   {i++;}
[0-9]+ {n++;}
[+|-|*|/] {op++;}
[!|#|$|%|^|*|"|(|)] {sp++;}
[:=] {a++;}
%%

int main()
{
    FILE *fd;

    if(!(fd = fopen("input.txt", "r"))){
            perror("Error: ");
            return -1;
    }
    yyin = fd;
    yylex();
    printf("Number of Identifier = %d\n",i);
    printf("Number of n(0-9) = %d\n",n);
    printf("Number of Operator symbol = %d\n",op);
    printf("Number of Special character = %d\n",sp);
    printf("Number of Keyword = %d\n",key);
    printf("Number of Whitespace = %d\n",wh);
    printf("Number of Assignment symbol = %d\n",a);
    fclose(fd);
    
    return 0;
}