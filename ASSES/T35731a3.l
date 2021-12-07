/*2019103573*/
%option noyywrap
%{
%}
start \/\*
end  \*\/
%%
\/\/(.*) ;
{start}.*{end} ;
%%
int main()
{
	yyin=fopen("INPUT35731a3.txt","r");
	yyout=fopen("OUTPUT35731a3.txt","w");
	yylex();
	return 0;
}