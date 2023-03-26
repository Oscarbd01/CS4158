%{
#include "parser.tab.h"
%}

%%

"START"     { return TOK_START; }
"END"       { return TOK_END; }
"MAIN"      { return TOK_MAIN; }
"MOVE"      { return TOK_MOVE; }
"ADD"       { return TOK_ADD; }
"INPUT"     { return TOK_INPUT; }
"PRINT"     { return TOK_PRINT; }
"SSS+"      { yylval.strval = strdup(yytext); return TOK_SSS; }
"SSSSS+"    { yylval.strval = strdup(yytext); return TOK_SSSSS; }
"[a-zA-Z_][a-zA-Z0-9_-]*" { yylval.strval = strdup(yytext); return TOK_IDENT; }
[0-9]+      { yylval.intval = atoi(yytext); return TOK_INT; }
";"         { return TOK_SEMICOLON; }
"\""([^"]|\\.)*"\"" { yylval.strval = strdup(yytext+1); yylval.strval[strlen(yylval.strval)-1] = '\0'; return TOK_STRING; }
[ \t\n]+    { /* ignore whitespace */ }

%%