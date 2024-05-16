#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "treeNodes.h"
#include "treeUtils.h"
#include "symbolTable.h"
#include "emitcode.h"
#include "codegen.h"
#include "semantics.h"
#include "parser.tab.h" // always put last 

extern int numErrors;
extern int numWarnings;
extern int yyparse();
extern int yydebug;
extern TreeNode *syntaxTree;
extern char **largerTokens;
extern void initTokenStrings();

// these offsets never change 
#define OFPOFF 0
#define RETURNOFFSET -1

int toffset; // next available temporary space

FILE *code; // shared global code
static bool linenumFlag; // mark with line numbers
static int breakloc; // which while to break to
static SymbolTable *globals; // the global symbol table

// ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** 
// START

//// FUNCTION BEING CALLED IN MAIN (PARSER.Y) / MAIN OPERATION 

// this is the top level code generator call
void codegen(FILE *codeIn, // where the code should be written
            char *srcFile, // name of file compiled
            TreeNode *syntaxTree, // tree to process
            SymbolTable *globalsIn, // globals so function info can be found
            int globalOffset,
            bool linenumFlagIn) {

    int initJump;
    code = codeIn;
    globals = globalsIn;
    linenumFlag = linenumFlagIn;
    breakloc = 0;

    initJump = emitSkip(1); // save a place for the jump to init
    codegenHeader(srcFile); // nice comments describing what is compiled
    codegenGeneral(syntaxTree); // general code generation including I/O library
    codegenInit(initJump, globalOffset); // generation of initialization for run
}

// END 
// ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** 



// ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** 
// START

//// HELPER METHODS FOR CODEGEN

// Generate a header for our code
void codegenHeader(char *srcFile) {
    emitComment((char *)"bC compiler version bC-Su23");
    emitComment((char *)"File compiled: ", srcFile);
}

void commentLineNum(TreeNode *currnode) {
    char buf[16];
    if (linenumFlag) {
        sprintf(buf, "%d", currnode->lineno);
        emitComment((char *)"Line: ", buf);
    }
}

void initGlobalArraySizes() {
    emitComment((char *)"INIT GLOBALS AND STATICS");
    globals->applyToAllGlobal(initAGlobalSymbol);
    emitComment((char *)"END INIT GLOBALS AND STATICS");
}

void initAGlobalSymbol(std::string sym, void *ptr) {
    TreeNode *currnode;

    // printf("Symbol: %s\n", sym.c_str()); // dump the symbol table
    currnode = (TreeNode *)ptr;
    // printf("lineno: %d\n", currnode->lineno); // dump the symbol table
    
    if (currnode->lineno != -1) {
        if (currnode->isArray) {
            emitRM((char *)"LDC", AC, currnode->size-1, 6, (char *)"load size of array", currnode->attr.name);
            emitRM((char *)"ST", AC, currnode->offset+1, GP, (char *)"save size of array", currnode->attr.name);
        }
        if (currnode->kind.decl==VarK && (currnode->varKind == Global || currnode->varKind == LocalStatic)) {
            if (currnode->child[0]) { 
                // compute rhs -> AC;
                codegenExpression(currnode->child[0]);
            
                // save it
                emitRM((char *)"ST", AC, currnode->offset, GP,
                (char *)"Store variable", currnode->attr.name);
            }
        }
    }
}

int offsetRegister(VarKind v) {
    switch (v) {
        case Local: 
            return FP;
    
        case Parameter: 
            return FP;
    
        case Global: 
            return GP;
    
        case LocalStatic: 
            return GP;
   
    default:
        printf((char *)"ERROR(codegen): looking up offset register for a variable of type %d\n", v);
        return 666;
    }
}

// END 
// ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** 



// ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** 
// START

//// INIT AND GENERAL

