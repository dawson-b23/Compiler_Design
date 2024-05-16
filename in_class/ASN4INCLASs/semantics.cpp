#include <string.h>
#include "treeNodes.h"
#include "treeUtils.h"
#include "symbolTable.h"
#include "parser.tab.h" // always put last 

static int foffset;
static int goffset;

void treeTraverse() {
    
}

void debugPrintf(const char *input) {
    if(1 == 1) {
        printf("%s\n", input);
    }
}

bool insertCheck(TreeNode *syntree, SymbolTable *symtab) {
    if(!symtab->insert(syntree->attr.name, syntree)) {
        /// hmmmmm this is an error
        return false;
    }
    return true; 
}

TreeNode *semanticAnalysis(TreeNode *syntree,          // pass in and return an annotated syntax tree
                           bool shareCompoundSpaceIn,   // SPECIAL OPTION: make compound after a function share scope
                           bool noDuplicateUndefsIn,    // SPECIAL OPTION: no duplicate undefines
                           SymbolTable *symtabX,       // pass in and return the symbol table
                           int &globalOffset)             // return the offset past the globals
{

}

// tree traversal 
void treeTraverseDecl(TreeNode *syntree, SymbolTable *symtab) {
    debugPrintf("treeTraverseDecl");
    TreeNode *c0, *c1, *temp;
    c0 = syntree->child[0];
    c1 = syntree->child[1];

    switch(syntree->kind.decl) {
        case FuncK: 
            debugPrintf("FuncK");
            foffset = -2;
            insertCheck(syntree, symtab);
            symtab->enter(syntree->attr.name);
            treeTraverse(c0, symtab);
            syntree->varKind = Global;
            treeTraverse(c1, symtab);
            symtab->leave();
            break;
        case VarK:
            debugPrintf("VarK");
            //// note: no break on this 
        case ParamK:
            debugPrintf("ParamK");
            if(insertCheck(syntree, symtab)) {
                syntree->varKind = Global;
                syntree->offset = goffset;
                goffset -= syntree->size;
            } 
            else if(syntree->isStatic) {
                ///// come back to this 
            }
            else {
                syntree->varKind = Local;
                syntree->offset = foffset;
                foffset -= syntree->size;
            }
            if(syntree->kind.decl == ParamK) syntree-?VarKind = Parameter;


            break;
    }
}

void treeTraverseExp(TreeNode *syntree, SymbolTable *symtab) {
    debugPrintf("treeTraverseDecl");
    TreeNode *c0, *c1, *temp;
    c0 = syntree->child[0];
    c1 = syntree->child[1];

    switch(syntree->kind.exp) {
        case OpK: 
            // no break on purpose 
        case AssignK:
            debugPrintf("AssignK");
            treeTraverse(c0, symtab);
            treeTraverse(c1, symtab);
            if(syntree->attr.op == int('+') || syntree->attr.op == int('[')) {
                syntree->type = c0->type; 
            }
            else if(syntree->attr.op == AND /* then the rest*/) {
                syntree->type = ExpType::Boolean;
            }
            else {
                syntree->type = Integer; 
            }

            break;
        case CallK:
            debugPrintf("CallK");
            
            break;
        case ConstantK:
            debugPrintf("ConstantK");
            syntree->isConst = true;
            break;
        case IdK:
            debugPrintf("IdK");
            if(temp = (TreeNode*) (symtab->lookup(syntree->attr.name))) {
                temp->isUsed = true;
                syntree->type = temp->type;
                syntree->isStatic= temp->isStatic;
                syntree->isArray = temp->isArray;
                syntree->size = temp->size;
                syntree->varKind = temp->varKind;
                syntree->offset= temp->offset;
            }
            else {
                //probably and error 
            }
            break;
    }
}

 void treeTraverseStmt(TreeNode *syntree, SymbolTable *symtab) {
    debugPrintf("treeTraverseDecl");
    TreeNode *c0, *c1, *temp;
    c0 = syntree->child[0];
    c1 = syntree->child[1];

    switch(syntree->kind.stmt) {
        case CompoundK:
            debugPrintf("CompoundK");
            break;
        case ReturnK:
            debugPrintf("ReturnK");
        case IfK:
            debugPrintf("IfK");
            break;
        case WhileK:
            debugPrintf("WhileK");
            break;
        
    }


    
}