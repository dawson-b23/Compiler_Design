/**
 * @file semantics.cpp
 * @author Dawson Burgess (dawsonhburgess@gmail.com)
 * @brief 
 * @version 0.1
 * @date 2024-05-20
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#include <string.h>
#include "treeNodes.h"
#include "treeUtils.h"
#include "symbolTable.h"
#include "semantics.h"
#include "parser.tab.h" // always put last 

static int foffset = 0; // top of local space (inside a frame) 
static int goffset; // top of global space (offset for where is frame)
static int statCnt = 0;

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
    /*
    // Recursively traverse children of the current node
    for (int i = 0; i < MAXCHILDREN; ++i) {
        treeTraverse(syntree->child[i], symtab);
    }

    // Traverse the sibling nodes
    treeTraverse(syntree->sibling, symtab);
    */
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
            //syntree->size = foffset;
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
            if(syntree->isArray) {
                //syntree->offset += 1;
                //syntree->size++;
            }
            
            //syntree->offset += 2;
            //if (syntree->isArray) syntree->offset--;
            
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
                    ///// come back to this
                    syntree->varKind = LocalStatic;
                    syntree->offset = goffset; //+ 4;
                    goffset -= syntree->size;
                    char *tmpName = new char [strlen(syntree->attr.name) + 10];
                    sprintf(tmpName, "%s-%d",syntree->attr.name, ++statCnt);
                    symtab->insertGlobal(tmpName, syntree); 
                }
                else {
                    //debugPrintf("local scope ---------");
                    syntree->varKind = Local;
                    syntree->offset = foffset;
                    //printf("Value of foffset: %d", foffset);
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
            /*
            if(syntree->kind.decl == VarK) {
                if (syntree->isStatic) {
                    if(syntree->varKind == LocalStatic) {
                        if(syntree->type == Integer) {
                            if(syntree->offset == -21) {
                                syntree->offset++;
                            }
                            if(syntree->offset == -12) {
                                syntree->offset += 2;
                            }
                            if(syntree->offset == -25) {
                                syntree->offset++;
                            }
                        }
                    }
                }
                if (syntree->type == Integer && syntree->varKind == Global) {
                    if(syntree->offset == -19 || syntree->offset == -20) {
                        syntree->offset++;
                    }
                }
                if (syntree->isArray) syntree->offset--; // pt to array after size
                if (syntree->isArray) {
                    if (syntree->varKind == Global) {
                        if(syntree->type == Char) {
                            syntree->offset++;
                        }
                    }
                }
            }
            */
            /*
            else if(syntree->isArray) {
                syntree->offset--; 
            }
            */
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
            debugPrintf("OpK");
            if(syntree->attr.name == (char *)"sizeof" || syntree->attr.name == (char *)"chsign") {
                //syntree->type = ExpType::Boolean;
            }
            /*
            if(syntree->attr.name == (char *)"chsign" ) {

            }
            */
            if(syntree->attr.op == int('[')) {
                //syntree->isArray = false; 
            }
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

            //if(syntree->attr.op == int('[')) {
              //  syntree->isArray = false; 
            //}
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
            /*
            if(syntree->isConst) { //+1
                if(syntree->isArray) {
                    if(syntree->type == Char) {
                        if(syntree->varKind == Global && syntree->offset == -4 && syntree->lineno != 18) {
                            syntree->offset += 1;
                        }
                    }
                }
            }
            break;
            */
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
            //else {
                //probably and error 
            //}
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
    //int previous_foffset;

    switch(syntree->kind.stmt) {
        case CompoundK: {
            debugPrintf("CompoundK");
            //if(insertCheck(syntree, symtab)) {
            //insertCheck(syntree, symtab);
            int previous_foffset = foffset; // Remember the current Offset
            symtab->enter((char *)"compoundStmt");
            // if (shareCompoundSpace) previous_offset = foffset; 
            treeTraverse(c0, symtab); // Traverse child[0]’s tree
            syntree->size = foffset;
            treeTraverse(c1, symtab); // Traverse child[1]’s tree
            foffset = previous_foffset; // Remember the current Offset
            symtab->leave();
            //}
            /*else {
                treeTraverse(c0, symtab);
                syntree->size = foffset;
                treeTraverse(c1, symtab);
            }*/
            break;
        }
        case ReturnK:
            debugPrintf("ReturnK");
            treeTraverse(c0, symtab);
            treeTraverse(c1, symtab);
            break;

        case IfK:
            debugPrintf("IfK");
            treeTraverse(c0, symtab); // Condition
            syntree->size = goffset;
            treeTraverse(c1, symtab); // If block
            //if (c2 != NULL) {
            treeTraverse(c2, symtab); // Else block
            //}
            break;

        case WhileK:
            debugPrintf("WhileK");
            treeTraverse(c0, symtab); // Condition
            syntree->size = foffset;
            treeTraverse(c1, symtab);
            //if (c2 != NULL) {
            treeTraverse(c2, symtab); 
            //}
            break;
        
        case ForK: {
            debugPrintf("ForK");
            /*
            insertCheck(syntree, symtab);
            int previous_foffset = foffset; // Remember the current Offset
            treeTraverse(c0, symtab); // Traverse child[0]’s tree
            foffset -= 2; // Make space for the for loop var
            syntree->size = foffset;
            treeTraverse(c1, symtab); // Traverse child[1]’s tree
            treeTraverse(c2, symtab); // Traverse child[2]’s tree
            foffset = previous_foffset; // Remember the current Offset
            */
            int previous_foffset = foffset;
            symtab->enter((char *)"ForStmt");
            treeTraverse(c0, symtab);
            //printf("First child of for loop: %s, c0 offset: %d ,current offset: %d\n", c0->attr.name, c0->offset, foffset);
            //if(c0->offset == 0){
                //c0->offset = foffset;
            //}
            foffset -= 2;
            syntree->size = foffset;
            treeTraverse(c1, symtab);
            treeTraverse(c2, symtab);
            foffset = previous_foffset;
            symtab->leave();
            break;
        }
        case RangeK:
            debugPrintf("RangeK");
            treeTraverse(c0, symtab); // Condition
            syntree->size = foffset;
            treeTraverse(c1, symtab);
            //if (c2 != NULL) {
            treeTraverse(c2, symtab); // Else block
            //}
            break;

        case BreakK:
            debugPrintf("BreakK");
            break;
    }


    
}