// Generate init code ...
void codegenInit(int initJump, int globalOffset) {
    backPatchAJumpToHere(initJump, (char *)"Jump to init [backpatch]");

    emitComment((char *)"INIT"); 
    //OLD pre 4.6 TM emitRM((char *)"LD", GP, 0, 0, (char *)"Set the global pointer");
    emitRM((char *)"LDA", FP, globalOffset, GP, (char *)"set first frame at end of globals");
    emitRM((char *)"ST", FP, 0, FP, (char *)"store old fp (point to self)");

    initGlobalArraySizes();

    emitRM((char *)"LDA", AC, 1, PC, (char *)"Return address in ac");
    { // jump to main
        TreeNode *funcNode;
        funcNode = (TreeNode *)(globals->lookup((char *)"main"));
        if (funcNode) { 
            emitGotoAbs(funcNode->offset, (char *)"Jump to main");
        } 
        else { 
            printf((char *)"ERROR(LINKER): Procedure main is not defined.\n");
            numErrors++;
        }
    }

    emitRO((char *)"HALT", 0, 0, 0, (char *)"DONE!");
    emitComment((char *)"END INIT");
}

void codegenGeneral(TreeNode *currnode) { 
    while (currnode) {
        switch (currnode->nodekind) {
            case StmtK:
                codegenStatement(currnode);
                break;
            case ExpK:
                emitComment((char *)"EXPRESSION"); codegenExpression(currnode);
                break;
            case DeclK:
                codegenDecl(currnode);
                break;
        }
        currnode = currnode->sibling;
    }
}

// END 
// ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** 



// ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** 
// START

//// FUNCTION PROCESSING

void codegenLibraryFun(TreeNode *currnode) {
    emitComment((char *)"");
    emitComment((char *)"** ** ** ** ** ** ** ** ** ** ** **");
    emitComment((char *)"FUNCTION", currnode->attr.name);

    // remember where this function is
    currnode->offset = emitSkip(0);

    // Store return address
    emitRM((char *)"ST", AC, RETURNOFFSET, FP, (char *)"Store return address");

    // Next slides here
    if (strcmp(currnode->attr.name, (char *)"input")==0) {
        emitRO((char *)"IN", RT, RT, RT, (char *)"Grab int input");
    } 
    else if (strcmp(currnode->attr.name, (char *)"inputb")==0) {
        emitRO((char *)"INB", RT, RT, RT, (char *)"Grab bool input");
    } 
    else if (strcmp(currnode->attr.name, (char *)"inputc")==0) {
        emitRO((char *)"INC", RT, RT, RT, (char *)"Grab char input");
    } 
    else if (strcmp(currnode->attr.name, (char *)"output")==0) {
        emitRM((char *)"LD", AC, -2, FP, (char *)"Load parameter");
        emitRO((char *)"OUT", AC, AC, AC, (char *)"Output integer");
    } 
    else if (strcmp(currnode->attr.name, (char *)"outputb")==0) {
        emitRM((char *)"LD", AC, -2, FP, (char *)"Load parameter");
        emitRO((char *)"OUTB", AC, AC, AC, (char *)"Output bool");
    } 
    else if (strcmp(currnode->attr.name, (char *)"outputc")==0) {
        emitRM((char *)"LD", AC, -2, FP, (char *)"Load parameter");
        emitRO((char *)"OUTC", AC, AC, AC, (char *)"Output char");
    } 
    else if (strcmp(currnode->attr.name, (char *)"outnl")==0) {
        emitRO((char *)"OUTNL", AC, AC, AC, (char *)"Output a newline");
    } 
    else {
        emitComment((char *)"ERROR(LINKER): No support for special function");
        emitComment(currnode->attr.name);
    }

    emitRM((char *)"LD", AC, RETURNOFFSET, FP, (char *)"Load return address");
    emitRM((char *)"LD", FP, OFPOFF, FP, (char *)"Adjust fp");
    emitGoto(0, AC, (char *)"Return");

    emitComment((char *)"END FUNCTION", currnode->attr.name);
}

