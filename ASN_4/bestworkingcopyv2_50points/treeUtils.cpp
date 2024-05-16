#include "treeUtils.h"
#include "scanType.h"
#include <stdlib.h>
#include <iostream>
using namespace std;

char *varKindToStr(int kind)
{
    switch (kind) {
    case None:
        return (char *)"None";
    case Local:
        return (char *)"Local";
    case Global:
        return (char *)"Global";
    case Parameter:
        return (char *)"Parameter";
    case LocalStatic:
        return (char *)"LocalStatic";
    default:
   return (char *)"unknownVarKind";
    }
}

// allocate a FIX BUFFER.  You must copy the string if you
// are referencing the function twice in the same printf for example.
char expTypeToStrBuffer[80];
char *expTypeToStr(ExpType type, bool isArray, bool isStatic)
{
    char *typeName;

    switch (type) {
    case Void:
       typeName = (char *)"type void";
       break;
    case Integer:
       typeName = (char *)"type int";
       break;
    case Boolean:
       typeName = (char *)"type bool";
       break;
    case Char:
       typeName = (char *)"type char";
       break;
    case UndefinedType:
       typeName = (char *)"undefined type";
       break;
    default:
       char *buffer;
       buffer = new char [80];
       sprintf(buffer, "invalid expType: %d", (int)type);
       return buffer;
    }

    // add static and array attributes
    // static type int
    // static array of type int
    sprintf(expTypeToStrBuffer, "%s%s%s",
            (isStatic ? "static " : ""),
            (isArray ? "array of " : ""),
            typeName);

    return strdup(expTypeToStrBuffer); // memory leak
}

// print a node without a newline
void printTreeNode(FILE *listing, TreeNode *tree, bool showExpType, bool showAllocation)
{
   if(tree == nullptr) {
      return; 
   }
   // print a declaration node
   if (tree->nodekind == DeclK) {
      switch (tree->kind.decl) {
         case VarK:
            printf("Var: %s ", tree->attr.name);
            printf("of %s", expTypeToStr(tree->type, tree->isArray, tree->isStatic));
            if (showAllocation) {
               if(tree->isArray) {}
               /*
               if(tree->isArray) {
                  tree->offset += 1; // adjusts one from offset in some scenarios 
               }
               else {
                  tree->offset +=2;
               }
               */
                printf(" [mem: %s loc: %d size: %d]", varKindToStr(tree->varKind), tree->offset, tree->size);
            }
            break;
         case FuncK:
            printf("Func: %s ", tree->attr.name);
            printf("returns %s", expTypeToStr(tree->type, tree->isArray, tree->isStatic));
            if (showAllocation) {
                printf(" [mem: %s loc: %d size: %d]", varKindToStr(tree->varKind), tree->offset, tree->size);
            }
            break;
         case ParamK:
            printf("Parm: %s ", tree->attr.name);
            printf("of %s", expTypeToStr(tree->type, tree->isArray, tree->isStatic));
            if (showAllocation) {
                printf(" [mem: %s loc: %d size: %d]", varKindToStr(tree->varKind), tree->offset, tree->size);
            }
            break;
         default:
            fprintf(listing, "Unknown declaration node kind: %d",
            tree->kind.decl);
            break;
      }
   }

   // print a statement node
   else if (tree->nodekind == StmtK) {
      switch (tree->kind.stmt) {
      case IfK:
         fprintf(listing, "If");
         break;
      case WhileK:
         fprintf(listing, "While");
         break;
      case CompoundK:
         fprintf(listing, "Compound");
            if (showAllocation) {
               printf(" [mem: %s loc: %d size: %d]", varKindToStr(tree->varKind), tree->offset, tree->size);
            }
         break;
      case ForK:
         fprintf(listing, "For");
         if (showAllocation) {
            printf(" [mem: %s loc: %d size: %d]", varKindToStr(tree->varKind), tree->offset, tree->size);
         }
         break;
      case RangeK:
         fprintf(listing, "Range");
         break;
      case ReturnK:
         fprintf(listing, "Return");
         break;
      case BreakK:
         fprintf(listing, "Break");
         break;
      default:
         fprintf(listing, "Unknown  statement node kind: %d",tree->kind.stmt);
         break;
      }
   }

   // print an expression node
   else if (tree->nodekind == ExpK) {
      switch (tree->kind.exp) {
      case AssignK:
         fprintf(listing, "Assign: %s", tokenToStr(tree->attr.op));
         break;
      case OpK:
         fprintf(listing, "Op: %s", tokenToStr(tree->attr.op));
         break;
      case ConstantK:
         switch (tree->type) {
            case Boolean:
               fprintf(listing, "Const %s", (tree->attr.value) ?  "true" : "false");
               break;
            case Integer:
               fprintf(listing, "Const %d", tree->attr.value);
               break;
            case Char:
               if (tree->isArray) {
                  fprintf(listing, "Const ");
                  printf("\"");
                  for (int i=1; i<tree->size; i++) { // changed from -1
                     printf("%c", tree->attr.string[i]);
                  }
                  tree->size -= 1;
                  //printf("\"");
               }
               else fprintf(listing, "Const '%c'", tree->attr.cvalue);
               break;
            case Void:
            case UndefinedType:
               fprintf(listing, "SYSTEM ERROR: parse tree contains invalid type for constant: %s\n", expTypeToStr(tree->type));
         }
         break;
      case IdK:
         fprintf(listing, "Id: %s", tree->attr.name);
         break;
      case CallK:
         fprintf(listing, "Call: %s", tree->attr.name);
         break;
      default:
         fprintf(listing, "Unknown expression node kind: %d", tree->kind.exp);
         break;
   }
   if (showExpType) {
       fprintf(listing, " of %s", expTypeToStr(tree->type, tree->isArray, tree->isStatic));
   }
        if (showAllocation) {
            if (tree->kind.exp == IdK || tree->kind.exp == ConstantK && tree->type == Char && tree->isArray) {
                printf(" [mem: %s loc: %d size: %d]", varKindToStr(tree->varKind), tree->offset, tree->size);
            }
        }
    }
    else fprintf(listing, "Unknown class of node: %d",
       tree->nodekind);

    fprintf(listing, " [line: %d]", tree->lineno);
}

