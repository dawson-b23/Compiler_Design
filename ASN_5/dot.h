/**
 * @file dot.h
 * @author Dawson Burgess (dawsonhburgess@gmail.com)
 * @brief 
 * @version 0.1
 * @date 2024-05-20
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#ifndef _DOT_H_
#define _DOT_H_
#include "treeUtils.h"
#include <string.h>

void printDotTree(FILE *out, TreeNode *syntaxTree, bool showExpType, bool showAllocation);

#endif