// process functions
void codegenFun(TreeNode *currnode) {
    emitComment((char *)"");
    emitComment((char *)"** ** ** ** ** ** ** ** ** ** ** **");
    emitComment((char *)"FUNCTION", currnode->attr.name);
    toffset = currnode->size; // recover the end of activation record
    emitComment((char *)"TOFF set:", toffset);

    // function in the code space! This is accessible via the symbol table. // remember where this function is:
    currnode->offset = emitSkip(0); // offset holds the instruction address!!

    // Store return address
    emitRM((char *)"ST", AC, RETURNOFFSET, FP, (char *)"Store return address");

    // Generate code for the statements...
    codegenGeneral(currnode->child[1]);

    // In case there was no return statement 
    // set return register to 0 and return
    emitComment((char *)"Add standard closing in case there is no return statement");
    emitRM((char *)"LDC", RT, 0, 6, (char *)"Set return value to 0");
    emitRM((char *)"LD", AC, RETURNOFFSET, FP, (char *)"Load return address");
    emitRM((char *)"LD", FP, OFPOFF, FP, (char *)"Adjust fp");
    emitGoto(0, AC, (char *)"Return");

    emitComment((char *)"END FUNCTION", currnode->attr.name);
}

// END 
// ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** 



// ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** 
// START

//// BIG 3 METHODS 


void codegenDecl(TreeNode *currnode) {
    commentLineNum(currnode);
    switch(currnode->kind.decl) {
        case VarK:
            // You have a LOT to do here!!!!!
            if(currnode->isArray) {
                switch(currnode->varKind) {
                    case Local:
                        emitRM((char *)"LDC", AC, currnode->size-1, 6, (char *)"load size of array", currnode->attr.name);
                        emitRM((char *)"ST", AC, currnode->offset+1, offsetRegister(currnode->varKind), (char *)"save size of array", currnode->attr.name);
                        break;

                    case LocalStatic:
                        // fill this
                        break;

                    case Parameter:
                        // fill this 
                        break;

                    case Global:
                        // do nothing here 
                        break;

                    case None:
                        // Error Condition
                        break;
                } 
                // ARRAY VALUE initialization
                if(currnode->child[0]) { 
                    codegenExpression(currnode->child[0]);
                    emitRM((char *)"LDA", AC1, currnode->offset, offsetRegister(currnode->varKind), (char *)"address of lhs");
                    emitRM((char *)"LD", AC2, 1, AC, (char *)"size of rhs");
                    emitRM((char *)"LD", AC3, 1, AC1, (char *)"size of lhs");
                    emitRO((char *)"SWP", AC2, AC3, 6, (char *)"pick smallest size");
                    emitRO((char *)"MOV", AC1, AC, AC2, (char *)"array op =");
                }
            }
            else { 
                // !currnode->isArray 
                // SCALAR VALUE initialization
                if(currnode->child[0]) {
                    switch(currnode->varKind) {
                        case Local:
                            // compute rhs -> AC;
                            codegenExpression(currnode->child[0]);
        
                            // save it
                            emitRM((char *)"ST", AC, currnode->offset, FP, (char *)"Store variable", currnode->attr.name);
                            break;
                            
                        case LocalStatic:
                            break;
                        case Parameter: 
                            break;
                        case Global:
                            // do nothing here break;
                            break;
                        case None:
                            ///Error condition!!!
                            break;
                    }
                }
            }
            break;

        case FuncK:
            if (currnode->lineno == -1) { // These are the library functions we just added
                codegenLibraryFun(currnode);
            } 
            else {
                codegenFun(currnode);
            } 
            break;

        case ParamK:
            // IMPORTANT: no instructions need to be allocated for parameters here
            break;
    }
}

