%{
   /**
 * @file parser.y
 * @author Dawson Burgess (dawsonhburgess@gmail.com)
 * @brief 
 * @version 1.0
 * @date 2024-05-20
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#include <cstdio>
#include <iostream>
#include <unistd.h>
#include "scanType.h"
using namespace std;

extern "C" int yylex();
extern "C" int yyparse();
extern "C" FILE *yyin;

void yyerror(const char *msg);

void printToken(TokenData myData, string tokenName, int type = 0) {
   cout << "Line: " << myData.linenum << " Type: " << tokenName;
   if(type==0)
     cout << " Token: " << myData.tokenstr;
   if(type==1)
     cout << " Token: " << myData.nvalue;
   if(type==2)
     cout << " Token: " << myData.cvalue;
   cout << endl;
}

%}
%union
{
   struct   TokenData tinfo ;
}
%token   <tinfo>  LT GT EQUAL PRECOMPILER ID OP INT NUMCONST CHARCONST STRINGCONST CHAR BOOL LEQ GEQ EQ NOT IF INC DEC AND BY BREAK DO WHILE ELSE FOR OR RETURN STATIC THEN TO BOOLCONST ADDASS SUBASS DIVASS MULASS MIN MAX NEQ
%token   <tinfo>  ERROR 
%type <tinfo>  term program
%%
program  :  program term
   |  term  {$$=$1;}
   ;
term  : 
      PRECOMPILER {printToken(yylval.tinfo, "PRECOMPILER");}
   |  INT {printToken(yyval.tinfo, "INT");}
   |  NEQ {printToken(yylval.tinfo, "NEQ");}
   |  ADDASS {printToken(yyval.tinfo, "ADDASS");}
   |  SUBASS {printToken(yyval.tinfo, "SUBASS");}
   |  DIVASS {printToken(yyval.tinfo, "DIVASS");}
   |  MULASS {printToken(yyval.tinfo, "MULASS");}
   |  MIN {printToken(yyval.tinfo, "MIN");}
   |  MAX {printToken(yyval.tinfo, "MAX");}
   |  BOOLCONST {printToken(yylval.tinfo, "BOOLCONST");}
   |  BY {printToken(yyval.tinfo, "BY");}
   |  BREAK {printToken(yyval.tinfo, "BREAK");}
   |  DO {printToken(yyval.tinfo, "DO");}
   |  WHILE {printToken(yyval.tinfo, "WHILE");}
   |  ELSE {printToken(yyval.tinfo, "ELSE");}
   |  FOR {printToken(yyval.tinfo, "FOR");}
   |  OR {printToken(yyval.tinfo, "OR");}
   |  RETURN {printToken(yyval.tinfo, "RETURN");}
   |  STATIC {printToken(yyval.tinfo, "STATIC");}
   |  THEN {printToken(yyval.tinfo, "THEN");}
   |  TO {printToken(yyval.tinfo, "TO");}
   |  OP {printToken(yylval.tinfo, "OP");}
   |  ID {printToken(yylval.tinfo, "ID");}
   |  LT {printToken(yylval.tinfo, "LT");}
   |  GT {printToken(yylval.tinfo, "GT");}
   |  LEQ {printToken(yylval.tinfo, "LEQ");}
   |  GEQ {printToken(yylval.tinfo, "GEQ");}
   |  CHAR {printToken(yylval.tinfo, "CHAR"); }
   |  BOOL {printToken(yylval.tinfo, "BOOL"); }
   |  NOT {printToken(yylval.tinfo, "NOT"); }
   |  EQ {printToken(yylval.tinfo, "EQ"); }
   |  IF {printToken(yylval.tinfo, "IF"); }
   |  INC {printToken(yylval.tinfo, "INC"); }
   |  DEC {printToken(yylval.tinfo, "DEC"); }
   |  AND {printToken(yylval.tinfo, "AND"); }
   |  NUMCONST {printToken(yylval.tinfo, "NUMCONST");}
   |  CHARCONST {printToken(yylval.tinfo, "CHARCONST"); }
   |  STRINGCONST {printToken(yylval.tinfo, "STRINGCONST"); }
   |  ERROR    {cout << "ERROR(" << yylval.tinfo.linenum << "): Token error, invalid or misplaced input character: '" << yylval.tinfo.tokenstr << "'. Character Ignored." << endl;}
   ;
%%
void yyerror (const char *msg)
{ 
   cout << "Error: " <<  msg << endl;
}
int main(int argc, char **argv) {
   yylval.tinfo.linenum = 1;
   int option, index;
   char *file = NULL;
   extern FILE *yyin;
   while ((option = getopt (argc, argv, "")) != -1)
      switch (option)
      {
      default:
         ;
      }
   if ( optind == argc ) yyparse();
   for (index = optind; index < argc; index++) 
   {
      yyin = fopen (argv[index], "r");
      yyparse();
      fclose (yyin);
   }
   return 0;
}

