%{
/**
 * @file parser.y
 * @author Dawson Burgess (dawsonhburgess@gmail.com)
 * 
 * @brief 
 * 
 * @version 2.0
 * @date 2024-05-16
 * 
 * @copyright Copyright (c) 2024
 * 
 */
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
extern int yylex();

void yyerror(const char *msg);

int numErrors;
int numWarnings;
extern int line;
extern int yylex();

// add sibling to node 
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

%}
%union
{
   TokenData *tokenData;
   TreeNode *tree;
   ExpType type; //for passing type spec up the tree
}
%token <tokenData> INT ID NUMCONST IF ELSE THEN TO DO FOR RETURN /* ERROR */ PRECOMPILER SIZEOF CHSIGN 
%token <tokenData> BOOLCONST STATIC OR BOOL BREAK BY CHAR AND CHARCONST /* COMMENT */ NOT WHILE 
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
               |  typeSpec varDeclList ';'          { $$ = $2; setType($$, $1, false); yyerrok;}
               ;

varDeclList    :  varDeclList ',' varDeclInit   { $$ = ($3==NULL ? $1 : addSibling($1, $3)); }
               |  varDeclInit                   { $$ = $1;}
               ;

varDeclInit    :  varDeclId              { $$ = $1;}
               |  varDeclId ':' simpleExp { $$ = $1; $$->child[0] = $3;}
               ;

varDeclId      :  ID                   { $$ = newDeclNode(DeclKind::VarK, ExpType::UndefinedType, $1); $$->isArray = false; $$->isStatic = false; }
               |  ID '[' NUMCONST ']'  { $$ = newDeclNode(DeclKind::VarK, ExpType::UndefinedType, $1); $$->isArray = true; $$->isStatic = true; $$->size = $3->nvalue;}
               ;

typeSpec       :  INT   { $$ = ExpType::Integer;}
               |  BOOL  { $$ = ExpType::Boolean;}
               |  CHAR  { $$ = ExpType::Char;}
               ;

funDecl        :  typeSpec ID '(' parms ')' stmt  { $$ = newDeclNode(DeclKind::FuncK, $1, $2, $4, $6); $$->isArray = false; $$->isStatic = false; }
               |  ID '(' parms ')' stmt           { $$ = newDeclNode(DeclKind::FuncK, ExpType::Void, $1, $3, $5); $$->isArray = false; $$->isStatic = false; }
               ;

parms          :  parmList    { $$ = $1;} 
               |  /* empty */ { $$ = NULL;}
               ;

parmList       :  parmList ';' parmTypeList   { $$ = ($3==NULL ? $1 : addSibling($1, $3)); }
               |  parmTypeList                { $$ = $1; }
               ;

parmTypeList   :  typeSpec parmIdList  { $$ = $2; setType($2, $1, false); }
               ;

parmIdList     :  parmIdList ',' parmId   { $$ = ($3==NULL ? $1 : addSibling($1, $3)); }
               |  parmId                  { $$ = $1;}
               ;

parmId         :  ID          { $$ = newDeclNode(DeclKind::ParamK, ExpType::UndefinedType, $1); }
               |  ID '[' ']'  { $$ = newDeclNode(DeclKind::ParamK, ExpType::UndefinedType, $1); $$->isArray = true; }
               ;

stmt           :  matched     { $$ = $1; }
               |  unmatched   { $$ = $1; }
               ;

matched        :  IF simpleExp THEN matched ELSE matched    { $$ = newStmtNode(StmtKind::IfK, $1, $2, $4, $6); }
               |  WHILE simpleExp DO matched                { $$ = newStmtNode(StmtKind::WhileK, $1, $2, $4); }
               |  FOR ID '=' iterRange DO matched           { $$ = newStmtNode(StmtKind::ForK, $1, newDeclNode(DeclKind::VarK, ExpType::Integer, $2), $4, $6); }
               |  expstmt                                   { $$ = $1; }
               |  compoundstmt                              { $$ = $1; }
               |  returnstmt                                { $$ = $1; }
               |  breakstmt                                 { $$ = $1; }
               ;

iterRange      :  simpleExp TO simpleExp              { $$ = newStmtNode(StmtKind::RangeK, $2, $1, $3); }
               |  simpleExp TO simpleExp BY simpleExp { $$ = newStmtNode(StmtKind::RangeK, $2, $1, $3, $5); }
               ;