void codegenStatement(TreeNode *currnode) { 
    // local state to remember stuff
    int skiploc = 0, skiploc2 = 0, currloc = 0; // some temporary instuction addresses
    TreeNode *loopindex = NULL; // a pointer to the index variable declaration node
    commentLineNum(currnode);

    switch(currnode->kind.stmt) {
        /////////////////Other cases
        case IfK:
            break;

        case WhileK:
            emitComment((char *)"WHILE");
            currloc = emitSkip(0); // return to here to do the test
            codegenExpression(currnode->child[0]); // test expression
            
            emitRM((char *)"JNZ", AC, 1, PC, (char *)"Jump to while part");
            emitComment((char *)"DO");
            
            skiploc = breakloc;     // save the old break statement return point
            breakloc = emitSkip(1); // addr of instr that jumps to end of loop 
                                    // this is also the backpatch point
            
            codegenGeneral(currnode->child[1]); // do body of loop
            emitGotoAbs(currloc, (char *)"go to beginning of loop");
            backPatchAJumpToHere(breakloc, (char *)"Jump past loop [backpatch]"); // backpatch jump to end of loop

            breakloc = skiploc; // restore for break statement
            emitComment((char *)"END WHILE");

            break;

        case ForK:
            emitComment((char *)"FOR");
            currloc = emitSkip(0); // return to hear 

            
            break;

        case CompoundK: {
            int savedToffset;

            savedToffset = toffset;
            toffset = currnode->size; // recover the end of activation record
            emitComment((char *)"COMPOUND");
            emitComment((char *)"TOFF set:", toffset);
            codegenGeneral(currnode->child[0]); // process inits
            emitComment((char *)"Compound Body"); codegenGeneral(currnode->child[1]); // process body
            toffset = savedToffset;
            emitComment((char *)"TOFF set:", toffset);
            emitComment((char *)"END COMPOUND");
        }
        break;
        
        case ReturnK:
            break;

        case BreakK:
            break;
        
        case RangeK:
            break;

        default:
            break;
        }
}

