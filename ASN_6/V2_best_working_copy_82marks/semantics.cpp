#include <string.h>
#include "treeNodes.h"
#include "treeUtils.h"
#include "symbolTable.h"
#include "semantics.h"
#include "parser.tab.h" // always put last 

static int foffset = 0; // top of local space (inside a frame) 
static int goffset; // top of global space (offset for where is frame)
static int statCnt = 0;

extern int numErrors;
extern int numWarnings;

void treeTraverse(TreeNode *syntree, SymbolTable *symtab) {
    if (syntree == NULL) {
        return;
    }

    // Perform semantic analysis based on the node type
    switch (syntree->nodekind) {
        case StmtK:
            treeTraverseStmt(syntree, symtab);
            break;
        case DeclK:
            treeTraverseDecl(syntree, symtab);
            break;
        case ExpK:
            treeTraverseExp(syntree, symtab);
            break;
        default:
            printf("error, no nodekind matched.\n");
            break;
    }
    if (syntree->sibling != NULL) {
        treeTraverse(syntree->sibling, symtab);
    }
}

TreeNode *loadIOLib(TreeNode *syntree) {
    TreeNode *input, *output, *param_output;
    TreeNode *inputb, *outputb, *param_outputb;
    TreeNode *inputc, *outputc, *param_outputc; 
    TreeNode *outnl;

    ////// define treenodes //////

    // 1 input 
    input = newDeclNode(FuncK, Integer);
    input->lineno = -1; // all are at -1 
    input->attr.name = strdup("input"); //We named the variables well
    input->type = Integer;

    // 2 inputb
    inputb = newDeclNode(FuncK, Boolean);
    inputb->lineno = -1; // all are at -1 
    inputb->attr.name = strdup("inputb"); //We named the variables well
    inputb->type = Boolean;

    // 3 inputc
    inputc = newDeclNode(FuncK, Boolean);
    inputc->lineno = -1; // all are at -1 
    inputc->attr.name = strdup("inputc"); //We named the variables well
    inputc->type = Char;

    // 4 param_putput 
    param_output = newDeclNode(ParamK, Void);
    //// lineno not needed but it didnt match so uhhhh
    param_output->lineno = -1; // all are at -1 
    param_output->attr.name = strdup("*dummy*"); // special case 
    param_output->type = Integer;

    // 5 output 
    output = newDeclNode(FuncK, Void);
    output->lineno = -1; // all are at -1 
    output->attr.name = strdup("output"); //We named the variables well
    output->size = -3;
    output->type = Void;
    output->child[0] = param_output;

    // 6 param_outputb
    param_outputb = newDeclNode(ParamK, Void);
    //// lineno not needed but it didnt match so uhhhh
    param_outputb->lineno = -1; // all are at -1
    param_outputb->attr.name = strdup("*dummy*");
    param_outputb->type = Boolean;

    // 7 outputb
    outputb = newDeclNode(FuncK, Void);
    outputb->lineno = -1; // all are at -1 
    outputb->attr.name = strdup("outputb"); //We named the variables well
    outputb->size = -3;
    outputb->type = Void;
    outputb->child[0] = param_outputb;

    // 8 param_outputc
    param_outputc = newDeclNode(ParamK, Void);
    //// lineno not needed but it didnt match so uhhhh
    param_outputc->lineno = -1; // all are at -1
    param_outputc->attr.name = strdup("*dummy*");
    param_outputc->type = Char;

    // 9 outputc
    outputc = newDeclNode(FuncK, Void);
    outputc->lineno = -1; // all are at -1 
    outputc->attr.name = strdup("outputc"); //We named the variables well
    outputc->size = -3;
    outputc->type = Void;
    outputc->child[0] = param_outputc;

    // 10 outnl
    outnl = newDeclNode(FuncK, Void);
    outnl->lineno = -1; // all are at -1 
    outnl->attr.name = strdup("outnl"); //We named the variables well
    outnl->type = Void;
    outnl->child[0] = NULL;

    // link them and prefix the tree we are interested in traversing.
    // This will put the symbols in the symbol table.
    input->sibling = output;
    output->sibling = inputb;
    inputb->sibling = outputb;
    outputb->sibling = inputc;
    inputc->sibling = outputc;
    outputc->sibling = outnl;
    outnl->sibling = syntree; // add in the tree we were given
    return input;
}

