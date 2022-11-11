%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
\[             return OPENBRACKET;
\]             return CLOSEBRACKET;
\,             return COMMA;
[1-9]+		yylval.num = atoi(yytext); return NUMBER;
\n              /*ignore end of line*/;
[ \t]+		/*ignore whitespace*/;
%%