void codegenExpression(TreeNode *currnode) {
    TreeNode *rhs, *lhs; 
    lhs = currnode->child[0]; 
    rhs = currnode->child[1];
    commentLineNum(currnode);
    switch(currnode->kind.exp) {
        case AssignK:
            if (rhs->attr.op == '[') {
                emitRM((char *)"LDC", AC, rhs->attr.value, 6, (char *)"Load integer constant");
                emitRM((char *)"ST", AC, toffset, FP, (char *)"Push index");
                toffset--; 
                emitComment((char *)"TOFF dec:", toffset);
                emitRM((char *)"LDC", AC, rhs->attr.value, 6, (char *)"Load integer constant");
                codegenExpression(rhs);
                toffset++; 
                emitComment((char *)"TOFF inc:", toffset);
                emitRM((char *)"LD", AC1, toffset, FP, (char *)"Pop index");
            } 
            else {
                int offReg;
                //TreeNode *rhs, *lhs; 
                //lhs = currnode->child[0]; 
                //rhs = currnode->child[1];
                offReg = offsetRegister(lhs->varKind); 
                //c0 = currnode->child[0];
                // Lots of cases that use it. Here is a sample:
                //emitRM((char *)"LDC", AC, rhs->attr.value, 6, (char *)"Load integer constant");
                if(!currnode->isArray) {
                    switch(currnode->attr.op) {
                        case ADDASS:
                            emitRM((char *)"LDC", AC, rhs->attr.value, 6, (char *)"Load integer constant");
                            emitRM((char *)"LD", AC1, lhs->offset, offReg,(char *)"load lhs variable", lhs->attr.name);
                            emitRO((char *)"ADD", AC, AC1, AC, (char *)"op +=");
                            emitRM((char *)"ST", AC, lhs->offset, offReg, (char *)"Store variable", lhs->attr.name);
                            break;
                        
                        case SUBASS:
                            emitRM((char *)"LDC", AC, rhs->attr.value, 6, (char *)"Load integer constant");
                            emitRM((char *)"LD", AC1, lhs->offset, offReg,(char *)"load lhs variable", lhs->attr.name);
                            emitRO((char *)"SUB", AC, AC1, AC, (char *)"op -=");
                            emitRM((char *)"ST", AC, lhs->offset, offReg, (char *)"Store variable", lhs->attr.name);
                            break;

                        case DIVASS:
                            emitRM((char *)"LDC", AC, rhs->attr.value, 6, (char *)"Load integer constant");
                            emitRM((char *)"LD", AC1, lhs->offset, offReg,(char *)"load lhs variable", lhs->attr.name);
                            emitRO((char *)"DIV", AC, AC1, AC, (char *)"op /=");
                            emitRM((char *)"ST", AC, lhs->offset, offReg, (char *)"Store variable", lhs->attr.name);
                            break;

                        case MULASS:
                            emitRM((char *)"LDC", AC, rhs->attr.value, 6, (char *)"Load integer constant");
                            emitRM((char *)"LD", AC1, lhs->offset, offReg,(char *)"load lhs variable", lhs->attr.name);
                            emitRO((char *)"MUL", AC, AC1, AC, (char *)"op *=");
                            emitRM((char *)"ST", AC, lhs->offset, offReg, (char *)"Store variable", lhs->attr.name);
                            break;

                        case DEC:
                            emitRM((char *)"LD", AC1, lhs->offset, offReg,(char *)"load lhs variable", lhs->attr.name);
                            //emitRO((char *)"DEC", AC, AC1, AC, (char *)"op --");
                            emitRM((char *)"ST", AC, lhs->offset, offReg, (char *)"Store variable", lhs->attr.name);
                            break;

                        case INC:
                            emitRM((char *)"LD", AC1, lhs->offset, offReg,(char *)"load lhs variable", lhs->attr.name);
                            //emitRO((char *)"INC", AC, AC1, AC, (char *)"op ++");
                            emitRM((char *)"ST", AC, lhs->offset, offReg, (char *)"Store variable", lhs->attr.name);
                            break;

                        default:
                            emitRM((char *)"LDC", AC, rhs->attr.value, 6, (char *)"Load integer constant");
                            emitRM((char *)"ST", AC, lhs->offset, offReg, (char *)"Store variable", lhs->attr.name);
                    }
                }
            }
            break;

        case CallK:
            break;

        case ConstantK:
            switch(currnode->type) {
                case Boolean:
                    if(!currnode->isArray) {
                        emitRM((char *)"LDC", AC, currnode->attr.value, 6, (char *)"Load Boolean constant");
                    }
                    break;
                
                case Integer:
                    emitRM((char *)"LDC", AC, currnode->attr.value, 6, (char *)"Load integer constant");
                    break;

                case Char:  
                    if(currnode->isArray) {
                        emitStrLit(currnode->offset, currnode->attr.string);
                        emitRM((char *)"LDA", AC, currnode->offset, 0, (char *)"Load char constant");
                    }
                    else {
                        emitRM((char *)"LDC", AC, int(currnode->attr.cvalue), 6, (char *)"Load char constant");
                    }
                    break;
                 
            }
            break;

        case IdK:
            int off;
            //TreeNode *rhs, *lhs; 
            //lhs = currnode->child[0]; 
            //rhs = currnode->child[1];
            off = offsetRegister(currnode->varKind); 
            //off = offsetRegister(currnode->varKind);
            if(currnode->isArray == false) {
                if(lhs == NULL) {
                    emitRM((char *)"LD", AC, currnode->offset, off, (char *)"Load variable", currnode->attr.name);
                }
            }

            break;

        case OpK:
            if(rhs) {
                if(lhs) {
                    emitRM((char *)"LDC", AC, lhs->attr.value, 6, (char *)"Load integer constant");
                }
                else {
                    
                }
                emitRM((char *)"ST", AC, toffset, FP, (char *)"Push left side");
                toffset--; 
                emitComment((char *)"TOFF dec:", toffset);
                codegenExpression(currnode->child[1]);
                toffset++; 
                emitComment((char *)"TOFF inc:", toffset);
                emitRM((char *)"LD", AC1, toffset, FP, (char *)"Pop left into ac1");
                if(lhs) {
                    switch(currnode->attr.op) {
                        case '+':
                            emitRO((char *)"ADD", AC, AC1, AC, (char *)"Op +");
                    }
                }
            }
            // return to this 
            if(currnode->isArray == false) {
                if(lhs == NULL) {
                    emitRM((char *)"LD", AC1, lhs->offset, FP, (char *)"Load variable", lhs->attr.name);
                }
            }
            // More code here
            break;
    }
}

// END 
// ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** 