TreeNode *newStmtNode(StmtKind kind, TokenData *token, TreeNode *c0, TreeNode *c1, TreeNode *c2) {

   TreeNode *newNode = (TreeNode*)malloc(sizeof(TreeNode));

   newNode->nodekind = NodeKind::StmtK;
   newNode->kind.stmt = kind;
   newNode->child[0] = c0;
   newNode->child[1] = c1;
   newNode->child[2] = c2;
   newNode->attr.name = token->tokenstr;

   newNode->size = 1;
   newNode->offset = 0;
   newNode->sibling = nullptr;
   newNode->nodeNum = 1; // arbituary
   newNode->lineno = token->linenum;

   return newNode;

}

TreeNode *newDeclNode(DeclKind kind, ExpType type, TokenData *token, TreeNode *c0, TreeNode *c1, TreeNode *c2) {

   TreeNode *newNode = (TreeNode*)malloc(sizeof(TreeNode));

   newNode->nodekind = NodeKind::DeclK;
   newNode->kind.decl = kind;
   newNode->child[0] = c0;
   newNode->child[1] = c1;
   newNode->child[2] = c2;
   if(token != NULL ) {
      newNode->attr.name = token->tokenstr;
      newNode->attr.cvalue = token->cvalue;
      newNode->lineno = token->linenum;
   }
   newNode->type = type;

   newNode->size = 1;
   newNode->offset = 0;
   newNode->sibling = nullptr;
   newNode->nodeNum = 1; // arbituary
   //newNode->lineno = token->linenum;


   return newNode;
}

