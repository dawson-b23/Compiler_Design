%{
#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <unistd.h>
#include "treeNodes.h"
#include "treeUtils.h"
#include "scanType.h"
#include "dot.h"
using namespace std;

extern "C" int yylex();
extern "C" int yyparse();
extern "C" FILE *yyin;

void yyerror(const char *msg);

int numErrors;
int numWarnings;
extern int line;
extern int yylex();

//add sibling to node 
TreeNode* addSibling(TreeNode* to, TreeNode* newSibling) {
   
   //check for NULL
   if(to == NULL) {
      return newSibling;
   }
   if(newSibling == NULL) {
      printf("Invalid arg to TreeNode, newSibling is NULL.");
      exit(1);
   }

   TreeNode* next = to;
   while(next) {
      if(next->sibling == NULL) {
         break;
      }
      next = next->sibling;
   }
   next->sibling = newSibling;

   return to;
}

void setType(TreeNode* t, ExpType type, bool isStatic) {
   while(t) {
      t->type = type;
      t->isStatic = isStatic;
      t = t->sibling;
   }
}
TreeNode* syntaxTree;

/*
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
*/

%}
%union
{
   TokenData *tokenData;
   TreeNode *tree;
   ExpType type; //for passing type spec up the tree
}
%token <tokenData> INT ID NUMCONST IF ELSE THEN TO DO FOR RETURN ERROR PRECOMPILER 
%token <tokenData> BOOLCONST STATIC OR BOOL BREAK BY CHAR AND CHARCONST COMMENT NOT WHILE 
%token <tokenData> EQ GEQ LEQ NEQ DEC INC DIVASS SUBASS ADDASS MULASS MAX MIN STRINGCONST
%token <tokenData> FIRSTOP
%token <tokenData> '*' '+' '{' '}' '[' ']' ';' '-' '<' '>' '=' ':' ',' '/' '(' ')' '%' '?'
%token <tokenData> LASTOP
%token <tokenData> LASTTERM
%type <tokenData> assignop relop mulop minmaxop unaryop sumop
%type <tree> program precomList declList decl varDecl scopedVarDecl varDeclList varDeclInit varDeclId funDecl parms parmList parmTypeList
%type <tree> parmIdList parmId stmt matched iterRange unmatched expstmt compoundstmt localDecls stmtList returnstmt breakstmt
%type <tree> exp simpleExp andExp unaryRelExp relExp minmaxExp
%type <tree> sumExp mulExp unaryExp factor mutable  
%type <type> typeSpec
%type <tree> immutable call args argList constant 
%%

program        :  precomList declList  {syntaxTree = $2;}
               ;

precomList     :  precomList PRECOMPILER { $$ = NULL; printf("%s\n", yylval.tokenData->tokenstr);}
               |  PRECOMPILER            { $$ = NULL; printf("%s\n", yylval.tokenData->tokenstr);}
               |  /* empty */            { $$ = NULL;}
               ;

declList       :  declList decl     { $$ = addSibling($1, $2);}
               |  decl              { $$ = $1;}
               ;

decl           :  varDecl  { $$ = $1;}
               |  funDecl  { $$ = $1;}
               ;

varDecl        :  typeSpec varDeclList ';'   { $$ = $2; setType($2, $1, false); yyerrok;}
               ;

scopedVarDecl  :  STATIC typeSpec varDeclList ';'  { $$ = $3; setType($$, $2, true); yyerrok;}
               | typeSpec varDeclList ';'          { $$ = $2; setType($$, $1, false); yyerrok;}
               ;

varDeclList    :  varDeclList ',' varDeclInit   { $$ = $1; addSibling($1, $3);}
               |  varDeclInit                   { $$ = $1;}
               ;

varDeclInit    :  varDeclId              { $$ = $1;}
               |  varDeclId ':' simpleExp { $$ = $1; $$->child[0] = $3;}
               ;

varDeclId      :  ID                   { $$ = newDeclNode(DeclKind::VarK, ExpType::UndefinedType, $1);}
               |  ID '[' NUMCONST ']'  { $$ = newDeclNode(DeclKind::VarK, ExpType::UndefinedType, $1); $$->isArray = true; $$->size = $3->nvalue;}
               ;

typeSpec       :  INT   { $$ = ExpType::Integer;}
               |  BOOL  { $$ = ExpType::Boolean;}
               |  CHAR  { $$ = ExpType::Char;}
               ;

funDecl        :  typeSpec ID '(' parms ')' stmt  { $$ = newDeclNode(DeclKind::FuncK, $1, $2, $4, $6);}
               |  ID '(' parms ')' stmt           { $$ = newDeclNode(DeclKind::FuncK, ExpType::Void, $1, $3, $5);}
               ;

