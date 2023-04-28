%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "lexer.h"
%}

%token TOK_START TOK_END TOK_MAIN TOK_MOVE TOK_ADD TOK_INPUT TOK_PRINT
%token TOK_SSS TOK_SSSSS TOK_IDENT TOK_INT TOK_STRING TOK_SEMICOLON

%%

program : TOK_START declarations main_body TOK_END TOK_SEMICOLON
        {
            printf("Parsing complete\n");
            exit(0);
        }
        ;

declarations : /* empty */
             | declarations declaration TOK_SEMICOLON
             ;

declaration : TOK_SSSSS TOK_IDENT
             | TOK_SSS TOK_IDENT
             ;

main_body : TOK_MAIN statement_list
          ;

statement_list : /* empty */
               | statement_list statement TOK_SEMICOLON
               ;

statement : assignment
          | input
          | output
          ;

assignment : TOK_MOVE value TOK_TO TOK_IDENT
           | TOK_ADD value TOK_TO TOK_IDENT
           ;

value : TOK_INT
      | TOK_IDENT
      ;

input : TOK_INPUT input_list
      ;

input_list : TOK_IDENT
           | input_list TOK_SEMICOLON TOK_IDENT
           ;

output : TOK_PRINT output_list
       ;

output_list : TOK_STRING
            | TOK_IDENT
            | output_list TOK_SEMICOLON TOK_STRING
            | output_list TOK_SEMICOLON TOK_IDENT
            ;

%%

int main(int argc, char** argv) {
    yyparse();
    return 0;
}

void shift_reduce_driver(void)
{

push(S);

while(TRUE){
    switch (action [S][T]){
    case ERROR:
        announce_syntax_error();
        break

    case Accept:
        clean_up_and_finish();
        return;

    case SHIFT:
        push(go_to[S][T])
        scanner(& T)
        break;

    case Reduce:
        pop(m);
        push(go_to[S][X]);
        break;



        }
    }
}


void yyerror(const char* s) {