TreeNode *newExpNode(ExpKind kind, TokenData *token, TreeNode *c0, TreeNode *c1, TreeNode *c2) {

   TreeNode *newNode = (TreeNode*)malloc(sizeof(TreeNode));

   newNode->nodekind = NodeKind::ExpK;
   newNode->kind.exp = kind;
   newNode->child[0] = c0;
   newNode->child[1] = c1;
   newNode->child[2] = c2;
   newNode->attr.name = token->tokenstr;
   newNode->attr.cvalue = token->cvalue;
   newNode->attr.op = token->tokenclass;
   newNode->attr.value = token->nvalue;
   newNode->attr.string = token->tokenstr;
   /*
   if(token->isCHSIGN = true) {
      newNode->attr.op = 666;
   }
   if(token->isSIZEOF = true) {
      newNode->attr.op = 667;
   }*/
   //printf("node string: %s", newNode->attr.string);
   newNode->size = 1;
   newNode->offset = 0;
   newNode->sibling = nullptr;
   newNode->nodeNum = 1; // arbituary
   newNode->lineno = token->linenum;

   return newNode;
}

TreeNode *cloneNode(TreeNode *currnode) {

}

void printTreeRecursive(FILE *out, TreeNode *syntaxTree, bool showExpType, bool showAllocation, int depth, int siblingCount = 1){
   //per order DFS
   if(syntaxTree == NULL) {
      return;
   }

   printTreeNode(out, syntaxTree, showExpType, showAllocation);
   fprintf(out, "\n");


   for(int i = 0; i < MAXCHILDREN; i++) {
      // draw enough . . . for this node 
      if(syntaxTree->child[i] != NULL) {
         //two spaces at the end
         for(int i = 0; i <= depth; i++) {
            printf(".   ");
         }
         fprintf(out,"Child: %d  ", i /* can also add depth here */);
         printTreeRecursive(out, syntaxTree->child[i], showExpType, showAllocation, depth + 1);
      }
   }

   TreeNode *sibling = syntaxTree->sibling;
   if(sibling) {
      // show . . depth
      for(int i = 0; i < depth; i++) {
         printf(".   ");
      }
      // again two spaces at the end
      fprintf(out,"Sibling: %d  ", siblingCount);
      //printIndent(depth);
      printTreeRecursive(out, sibling, showExpType, showAllocation, depth, siblingCount + 1);
   }

}

void printTree(FILE *out, TreeNode *syntaxTree, bool showExpType, bool showAllocation) {

   if(syntaxTree == NULL) {
      fprintf(out, "NULL\n");
      return ;
   }

   printTreeRecursive(out, syntaxTree, showExpType, showAllocation, 0, 1);

}

char *tokenToStr(int type) { 
   initTokenStrings();
   switch(type)
    {
      case '=':
         return (char *)"=";

      case '*':
         return (char *)"*";

      case '+':
         return (char *)"+"; 

      case '{':
         return (char *)"{"; 
 
      case '}':
         return (char *)"}"; 

      case '[':
         return (char *)"["; 

      case ']':
         return (char *)"]"; 

      case ';':
         return (char *)";"; 

      case '-':
         return (char *)"-"; 

      case '<':
         return (char *)"<"; 

      case '>':
         return (char *)">"; 

      case ':':
         return (char *)":"; 

      case ',':
         return (char *)","; 

      case '/':
         return (char *)"/"; 

      case '(':
         return (char *)"("; 

      case ')':
         return (char *)")"; 

      case '%':
         return (char *)"%"; 

      case '?':
         return (char *)"?"; 
      case 269:
         return (char *)"sizeof";

      case 270:
         return (char *)"chsign";

      case 273: 
         return (char *)"or";

      case 278:
         return (char *)"and";

      case 280:
         return (char *)"not";

      case 282:
         return (char *)"==";

      case 283:
         return (char *)">=";

      case 284:
         return (char *)"<=";

      case 285:
         return (char *)"!=";

      case 286:
         return (char *)"--";

      case 287:
         return (char *)"++";

      case 288:
         return (char *)"/=";

      case 289: 
         return (char *)"-=";

      case 290:
         return (char *)"+=";

      case 291:
         return (char *)"*=";

      case 292:
         return (char *)":>:";

      case 293:
         return (char *)":<:";

      default:
         printf("%d ", type);
         break;
   }
   return((char *)"error");
}

void printIndent(int depth) {

   for(int i = 0; i <= depth; i++) {
      printf(".   ");
   }
}