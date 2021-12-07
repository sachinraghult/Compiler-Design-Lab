%option noyywrap
%{
    #include <stdio.h>
    #include "p2.tab.h"
%}

alpha [a-zA-Z]
digit [0-9]

%%

[\t \n]

if  {   return IF;  }
else    {   return ELSE;    }
{digit}+    {   return NUM; }
{alpha}({alpha}|{digit})*   {   return ID;  }

"<="    {   return LE;  }
">="    {   return GE;  }
"=="    {   return EQ;  }
"!="    {   return NE;  }
"||"    {   return OR;  }
"&&"    {   return AND; }

.+; {   return LINE;    }
.   {   return yytext[0];   }

%%