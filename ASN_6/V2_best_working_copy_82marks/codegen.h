#ifndef CODEGEN_H
#define CODEGEN_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "treeNodes.h"
#include "treeUtils.h"
#include "symbolTable.h"
#include "emitcode.h"

// MAIN FUNCTION 
void codegen(FILE *codeIn,          // where the code should be written
            char *srcFile,         // name of file compiled
            TreeNode *syntaxTree,  // tree to process
            SymbolTable *globalsIn,     // globals so function info can be found
            int globalOffset,      // size of the global frame
            bool linenumFlagIn);   // comment with line numbers

// HELPER FUNCTIONS
void debugPrint(const char *input);
void codegenHeader(char *srcFile);
void commentLineNum(TreeNode *currnode);
void initGlobalArraySizes();
void initAGlobalSymbol(std::string sym, void *ptr);
int offsetRegister(VarKind v);

// INIT AND GENERAL
void codegenInit(int initJump, int globalOffset);
void codegenGeneral(TreeNode *currnode);

// FUNCTION PROCESSING
void codegenLibraryFun(TreeNode *currnode);
void codegenFun(TreeNode *currnode);

// BIG 3 METHODS 
void codegenDecl(TreeNode *currnode);
void codegenStatement(TreeNode *currnode);
void codegenExpression(TreeNode *currnode);

#endif