parms          :  parmList    { $$ = $1;} 
               |  /* empty */ { $$ = NULL;}
               ;

parmList       :  parmList ';' parmTypeList  { $$ = addSibling($1, $3);}
               |  parmTypeList                {}
               ;

parmTypeList   :  typeSpec parmIdList  {}
               ;

parmIdList     :  parmIdList ',' parmId   {}
               |  parmId                  { $$ = $1;}
               ;

parmId         :  ID          { /* $$ = $1; */}
               |  ID '[' ']'  {}
               ;

stmt           :  matched     { $$ = $1; }
               |  unmatched   { $$ = $1; }
               ;

matched        :  IF simpleExp THEN matched ELSE matched    {}
               |  WHILE simpleExp DO matched                {}
               |  FOR ID '=' iterRange DO matched           {}
               |  expstmt                                   {}
               |  compoundstmt                              { $$ = $1; }
               |  returnstmt                                {}
               |  breakstmt                                 {}
               ;

iterRange      :  simpleExp TO simpleExp              {}
               |  simpleExp TO simpleExp BY simpleExp {}
               ;

unmatched      :  IF simpleExp THEN stmt                    {}
               |  IF simpleExp THEN matched ELSE unmatched  {}
               |  WHILE simpleExp DO unmatched              {}
               |  FOR ID '=' iterRange DO unmatched         {}
               ;

expstmt        :  exp ';'  {}
               |  ';'      {}
               ;

compoundstmt   :  '{' localDecls stmtList '}'   { $$ = newStmtNode(StmtKind::CompoundK, $1, $2, $3);}
               ;

localDecls     :  localDecls scopedVarDecl   {}
               |  /* empty */                { $$ = NULL;}
               ;

stmtList       :  stmtList stmt  {}
               |  /* empty */    { $$ = NULL;}
               ;

returnstmt     :  RETURN ';'     {}
               |  RETURN exp ';' {}
               ;

breakstmt      :  BREAK ';'   {}
               ;

exp            :  mutable assignop exp    {}
               |  mutable INC             {}
               |  mutable DEC             {}
               |  simpleExp               {}
               |  mutable assignop error  {}
               ;

assignop       :  '='      {}
               |  ADDASS   {}
               |  SUBASS   {}
               |  MULASS   {}
               |  DIVASS   {}
               ;

simpleExp      :  simpleExp OR andExp  {}
               |  andExp               {}
               ;

andExp         :  andExp AND unaryRelExp  {}
               |  unaryRelExp             {}
               ;

unaryRelExp    :  NOT unaryRelExp         {}
               |  relExp                  {}
               ;

relExp         :  minmaxExp relop minmaxExp  {}
               |  minmaxExp                  {}
               ;

relop          :  LEQ   {}
               |  '<'   {}
               |  '>'   {}
               |  GEQ   {}
               |  EQ    {}
               |  NEQ   {}
               ;

minmaxExp      :  minmaxExp minmaxop sumExp  {}
               |  sumExp                     {}
               ;

minmaxop       :  MAX   {}
               |  MIN   {}
               ;

sumExp         :  sumExp sumop mulExp  {}
               |  mulExp               {}
               ;

sumop          :  '+'   {}
               |  '-'   {}
               ;

mulExp         :  mulExp mulop unaryExp   {}
               |  unaryExp                {}
               ;

mulop          :  '*'   {}
               |  '/'   {}
               |  '%'   {}
               ;

unaryExp       :  unaryop unaryExp  {}
               |  factor            {}
               ;

unaryop        :  '-'   {}
               |  '*'   {}
               |  '?'   {}
               ;

factor         :  immutable   {}
               |  mutable     {}
               ;

mutable        :  ID             {}
               |  ID '[' exp ']' {}
               ;

immutable      :  '(' exp ')'    {}
               |  call           {}
               |  constant       {}
               ;

call           :  ID '(' args ')'   {}
               ;

args           :  argList     {}
               |  /* empty */ { $$ = NULL;}
               ;

argList        :  argList ',' exp   { $$ = addSibling($1, $3);}
               |  exp               { $$ = $1; }
               ;