void debugPrintf(const char *input) {
    if(1 == 0) {
        printf("%s\n", input);
    }
}

bool insertCheck(TreeNode *syntree, SymbolTable *symtab) {
    debugPrintf("insertcheck");
    if(!symtab->insert(syntree->attr.name, syntree)) {
        /// hmmmmm this is an error
        TreeNode *temp;
        temp = (TreeNode*)(symtab->lookup(syntree->attr.name));
        printf("SEMANTIC ERROR(%d): Symbol \'%s\' is already declared at line %d.\n", syntree->lineno, syntree->attr.name, temp->lineno);
        numErrors++;
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
    syntree = loadIOLib(syntree);
    goffset = globalOffset;
    treeTraverse(syntree, symtabX);

    // remember where the globals are
    globalOffset = goffset;

    // checking to make sure main exists
    // lookup() will return NULL if look up value is not found 
    if(symtabX->lookup("main") == NULL) { 
        printf("LINKER ERROR: A function named \'main\' with no parameters must be defined.\n");
        numErrors++;
    }
    return syntree;
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
            syntree->size = foffset;
            treeTraverse(c1, symtab);
            symtab->leave();
            break;

        case VarK:
            debugPrintf("VarK");
            if(c0 != NULL) { 
                syntree->isAssigned = true;
                treeTraverse(c0, symtab);
                //checkTypeInit(current, c0);
            }
       
            //// note: no break on this 
        case ParamK:
            debugPrintf("ParamK");
            if(insertCheck(syntree, symtab)) {
                if(symtab->depth() == 1) {
                    syntree->varKind = Global;
                    syntree->offset = goffset;
                    goffset -= syntree->size; 
                }
                else if(syntree->isStatic) {
                    syntree->varKind = LocalStatic;
                    syntree->offset = goffset; 
                    goffset -= syntree->size;
                    char *tmpName = new char [strlen(syntree->attr.name) + 10];
                    sprintf(tmpName, "%s-%d",syntree->attr.name, ++statCnt);
                    symtab->insertGlobal(tmpName, syntree); 
                }
                else {
                    syntree->varKind = Local;
                    syntree->offset = foffset;
                    foffset -= syntree->size;
                }
            }
            else {
                if(syntree->kind.decl == VarK){
                    temp = (TreeNode *)(symtab->lookup(syntree->attr.name));
                    syntree->varKind = temp->varKind;
                }
            }
            if(syntree->kind.decl == ParamK) { 
                syntree->varKind = Parameter;
            }
            if(syntree->kind.decl == VarK && syntree->isArray) {
                syntree->offset--;
            }
            if(c0->type == Integer && c1->type != Integer) {
                //printf("C0: %s/n", c0->attr.name);
                //printf("C1: %s/n", c1->attr.name);
                //printf("Curr: %s/n", syntree->attr.name);
            }
            break;
    }
}