unmatched      :  IF simpleExp THEN stmt                    { $$ = newStmtNode(StmtKind::IfK, $1, $2, $4); }
               |  IF simpleExp THEN matched ELSE unmatched  { $$ = newStmtNode(StmtKind::IfK, $1, $2, $4, $6); }
               |  WHILE simpleExp DO unmatched              { $$ = newStmtNode(StmtKind::WhileK, $1, $2, $4); }
               |  FOR ID '=' iterRange DO unmatched         { $$ = newStmtNode(StmtKind::ForK, $1, newDeclNode(DeclKind::VarK, ExpType::Integer, $2), $4, $6); }
               ;

expstmt        :  exp ';'  { $$ = $1; }
               |  ';'      { $$ = NULL; }
               ;

compoundstmt   :  '{' localDecls stmtList '}'   { $$ = newStmtNode(StmtKind::CompoundK, $1, $2, $3); yyerrok; }
               ; 

localDecls     :  localDecls scopedVarDecl   { $$ = ($2==NULL ? $1 : addSibling($1, $2)); }
               |  /* empty */                { $$ = NULL; }
               ;

stmtList       :  stmtList stmt  { $$ = ($2==NULL ? $1 : addSibling($1, $2)); }
               |  /* empty */    { $$ = NULL; }
               ;

returnstmt     :  RETURN ';'     { $$ = newStmtNode(StmtKind::ReturnK, $1); }
               |  RETURN exp ';' { $$ = newStmtNode(StmtKind::ReturnK, $1, $2); }
               ;

breakstmt      :  BREAK ';'   { $$ = newStmtNode(StmtKind::BreakK, $1); }
               ;

exp            :  mutable assignop exp    { $$ = newExpNode(ExpKind::AssignK, $2, $1, $3);}
               |  mutable INC             { $$ = newExpNode(ExpKind::AssignK, $2, $1); }
               |  mutable DEC             { $$ = newExpNode(ExpKind::AssignK, $2, $1); }
               |  simpleExp               { $$ = $1; }
               |  mutable assignop error  { }
               ;

assignop       :  '='      { $$ = $1; }
               |  ADDASS   { $$ = $1; }
               |  SUBASS   { $$ = $1; }
               |  MULASS   { $$ = $1; }
               |  DIVASS   { $$ = $1; }
               ;

simpleExp      :  simpleExp OR andExp  { $$ = newExpNode(ExpKind::OpK, $2, $1, $3); }
               |  andExp               { $$ = $1; }
               ;

andExp         :  andExp AND unaryRelExp  { $$ = newExpNode(ExpKind::OpK, $2, $1, $3); }
               |  unaryRelExp             { $$ = $1; }
               ;

unaryRelExp    :  NOT unaryRelExp         { $$ = newExpNode(ExpKind::OpK, $1, $2); }
               |  relExp                  { $$ = $1; }
               ;

relExp         :  minmaxExp relop minmaxExp  { $$ = newExpNode(ExpKind::OpK, $2, $1, $3); }
               |  minmaxExp                  { $$ = $1; }
               ;

relop          :  LEQ   { $$ = $1; }
               |  '<'   { $$ = $1; }
               |  '>'   { $$ = $1; }
               |  GEQ   { $$ = $1; }
               |  EQ    { $$ = $1; }
               |  NEQ   { $$ = $1; }
               ;

minmaxExp      :  minmaxExp minmaxop sumExp  { $$ = newExpNode(ExpKind::OpK, $2, $1, $3); }
               |  sumExp                     { $$ = $1; }
               ;

minmaxop       :  MAX   { $$ = $1; }
               |  MIN   { $$ = $1;}
               ;

sumExp         :  sumExp sumop mulExp  { $$ = newExpNode(ExpKind::OpK, $2, $1, $3); }
               |  mulExp               { $$ = $1; }
               ;

sumop          :  '+'   { $$ = $1; }
               |  '-'   { $$ = $1; }
               ;

mulExp         :  mulExp mulop unaryExp   { $$ = newExpNode(ExpKind::OpK, $2, $1, $3); }
               |  unaryExp                { $$ = $1; }
               ;

mulop          :  '*'   { $$ = $1; }
               |  '/'   { $$ = $1; }
               |  '%'   { $$ = $1; }
               ;

unaryExp       :  unaryop unaryExp  { $$ = newExpNode(ExpKind::OpK, $1, $2); } 
               |  factor            { $$ = $1; }
               ;

unaryop        :  '-'   { $1->tokenclass = CHSIGN; $$ = $1; }
               |  '*'   { $1->tokenclass = SIZEOF; $$ = $1; }
               |  '?'   { $$ = $1; }
               ;