constant       :  NUMCONST    { $$ = newExpNode(ExpKind::ConstantK, $1); $$->type = ExpType::Integer;}
               |  CHARCONST   { $$ = newExpNode(ExpKind::ConstantK, $1); $$->type = ExpType::Char; $$->isArray = false; $$->size = 1; $$->attr.cvalue = $1->cvalue;}
               |  STRINGCONST { $$ = newExpNode(ExpKind::ConstantK, $1); $$->type = ExpType::Char; $$->isArray = true;} 
               |  BOOLCONST   { $$ = newExpNode(ExpKind::ConstantK, $1); $$->type = ExpType::Boolean;}
               ;

   //   PRECOMPILER {printToken(yylval.tinfo, "PRECOMPILER");}
   //|  INT {printToken(yyval.tinfo, "INT");}
   //|  NEQ {printToken(yylval.tinfo, "NEQ");}
   //|  ADDASS {printToken(yyval.tinfo, "ADDASS");}
   //|  SUBASS {printToken(yyval.tinfo, "SUBASS");}
   //|  DIVASS {printToken(yyval.tinfo, "DIVASS");}
   //|  MULASS {printToken(yyval.tinfo, "MULASS");}
   //|  MIN {printToken(yyval.tinfo, "MIN");}
   //|  MAX {printToken(yyval.tinfo, "MAX");}
   //|  BOOLCONST {printToken(yylval.tinfo, "BOOLCONST");}
   //|  BY {printToken(yyval.tinfo, "BY");}
   //|  BREAK {printToken(yyval.tinfo, "BREAK");}
   //|  DO {printToken(yyval.tinfo, "DO");}
   //|  WHILE {printToken(yyval.tinfo, "WHILE");}
   //|  ELSE {printToken(yyval.tinfo, "ELSE");}
   //|  FOR {printToken(yyval.tinfo, "FOR");}
   //|  OR {printToken(yyval.tinfo, "OR");}
   //|  RETURN {printToken(yyval.tinfo, "RETURN");}
   //|  STATIC {printToken(yyval.tinfo, "STATIC");}
   //|  THEN {printToken(yyval.tinfo, "THEN");}
   //|  TO {printToken(yyval.tinfo, "TO");}
   //|  OP {printToken(yylval.tinfo, "OP");}
   //|  ID {printToken(yylval.tinfo, "ID");}
   //|  LT {printToken(yylval.tinfo, "LT");}
   //|  GT {printToken(yylval.tinfo, "GT");}
   //|  LEQ {printToken(yylval.tinfo, "LEQ");}
   //|  GEQ {printToken(yylval.tinfo, "GEQ");}
   //|  CHAR {printToken(yylval.tinfo, "CHAR"); }
   //|  BOOL {printToken(yylval.tinfo, "BOOL"); }
   //|  NOT {printToken(yylval.tinfo, "NOT"); }
   //|  EQ {printToken(yylval.tinfo, "EQ"); }
   //|  IF {printToken(yylval.tinfo, "IF"); }
   //|  INC {printToken(yylval.tinfo, "INC"); }
   //|  DEC {printToken(yylval.tinfo, "DEC"); }
   //|  AND {printToken(yylval.tinfo, "AND"); }
   //|  NUMCONST {printToken(yylval.tinfo, "NUMCONST");}
   //|  CHARCONST {printToken(yylval.tinfo, "CHARCONST"); }
   //|  STRINGCONST {printToken(yylval.tinfo, "STRINGCONST"); }
   //|  ERROR    {cout << "ERROR(" << yylval.tinfo.linenum << "): Token error, invalid or misplaced input character: '" << yylval.tinfo.tokenstr << "'. Character Ignored." << endl;}
   //;
%%
void yyerror (const char *msg)
{ 
   cout << "Error: " <<  msg << endl;
}
int main(int argc, char **argv) {
   yylval.tokenData = (TokenData*)malloc(sizeof(TokenData));
   yylval.tree = (TreeNode*)malloc(sizeof(TreeNode));
   yylval.tokenData->linenum = 1;
   int index, ch;
   char *file = NULL;
   bool dotAST = false; //make dot file of AST
   extern FILE *yyin;

   while ((ch = getopt (argc, argv, "d")) != -1) {
      switch (ch) {
         case 'd':
            dotAST = true;
            break;
         case '?':
         default:
            //usage();
            ;
      }
   }
   if ( optind == argc ) yyparse();
   for (index = optind; index < argc; index++) 
   {
      yyin = fopen (argv[index], "r");
      yyparse();
      fclose (yyin);
   }
   if(numErrors == 0) {
      printTree(stdout, syntaxTree, false, false);
      if(dotAST) {
         //printDotTree(stdout, syntaxTree, false, false);
      }
   }
   printf("Number of warnings: %d\n", numWarnings);
   printf("Number of errors: %d\n", numErrors);
   return 0;
}