void treeTraverseExp(TreeNode *syntree, SymbolTable *symtab) {
    debugPrintf("treeTraverseDecl");
    TreeNode *c0, *c1, *temp;
    c0 = syntree->child[0]; //lhs
    c1 = syntree->child[1]; //rhs

    switch(syntree->kind.exp) {
        case OpK: 
            debugPrintf("OpK");
            // no break on purpose 

        case AssignK:
            debugPrintf("AssignK");
            treeTraverse(c0, symtab);
            treeTraverse(c1, symtab);
            if(syntree->attr.op == int('=')) {
                if(c0->isArray && c1->isArray) {
                    syntree->isArray = true;
                }
            }
            if(syntree->attr.op == int('+') || syntree->attr.op == int('[') || syntree->attr.op == int('=')) {
                syntree->type = c0->type; 
            }
            else if(syntree->attr.op == AND || syntree->attr.op == OR ||
                    syntree->attr.op == GEQ || syntree->attr.op == LEQ ||
                    syntree->attr.op == int('<') || syntree->attr.op == int('>') ||
                    syntree->attr.op == EQ || syntree->attr.op == NEQ ||
                    syntree->attr.op == NOT) {   
                syntree->type = ExpType::Boolean;
            }
            else {
                syntree->type = ExpType::Integer; 
            }

            // covers all error handling for unary, mul, assign, and sum ops in first half. 2nd half covers 
            switch(syntree->attr.op) {

                // // // // // FIRST HALF
                case '/':
                    if(c0->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '/' requires operands of type int but lhs is of %s.\n", syntree->lineno, expTypeToStr(c0->type));
                        numErrors++;
                    }
                    if(c1->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '/' requires operands of type int but rhs is of %s.\n", syntree->lineno, expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == true || c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): The operation '/' does not work with arrays.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case '-':
                    if(c0->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '-' requires operands of type int but lhs is of %s.\n", syntree->lineno, expTypeToStr(c0->type));
                        numErrors++;
                    }
                    if(c1->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '-' requires operands of type int but rhs is of %s.\n", syntree->lineno, expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == true || c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): The operation '-' does not work with arrays.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case '+':
                    if(c0->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '+' requires operands of type int but lhs is of %s.\n", syntree->lineno, expTypeToStr(c0->type));
                        numErrors++;
                    }
                    if(c1->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '+' requires operands of type int but rhs is of %s.\n", syntree->lineno, expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == true || c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): The operation '+' does not work with arrays.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case '%':
                    if(c0->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '%%' requires operands of type int but lhs is of %s.\n", syntree->lineno, expTypeToStr(c0->type));
                        numErrors++;
                    }
                    if(c1->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '%%' requires operands of type int but rhs is of %s.\n", syntree->lineno, expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == true || c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): The operation '%%' does not work with arrays.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case '*':
                    if(c0->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '*' requires operands of type int but lhs is of %s.\n", syntree->lineno, expTypeToStr(c0->type));
                        numErrors++;
                    }
                    if(c1->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '*' requires operands of type int but rhs is of %s.\n", syntree->lineno, expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == true || c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): The operation '*' does not work with arrays.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case 292: // MAX :>:
                    if(c0->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): ':>:' requires operands of type int but lhs is of %s.\n", syntree->lineno, expTypeToStr(c0->type));
                        numErrors++;
                    }
                    if(c1->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): ':>:' requires operands of type int but rhs is of %s.\n", syntree->lineno, expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == true || c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): The operation ':>:' does not work with arrays.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case 293: // MIN :<:
                    if(c0->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): ':<:' requires operands of type int but lhs is of %s.\n", syntree->lineno, expTypeToStr(c0->type));
                        numErrors++;
                    }
                    if(c1->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): ':<:' requires operands of type int but rhs is of %s.\n", syntree->lineno, expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == true || c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): The operation ':<:' does not work with arrays.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case 291: // *=
                    if(c0->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '*=' requires operands of type int but lhs is of %s.\n", syntree->lineno, expTypeToStr(c0->type));
                        numErrors++;
                    }
                    if(c1->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '*=' requires operands of type int but rhs is of %s.\n", syntree->lineno, expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == true || c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): The operation '*=' does not work with arrays.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case 290: // += 
                    if(c0->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '+=' requires operands of type int but lhs is of %s.\n", syntree->lineno, expTypeToStr(c0->type));
                        numErrors++;
                    }
                    if(c1->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '+=' requires operands of type int but rhs is of %s.\n", syntree->lineno, expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == true || c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): The operation '+=' does not work with arrays.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case 289: // -=
                    if(c0->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '-=' requires operands of type int but lhs is of %s.\n", syntree->lineno, expTypeToStr(c0->type));
                        numErrors++;
                    }
                    if(c1->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '-=' requires operands of type int but rhs is of %s.\n", syntree->lineno, expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == true || c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): The operation '-=' does not work with arrays.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case 288: // /=
                    if(c0->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '/=' requires operands of type int but lhs is of %s.\n", syntree->lineno, expTypeToStr(c0->type));
                        numErrors++;
                    }
                    if(c1->type != ExpType::Integer) {
                        printf("SEMANTIC ERROR(%d): '/=' requires operands of type int but rhs is of %s.\n", syntree->lineno, expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == true || c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): The operation '/=' does not work with arrays.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                // // // // // // SECOND HALF 
                case '<': 
                    if(c0->type != c1->type) {
                        printf("SEMANTIC ERROR(%d): '<' requires operands of the same type but lhs is %s and rhs is %s.\n", syntree->lineno, expTypeToStr(c0->type), expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == false && c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): '<' requires both operands be arrays or not but lhs is not an array and rhs is an array.\n", syntree->lineno);
                        numErrors++;
                    }
                    if(c0->isArray == true && c1->isArray == false) {
                        printf("SEMANTIC ERROR(%d): '<' requires both operands be arrays or not but lhs is an array and rhs is not an array.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;
                
                case '>': 
                    if(c0->type != c1->type) {
                        printf("SEMANTIC ERROR(%d): '>' requires operands of the same type but lhs is %s and rhs is %s.\n", syntree->lineno, expTypeToStr(c0->type), expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == false && c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): '>' requires both operands be arrays or not but lhs is not an array and rhs is an array.\n", syntree->lineno);
                        numErrors++;
                    }
                    if(c0->isArray == true && c1->isArray == false) {
                        printf("SEMANTIC ERROR(%d): '>' requires both operands be arrays or not but lhs is an array and rhs is not an array.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case '=': 
                if((c0->type != c1->type) && (c0->type != Void)) {
                        printf("SEMANTIC ERROR(%d): '=' requires operands of the same type but lhs is %s and rhs is %s.\n", syntree->lineno, expTypeToStr(c0->type), expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == false && c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): '=' requires both operands be arrays or not but lhs is not an array and rhs is an array.\n", syntree->lineno);
                        numErrors++;
                    }
                    if(c0->isArray == true && c1->isArray == false) {
                        printf("SEMANTIC ERROR(%d): '=' requires both operands be arrays or not but lhs is an array and rhs is not an array.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case 285: // !=
                    if(c0->type != c1->type) {
                        printf("SEMANTIC ERROR(%d): '!=' requires operands of the same type but lhs is %s and rhs is %s.\n", syntree->lineno, expTypeToStr(c0->type), expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == false && c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): '!=' requires both operands be arrays or not but lhs is not an array and rhs is an array.\n", syntree->lineno);
                        numErrors++;
                    }
                    if(c0->isArray == true && c1->isArray == false) {
                        printf("SEMANTIC ERROR(%d): '!=' requires both operands be arrays or not but lhs is an array and rhs is not an array.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case 284: // <= 
                    if(c0->type != c1->type) {
                        printf("SEMANTIC ERROR(%d): '<=' requires operands of the same type but lhs is %s and rhs is %s.\n", syntree->lineno, expTypeToStr(c0->type), expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == false && c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): '<=' requires both operands be arrays or not but lhs is not an array and rhs is an array.\n", syntree->lineno);
                        numErrors++;
                    }
                    if(c0->isArray == true && c1->isArray == false) {
                        printf("SEMANTIC ERROR(%d): '<=' requires both operands be arrays or not but lhs is an array and rhs is not an array.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case 283: // >=
                    if(c0->type != c1->type) {
                        printf("SEMANTIC ERROR(%d): '>=' requires operands of the same type but lhs is %s and rhs is %s.\n", syntree->lineno, expTypeToStr(c0->type), expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == false && c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): '>=' requires both operands be arrays or not but lhs is not an array and rhs is an array.\n", syntree->lineno);
                        numErrors++;
                    }
                    if(c0->isArray == true && c1->isArray == false) {
                        printf("SEMANTIC ERROR(%d): '>=' requires both operands be arrays or not but lhs is an array and rhs is not an array.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case 282: // ==
                    if(c0->type != c1->type) {
                        printf("SEMANTIC ERROR(%d): '==' requires operands of the same type but lhs is %s and rhs is %s.\n", syntree->lineno, expTypeToStr(c0->type), expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == false && c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): '==' requires both operands be arrays or not but lhs is not an array and rhs is an array.\n", syntree->lineno);
                        numErrors++;
                    }
                    if(c0->isArray == true && c1->isArray == false) {
                        printf("SEMANTIC ERROR(%d): '==' requires both operands be arrays or not but lhs is an array and rhs is not an array.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case 280: // not
                    if(c0->type != ExpType::Boolean) {
                        printf("SEMANTIC ERROR(%d): 'not' requires operands of type bool but lhs is of %s.\n", syntree->lineno, expTypeToStr(c0->type));
                        numErrors++;
                    }
                    if(c1->type != ExpType::Boolean) {
                        printf("SEMANTIC ERROR(%d): 'not' requires operands of type bool but rhs is of %s.\n", syntree->lineno, expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == true || c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): The operation 'not' does not work with arrays.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case 278: // and 
                    if(c0->type != ExpType::Boolean) {
                        printf("SEMANTIC ERROR(%d): 'and' requires operands of type bool but lhs is of %s.\n", syntree->lineno, expTypeToStr(c0->type));
                        numErrors++;
                    }
                    if(c1->type != ExpType::Boolean) {
                        printf("SEMANTIC ERROR(%d): 'and' requires operands of type bool but rhs is of %s.\n", syntree->lineno, expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == true || c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): The operation 'and' does not work with arrays.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;

                case 273: // or
                    if(c0->type != ExpType::Boolean) {
                        printf("SEMANTIC ERROR(%d): 'or' requires operands of type bool but lhs is of %s.\n", syntree->lineno, expTypeToStr(c0->type));
                        numErrors++;
                    }
                    if(c1->type != ExpType::Boolean) {
                        printf("SEMANTIC ERROR(%d): 'or' requires operands of type bool but rhs is of %s.\n", syntree->lineno, expTypeToStr(c1->type));
                        numErrors++;
                    }
                    if(c0->isArray == true || c1->isArray == true) {
                        printf("SEMANTIC ERROR(%d): The operation 'or' does not work with arrays.\n", syntree->lineno);
                        numErrors++;
                    }
                    break;
                /*
                case 270: // chsign
                    if(c1->isArray == false) {
                        printf("SEMANTIC ERROR(%d): The operation 'chsign' only works with arrays.\n", syntree->lineno);
                    }
                    break;

                case 269: //sizeof
                    if(c1->isArray == false) {
                        printf("SEMANTIC ERROR(%d): The operation 'sizeof' only works with arrays.\n", syntree->lineno);
                    }
                    break;
                    */
                /////// idents
                case ':':
                    TreeNode *temp;
                    temp = c0->child[0];
                    if(temp->type != c1->type) {
                        printf("success\n");
                    }
            }
            break;

        case CallK:
            debugPrintf("CallK");
            treeTraverse(c0, symtab);
            if((temp = (TreeNode *)(symtab->lookup(syntree->attr.name)))) {
                temp->isUsed = true; 
                syntree->type = temp->type;
                syntree->size = temp->size;
                syntree->isArray = temp->isArray;
            }
            else { 
                /// looks like an error condition
                //printf("ERROR(): CallK not in symtab lookup table.\n"); 
                if(symtab->lookup(syntree->attr.name) == NULL) {
                    printf("SEMANTIC ERROR(%d): Symbol \'%s\' is not declared.\n", syntree->lineno, syntree->attr.name);
                    numErrors++;
                }
                if(symtab->lookup(syntree->attr.name)) {
                    if(syntree->isUsed == false) {
                        printf("SEMANTIC WARNING(%d): The function '%s' seems not to be used.\n", syntree->lineno, syntree->attr.name);
                        numWarnings++;
                    }
                }

            }
            break;

        case ConstantK:
            debugPrintf("ConstantK");
            syntree->isConst = true;
            if(syntree->type == Char && syntree->isArray) { // Deal with strings
                syntree->varKind = Global;
                syntree->offset = goffset - 1; //- 1;
                syntree->size--; // changed from - 2
                goffset -= syntree->size;
            }
            break;

        case IdK: {
            debugPrintf("IdK");
            if((temp = (TreeNode*) (symtab->lookup(syntree->attr.name)))) {
                temp->isUsed = true;
                syntree->type = temp->type;
                syntree->isStatic= temp->isStatic;
                syntree->isArray = temp->isArray;
                syntree->size = temp->size;
                syntree->varKind = temp->varKind;
                syntree->offset= temp->offset;
            }
            if(syntree->isArray && syntree->varKind != Parameter && syntree->type != Integer && syntree->type != Boolean) {
                syntree->offset--;
            }
            if(syntree->isArray && syntree->type == Char) {
                syntree->offset++;
            }
            if(syntree->isArray && syntree->varKind == Parameter && syntree->type == Char) {
                syntree->offset--;
            }
            else {
                if(symtab->lookup(syntree->attr.name) == NULL) {
                    printf("SEMANTIC ERROR(%d): Symbol \'%s\' is not declared.\n", syntree->lineno, syntree->attr.name);
                    numErrors++;
                }
                if(symtab->lookup(syntree->attr.name)) {
                    temp = (TreeNode*) (symtab->lookup(syntree->attr.name));
                    if(temp->kind.decl == FuncK) {
                        printf("SEMANTIC ERROR(%d): Cannot use function \'%s\' as a variable.\n", syntree->lineno, temp->attr.name);
                        numErrors++;
                    }
                }
            }
            break;
        }
    }
}

 void treeTraverseStmt(TreeNode *syntree, SymbolTable *symtab) {
    debugPrintf("treeTraverseDecl");
    TreeNode *c0, *c1, *c2, *temp;
    c0 = syntree->child[0];
    c1 = syntree->child[1];
    c2 = syntree->child[2];

    switch(syntree->kind.stmt) {
        case CompoundK: {
            debugPrintf("CompoundK");
            int previous_foffset = foffset; // Remember the current Offset
            symtab->enter((char *)"compoundStmt"); 
            treeTraverse(c0, symtab); // Traverse child[0]’s tree
            syntree->size = foffset;
            treeTraverse(c1, symtab); // Traverse child[1]’s tree
            foffset = previous_foffset; // Remember the current Offset
            symtab->leave();
            break;
        }
        case ReturnK:
            debugPrintf("ReturnK");
            // need to figure out how to check function type and see if it matches 
            // make a function to walk through and look for funcK and record its type or name so you can look it up in the returnK
            treeTraverse(c0, symtab);
            treeTraverse(c1, symtab);
            break;

        case IfK:
            debugPrintf("IfK");
            //c0 is the condition block, and needs to be of type BOOLEAN 
            if(c0->type != Boolean) {
                printf("SEMANTIC ERROR(%d): Expecting Boolean test condition in if statement but got %s.\n", c0->lineno, expTypeToStr(c0->type));
                numErrors++;
            }
            if(c0->isArray) {
                printf("SEMANTIC ERROR(%d): Cannot use array as test condition in if statement.\n", c0->lineno);
                numErrors++;
            }
            treeTraverse(c0, symtab); // Condition
            syntree->size = goffset;
            treeTraverse(c1, symtab); // If block
            treeTraverse(c2, symtab); // Else block
            break;

        case WhileK:
            debugPrintf("WhileK");
            //c0 is the condition block, and needs to be of type BOOLEAN 
            if(c0->type != Boolean) {
                printf("SEMANTIC ERROR(%d): Expecting Boolean test condition in while statement but got %s.\n", c0->lineno, expTypeToStr(c0->type));
                numErrors++;
            }
            if(c0->isArray) {
                printf("SEMANTIC ERROR(%d): Cannot use array as test condition in while statement.\n", c0->lineno);
                numErrors++;
            }
            treeTraverse(c0, symtab); // Condition
            syntree->size = foffset;
            treeTraverse(c1, symtab); // do
            treeTraverse(c2, symtab); // while 
            break;
        
        case ForK: {
            debugPrintf("ForK");
            int previous_foffset = foffset;
            symtab->enter((char *)"ForStmt");
            treeTraverse(c0, symtab); // conditional
            foffset -= 2;
            syntree->size = foffset;
            treeTraverse(c1, symtab); // for 
            treeTraverse(c2, symtab); // iteration? i think 
            foffset = previous_foffset;
            symtab->leave();
            break;
        }
        case RangeK:
            debugPrintf("RangeK");
            treeTraverse(c0, symtab); // Condition
            syntree->size = foffset;
            treeTraverse(c1, symtab);
            treeTraverse(c2, symtab); // Else block
            break;

        case BreakK:
            debugPrintf("BreakK");
            if(symtab->depth() <= 3) {
                printf("SEMANTIC ERROR(%d): Cannot have a break statement outside of loop.\n", syntree->lineno);
                numErrors++;
            }
            break;
    }


    
}