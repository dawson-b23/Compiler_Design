%{
#include "scanType.h"
#include "parser.tab.h" // This has to be the last include

using namespace std;

#define YY_DECL extern "C" int yylex()
#define YYSTYPE int

int line=1;

int setValue(int linenum, int tokenClass, char *svalue) {
    yylval.tinfo.tokenclass = tokenClass;
    yylval.tinfo.linenum = linenum;
    yylval.tinfo.tokenstr = strdup(svalue);
    yylval.tinfo.cvalue = '@';
    yylval.tinfo.nvalue = 777;
    yylval.tinfo.svalue = NULL;
    return tokenClass;
}

%}

%option noyywrap

letter      [a-zA-Z]
digit    [0-9]
quote    [\']
underbar [_]
letdig      {digit}|{letter}|{underbar}
limitters   [\;\,\(\)\{\}\[\]]
op    [\-\+\*\/\%]
whitespace  [\ \t]

%%
[\(\)\*\+\,\-\/\:\;\<\=\>\?\[\]\%\{\}] { return setValue(line, OP, yytext); }
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

["]([^"\\\n]|\\(.|\n))*["]          { return setValue(line, STRINGCONST, yytext); }
[']([^'\\\n]|\\(.|\n))[']          { return setValue(line, CHARCONST, yytext); }
{letter}+({digit}|{letter})*  { return setValue(line, ID, yytext); }
{digit}+   { return setValue(line, NUMCONST, yytext); }
{whitespace}  ;
\n       {  line++; }
.     { return setValue(line, ERROR, yytext); } //yylval.tinfo.tokenstr = yytext; return ERROR;
%%