factor         :  immutable   { $$ = $1; }
               |  mutable     { $$ = $1; }
               ;

mutable        :  ID             { $$ = newExpNode(ExpKind::IdK, $1); }
               |  ID '[' exp ']' { $$ = newExpNode(ExpKind::OpK, $2, newExpNode(ExpKind::IdK, $1), $3); $$->attr.op = $2->tokenclass; $$->isArray = true; } // $$ = newExpNode(ExpKind::OpK, $2, newExpNode(ExpKind::IdK, $1), $3);$$->attr.op = $2->tokenclass; $$->isArray = true
               ;

immutable      :  '(' exp ')'    { $$ = $2; }
               |  call           { $$ = $1; }
               |  constant       { $$ = $1; }
               ;

call           :  ID '(' args ')'   { $$ = newExpNode(ExpKind::CallK, $1, $3);}
               ;

args           :  argList     { $$ = $1;}
               |  /* empty */ { $$ = NULL;}
               ;

argList        :  argList ',' exp   { $$ = addSibling($1, $3);}
               |  exp               { $$ = $1; }
               ;

constant       :  NUMCONST    { $$ = newExpNode(ExpKind::ConstantK, $1); $$->type = ExpType::Integer;}
               |  CHARCONST   { $$ = newExpNode(ExpKind::ConstantK, $1); $$->type = ExpType::Char; $$->isArray = false; $$->size = 1; $$->attr.cvalue = $1->cvalue;}
               |  STRINGCONST { $$ = newExpNode(ExpKind::ConstantK, $1); $$->type = ExpType::Char; $$->isArray = true; $$->size = strlen($1->tokenstr);} 
               |  BOOLCONST   { $$ = newExpNode(ExpKind::ConstantK, $1); $$->type = ExpType::Boolean;}
               ;

%%
void yyerror (const char *msg)
{ 
   cout << "Error: " <<  msg << endl;
}

char *largerTokens[LASTTERM+1];        // used in the utils.cpp file printing routines

// create a mapping from token class enum to a printable name in a
// way that makes it easy to keep the mapping straight.

void initTokenStrings()
{
    largerTokens[ADDASS] = (char *)"+=";
    largerTokens[AND] = (char *)"and";
    largerTokens[BOOL] = (char *)"bool";
    largerTokens[BOOLCONST] = (char *)"boolconst";
    largerTokens[BREAK] = (char *)"break";
    largerTokens[BY] = (char *)"by";
    largerTokens[CHAR] = (char *)"char";
    largerTokens[CHARCONST] = (char *)"charconst";
    //largerTokens[CHSIGN] = (char *)"chsign";
    largerTokens[DEC] = (char *)"--";
    largerTokens[DIVASS] = (char *)"/=";
    largerTokens[DO] = (char *)"do";
    largerTokens[ELSE] = (char *)"else";
    largerTokens[EQ] = (char *)"==";
    largerTokens[FOR] = (char *)"for";
    largerTokens[GEQ] = (char *)">=";
    largerTokens[ID] = (char *)"id";
    largerTokens[IF] = (char *)"if";
    largerTokens[INC] = (char *)"++";
    largerTokens[INT] = (char *)"int";
    largerTokens[LEQ] = (char *)"<=";
    largerTokens[MAX] = (char *)":>:";
    largerTokens[MIN] = (char *)":<:";
    largerTokens[MULASS] = (char *)"*=";
    largerTokens[NEQ] = (char *)"!=";
    largerTokens[NOT] = (char *)"not";
    largerTokens[NUMCONST] = (char *)"numconst";
    largerTokens[OR] = (char *)"or";
    largerTokens[RETURN] = (char *)"return";
    //largerTokens[SIZEOF] = (char *)"sizeof";
    largerTokens[STATIC] = (char *)"static";
    largerTokens[STRINGCONST] = (char *)"stringconst";
    largerTokens[SUBASS] = (char *)"-=";
    largerTokens[THEN] = (char *)"then";
    largerTokens[TO] = (char *)"to";
    largerTokens[WHILE] = (char *)"while";
    largerTokens[LASTTERM] = (char *)"lastterm";
}

int main(int argc, char **argv) {
   yylval.tokenData = (TokenData*)malloc(sizeof(TokenData));
   yylval.tree = (TreeNode*)malloc(sizeof(TreeNode));
   yylval.tokenData->linenum = 1;
   int index, ch;
   char *file = NULL;
   bool dotAST = false; //make dot file of AST
   extern FILE *yyin;
   initTokenStrings();

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

