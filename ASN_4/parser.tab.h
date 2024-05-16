/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     INT = 258,
     ID = 259,
     NUMCONST = 260,
     IF = 261,
     ELSE = 262,
     THEN = 263,
     TO = 264,
     DO = 265,
     FOR = 266,
     RETURN = 267,
     PRECOMPILER = 268,
     SIZEOF = 269,
     CHSIGN = 270,
     BOOLCONST = 271,
     STATIC = 272,
     OR = 273,
     BOOL = 274,
     BREAK = 275,
     BY = 276,
     CHAR = 277,
     AND = 278,
     CHARCONST = 279,
     NOT = 280,
     WHILE = 281,
     EQ = 282,
     GEQ = 283,
     LEQ = 284,
     NEQ = 285,
     DEC = 286,
     INC = 287,
     DIVASS = 288,
     SUBASS = 289,
     ADDASS = 290,
     MULASS = 291,
     MAX = 292,
     MIN = 293,
     STRINGCONST = 294,
     FIRSTOP = 295,
     LASTOP = 296,
     LASTTERM = 297
   };
#endif
/* Tokens.  */
#define INT 258
#define ID 259
#define NUMCONST 260
#define IF 261
#define ELSE 262
#define THEN 263
#define TO 264
#define DO 265
#define FOR 266
#define RETURN 267
#define PRECOMPILER 268
#define SIZEOF 269
#define CHSIGN 270
#define BOOLCONST 271
#define STATIC 272
#define OR 273
#define BOOL 274
#define BREAK 275
#define BY 276
#define CHAR 277
#define AND 278
#define CHARCONST 279
#define NOT 280
#define WHILE 281
#define EQ 282
#define GEQ 283
#define LEQ 284
#define NEQ 285
#define DEC 286
#define INC 287
#define DIVASS 288
#define SUBASS 289
#define ADDASS 290
#define MULASS 291
#define MAX 292
#define MIN 293
#define STRINGCONST 294
#define FIRSTOP 295
#define LASTOP 296
#define LASTTERM 297




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 60 "parser.y"
{
   TokenData *tokenData;
   TreeNode *tree;
   ExpType type; //for passing type spec up the tree
}
/* Line 1529 of yacc.c.  */
#line 139 "parser.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

