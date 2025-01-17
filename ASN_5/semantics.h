/**
 * @file semantics.h
 * @author Dawson Burgess (dawsonhburgess@gmail.com)
 * @brief 
 * @version 0.1
 * @date 2024-05-20
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#ifndef _SEMANTICS_H_
#define _SEMANTICS_H_

#include <string.h>
#include "treeNodes.h"
#include "treeUtils.h"
#include "symbolTable.h"

TreeNode *semanticAnalysis(TreeNode *syntree,          // pass in and return an annotated syntax tree
                           bool shareCompoundSpaceIn,   // SPECIAL OPTION: make compound after a function share scope
                           bool noDuplicateUndefsIn,    // SPECIAL OPTION: no duplicate undefines
                           SymbolTable *symtabX,       // pass in and return the symbol table
                           int &globalOffset            // return the offset past the globals
    );

void treeTraverse(TreeNode *syntree, SymbolTable *symtab);
TreeNode *loadIOLib(TreeNode *syntree);
void debugPrintf(const char *input);
bool insertCheck(TreeNode *syntree, SymbolTable *symtab);
void treeTraverseDecl(TreeNode *syntree, SymbolTable *symtab);
void treeTraverseExp(TreeNode *syntree, SymbolTable *symtab);
void treeTraverseStmt(TreeNode *syntree, SymbolTable *symtab);

#endif