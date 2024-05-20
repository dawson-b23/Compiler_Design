%{
/**
 * @file parser.l
 * @author Dawson Burgess (dawsonhburgess@gmail.com)
 * 
 * @brief 
 * 
 * @version 0.1
 * @date 2024-05-16
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include "treeNodes.h"
#include "treeUtils.h"
#include "scanType.h"
#include "dot.h"
#include "parser.tab.h" // This has to be the last include

using namespace std;

extern "C" int yylex();
extern "C++" int yyparse();
extern "C++" FILE *yyin;
#define YY_DECL extern "C" int yylex()
#define YYSTYPE int

int line=1;
char *lastToken=(char*)"";

int setValue(int linenum, int tokenClass, char *svalue) {
    yylval.tokenData = new TokenData;
    yylval.tokenData->tokenclass = tokenClass;
    yylval.tokenData->linenum = linenum;

    yylval.tokenData->tokenstr = lastToken = strdup(svalue);
    yylval.tokenData->cvalue = svalue[1];

    switch(tokenClass) {
        case NUMCONST:
            yylval.tokenData->nvalue = stoi(svalue);
            break;
        
        case ID:
            yylval.tokenData->svalue = strdup(svalue);
            break;

        case BOOLCONST:
            if(svalue[0] == 't') {
                yylval.tokenData->nvalue = 1;
            }
            else {
                yylval.tokenData->nvalue = 0;
            }
            break;
    
        case CHARCONST:
            if(svalue[1] == '\\') {
                if(svalue[2] == 'n') {
                    yylval.tokenData->cvalue = '\n';
                }
                else if(svalue[2] == '0') {
                    yylval.tokenData->cvalue = '\0';
                }
            }
            break;

        case STRINGCONST:
            break;
        case INT:
            yylval.tokenData->svalue = strdup(lastToken);
            break;

        default:
            //printf("Default is matched...\n");
            break;
    }

    return tokenClass;
}


%}

%option noyywrap

letter      [a-zA-Z]
digit    [0-9]
/* underbar [_] */
/* letdig      {digit}|{letter}|{underbar} */
/*limitters   [\;\,\(\)\{\}\[\]] */
/*op    [\-\+\*\/\%]*/
whitespace  [\ \t]

%%
"%"      { return setValue(line, '%', yytext); }
"?"      { return setValue(line, '?', yytext); }
"/"      { return setValue(line, '/', yytext); }
","      { return setValue(line, ',', yytext); }
"("      { return setValue(line, '(', yytext); }
"<"      { return setValue(line, '<', yytext); }
">"      { return setValue(line, '>', yytext); }
"="      { return setValue(line, '=', yytext); }
":"      { return setValue(line, ':', yytext); }
"-"      { return setValue(line, '-', yytext); }
"+"      { return setValue(line, '+', yytext); }
";"      { return setValue(line, ';', yytext); }
"["      { return setValue(line, '[', yytext); }
"]"      { return setValue(line, ']', yytext); }
"+"      { return setValue(line, '+', yytext); }
"*"      { return setValue(line, '*', yytext); }
"("      { return setValue(line, '(', yytext); }
")"      { return setValue(line, ')', yytext); }
"{"      { return setValue(line, '{', yytext); }
"}"      { return setValue(line, '}', yytext); }
"<="     { return setValue(line, LEQ, yytext); }
">="     { return setValue(line, GEQ, yytext); }
"#".*    { return setValue(line, PRECOMPILER, yytext); }
"int"    { return setValue(line, INT, yytext); }
"char"   { return setValue(line, CHAR, yytext); }
"bool"   { return setValue(line, BOOL, yytext); }
"not"    { return setValue(line, NOT, yytext); }
"and"    { return setValue(line, AND, yytext); }
"if"     { return setValue(line, IF, yytext); }
"by"     { return setValue(line, BY, yytext); }
"break"  { return setValue(line, BREAK, yytext); }
"do"     { return setValue(line, DO, yytext); }
"while"  { return setValue(line, WHILE, yytext); }
"else"   { return setValue(line, ELSE, yytext); }
"for"    { return setValue(line, FOR, yytext); }
"or"     { return setValue(line, OR, yytext); }
"return" { return setValue(line, RETURN, yytext); }
"static" { return setValue(line, STATIC, yytext); }
"false"|"true" { return setValue(line, BOOLCONST, yytext); }
"then"   { return setValue(line, THEN, yytext); }
"to"     { return setValue(line, TO, yytext); }
"=="     { return setValue(line, EQ, yytext); }
"++"     { return setValue(line, INC, yytext); }
"--"     { return setValue(line, DEC, yytext); }
"+="     { return setValue(line, ADDASS, yytext); }
"-="     { return setValue(line, SUBASS, yytext); }
"/="     { return setValue(line, DIVASS, yytext); }
"*="     { return setValue(line, MULASS, yytext); }
"!="     { return setValue(line, NEQ, yytext); }
":>:"    { return setValue(line, MAX, yytext); }
":<:"    { return setValue(line, MIN, yytext); }
\/\/.*    ;

["]([^"\\\n]|\\(.|\n))*["]      { return setValue(line, STRINGCONST, yytext); }
[']([^'\\\n]|\\(.|\n))[']       { return setValue(line, CHARCONST, yytext); }
{letter}+({digit}|{letter})*    { return setValue(line, ID, yytext); }
{digit}+                        { return setValue(line, NUMCONST, yytext); }
{whitespace}                    ;
\n                              {  line++; }
.                               ; //{ return setValue(line, ERROR, yytext); } //yylval.tinfo.tokenstr = yytext; return ERROR; 
%%
