/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0



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




/* Copy the first part of user declarations.  */
#line 1 "parser.y"

#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <unistd.h>
#include "treeNodes.h"
#include "treeUtils.h"
#include "scanType.h"
#include "dot.h"
#include "semantics.h"
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



/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 60 "parser.y"
{
   TokenData *tokenData;
   TreeNode *tree;
   ExpType type; //for passing type spec up the tree
}
/* Line 193 of yacc.c.  */
#line 245 "parser.tab.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 258 "parser.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  4
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   236

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  61
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  49
/* YYNRULES -- Number of rules.  */
#define YYNRULES  115
/* YYNRULES -- Number of states.  */
#define YYNSTATES  176

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   297

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,    57,     2,     2,
      55,    56,    41,    42,    53,    48,     2,    54,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    52,    47,
      49,    51,    50,    58,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    45,     2,    46,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    43,     2,    44,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    59,    60
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     6,     9,    11,    12,    15,    17,    19,
      21,    25,    30,    34,    38,    40,    42,    46,    48,    53,
      55,    57,    59,    66,    72,    74,    75,    79,    81,    84,
      88,    90,    92,    96,    98,   100,   107,   112,   119,   121,
     123,   125,   127,   131,   137,   142,   149,   154,   161,   164,
     166,   171,   174,   175,   178,   179,   182,   186,   189,   193,
     196,   199,   201,   205,   207,   209,   211,   213,   215,   219,
     221,   225,   227,   230,   232,   236,   238,   240,   242,   244,
     246,   248,   250,   254,   256,   258,   260,   264,   266,   268,
     270,   274,   276,   278,   280,   282,   285,   287,   289,   291,
     293,   295,   297,   299,   304,   308,   310,   312,   317,   319,
     320,   324,   326,   328,   330,   332
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      62,     0,    -1,    63,    64,    -1,    63,    13,    -1,    13,
      -1,    -1,    64,    65,    -1,    65,    -1,    66,    -1,    72,
      -1,    71,    68,    47,    -1,    17,    71,    68,    47,    -1,
      71,    68,    47,    -1,    68,    53,    69,    -1,    69,    -1,
      70,    -1,    70,    52,    90,    -1,     4,    -1,     4,    45,
       5,    46,    -1,     3,    -1,    19,    -1,    22,    -1,    71,
       4,    55,    73,    56,    78,    -1,     4,    55,    73,    56,
      78,    -1,    74,    -1,    -1,    74,    47,    75,    -1,    75,
      -1,    71,    76,    -1,    76,    53,    77,    -1,    77,    -1,
       4,    -1,     4,    45,    46,    -1,    79,    -1,    81,    -1,
       6,    90,     8,    79,     7,    79,    -1,    26,    90,    10,
      79,    -1,    11,     4,    51,    80,    10,    79,    -1,    82,
      -1,    83,    -1,    86,    -1,    87,    -1,    90,     9,    90,
      -1,    90,     9,    90,    21,    90,    -1,     6,    90,     8,
      78,    -1,     6,    90,     8,    79,     7,    81,    -1,    26,
      90,    10,    81,    -1,    11,     4,    51,    80,    10,    81,
      -1,    88,    47,    -1,    47,    -1,    43,    84,    85,    44,
      -1,    84,    67,    -1,    -1,    85,    78,    -1,    -1,    12,
      47,    -1,    12,    88,    47,    -1,    20,    47,    -1,   104,
      89,    88,    -1,   104,    32,    -1,   104,    31,    -1,    90,
      -1,   104,    89,     1,    -1,    51,    -1,    35,    -1,    34,
      -1,    36,    -1,    33,    -1,    90,    18,    91,    -1,    91,
      -1,    91,    23,    92,    -1,    92,    -1,    25,    92,    -1,
      93,    -1,    95,    94,    95,    -1,    95,    -1,    29,    -1,
      49,    -1,    50,    -1,    28,    -1,    27,    -1,    30,    -1,
      95,    96,    97,    -1,    97,    -1,    37,    -1,    38,    -1,
      97,    98,    99,    -1,    99,    -1,    42,    -1,    48,    -1,
      99,   100,   101,    -1,   101,    -1,    41,    -1,    54,    -1,
      57,    -1,   102,   101,    -1,   103,    -1,    48,    -1,    41,
      -1,    58,    -1,   105,    -1,   104,    -1,     4,    -1,     4,
      45,    88,    46,    -1,    55,    88,    56,    -1,   106,    -1,
     109,    -1,     4,    55,   107,    56,    -1,   108,    -1,    -1,
     108,    53,    88,    -1,    88,    -1,     5,    -1,    24,    -1,
      39,    -1,    16,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,    81,    81,    84,    85,    86,    89,    90,    93,    94,
      97,   100,   101,   104,   105,   108,   109,   112,   113,   116,
     117,   118,   121,   122,   125,   126,   129,   130,   133,   136,
     137,   140,   141,   144,   145,   148,   149,   150,   151,   152,
     153,   154,   157,   158,   161,   162,   163,   164,   167,   168,
     171,   174,   175,   178,   179,   182,   183,   186,   189,   190,
     191,   192,   193,   196,   197,   198,   199,   200,   203,   204,
     207,   208,   211,   212,   215,   216,   219,   220,   221,   222,
     223,   224,   227,   228,   231,   232,   235,   236,   239,   240,
     243,   244,   247,   248,   249,   252,   253,   256,   257,   258,
     261,   262,   265,   266,   269,   270,   271,   274,   277,   278,
     281,   282,   285,   286,   287,   288
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "INT", "ID", "NUMCONST", "IF", "ELSE",
  "THEN", "TO", "DO", "FOR", "RETURN", "PRECOMPILER", "SIZEOF", "CHSIGN",
  "BOOLCONST", "STATIC", "OR", "BOOL", "BREAK", "BY", "CHAR", "AND",
  "CHARCONST", "NOT", "WHILE", "EQ", "GEQ", "LEQ", "NEQ", "DEC", "INC",
  "DIVASS", "SUBASS", "ADDASS", "MULASS", "MAX", "MIN", "STRINGCONST",
  "FIRSTOP", "'*'", "'+'", "'{'", "'}'", "'['", "']'", "';'", "'-'", "'<'",
  "'>'", "'='", "':'", "','", "'/'", "'('", "')'", "'%'", "'?'", "LASTOP",
  "LASTTERM", "$accept", "program", "precomList", "declList", "decl",
  "varDecl", "scopedVarDecl", "varDeclList", "varDeclInit", "varDeclId",
  "typeSpec", "funDecl", "parms", "parmList", "parmTypeList", "parmIdList",
  "parmId", "stmt", "matched", "iterRange", "unmatched", "expstmt",
  "compoundstmt", "localDecls", "stmtList", "returnstmt", "breakstmt",
  "exp", "assignop", "simpleExp", "andExp", "unaryRelExp", "relExp",
  "relop", "minmaxExp", "minmaxop", "sumExp", "sumop", "mulExp", "mulop",
  "unaryExp", "unaryop", "factor", "mutable", "immutable", "call", "args",
  "argList", "constant", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,    42,    43,   123,   125,    91,    93,    59,    45,    60,
      62,    61,    58,    44,    47,    40,    41,    37,    63,   296,
     297
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    61,    62,    63,    63,    63,    64,    64,    65,    65,
      66,    67,    67,    68,    68,    69,    69,    70,    70,    71,
      71,    71,    72,    72,    73,    73,    74,    74,    75,    76,
      76,    77,    77,    78,    78,    79,    79,    79,    79,    79,
      79,    79,    80,    80,    81,    81,    81,    81,    82,    82,
      83,    84,    84,    85,    85,    86,    86,    87,    88,    88,
      88,    88,    88,    89,    89,    89,    89,    89,    90,    90,
      91,    91,    92,    92,    93,    93,    94,    94,    94,    94,
      94,    94,    95,    95,    96,    96,    97,    97,    98,    98,
      99,    99,   100,   100,   100,   101,   101,   102,   102,   102,
     103,   103,   104,   104,   105,   105,   105,   106,   107,   107,
     108,   108,   109,   109,   109,   109
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     2,     1,     0,     2,     1,     1,     1,
       3,     4,     3,     3,     1,     1,     3,     1,     4,     1,
       1,     1,     6,     5,     1,     0,     3,     1,     2,     3,
       1,     1,     3,     1,     1,     6,     4,     6,     1,     1,
       1,     1,     3,     5,     4,     6,     4,     6,     2,     1,
       4,     2,     0,     2,     0,     2,     3,     2,     3,     2,
       2,     1,     3,     1,     1,     1,     1,     1,     3,     1,
       3,     1,     2,     1,     3,     1,     1,     1,     1,     1,
       1,     1,     3,     1,     1,     1,     3,     1,     1,     1,
       3,     1,     1,     1,     1,     2,     1,     1,     1,     1,
       1,     1,     1,     4,     3,     1,     1,     4,     1,     0,
       3,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       5,     4,     0,     0,     1,    19,     0,     3,    20,    21,
       2,     7,     8,     0,     9,    25,     6,    17,     0,    14,
      15,     0,     0,    24,    27,     0,    25,    10,     0,     0,
      31,    28,    30,     0,     0,     0,     0,    17,    13,   102,
     112,   115,   113,     0,   114,    98,    97,     0,    99,    16,
      69,    71,    73,    75,    83,    87,    91,     0,    96,   101,
     100,   105,   106,     0,     0,     0,     0,     0,     0,     0,
      52,    49,    23,    33,    34,    38,    39,    40,    41,     0,
      61,   101,    26,    18,     0,     0,   109,    72,     0,     0,
       0,    80,    79,    76,    81,    84,    85,    77,    78,     0,
       0,    88,    89,     0,    92,    93,    94,     0,    95,    32,
      29,     0,     0,    55,     0,    57,     0,    54,    48,    60,
      59,    67,    65,    64,    66,    63,     0,    22,     0,   111,
       0,   108,   104,    68,    70,    74,    82,    86,    90,     0,
       0,    56,     0,     0,    51,     0,     0,    62,    58,   103,
     107,     0,    44,    33,     0,     0,    36,    46,     0,     0,
      50,    53,   110,     0,     0,     0,     0,    12,    35,    45,
      37,    47,    42,    11,     0,    43
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    10,    11,    12,   144,    18,    19,    20,
      21,    14,    22,    23,    24,    31,    32,    72,    73,   154,
      74,    75,    76,   117,   146,    77,    78,    79,   126,    80,
      50,    51,    52,    99,    53,   100,    54,   103,    55,   107,
      56,    57,    58,    59,    60,    61,   130,   131,    62
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -139
static const yytype_int16 yypact[] =
{
       1,  -139,    25,    66,  -139,  -139,   -37,  -139,  -139,  -139,
     201,  -139,  -139,    41,  -139,    13,  -139,    -4,    18,  -139,
      -3,    80,    38,    53,  -139,    97,    13,  -139,   100,    62,
      60,    54,  -139,   152,    13,    67,    50,    69,  -139,    17,
    -139,  -139,  -139,    62,  -139,  -139,  -139,    62,  -139,   101,
      95,  -139,  -139,   159,    26,   -26,  -139,   178,  -139,  -139,
    -139,  -139,  -139,    76,    80,    62,   125,    34,    88,    62,
    -139,  -139,  -139,  -139,  -139,  -139,  -139,  -139,  -139,    93,
     101,    92,  -139,  -139,   152,    62,    62,  -139,    83,    62,
      62,  -139,  -139,  -139,  -139,  -139,  -139,  -139,  -139,   178,
     178,  -139,  -139,   178,  -139,  -139,  -139,   178,  -139,  -139,
    -139,    72,    96,  -139,   102,  -139,     9,   208,  -139,  -139,
    -139,  -139,  -139,  -139,  -139,  -139,     5,  -139,    98,  -139,
      99,   106,  -139,    95,  -139,    39,    26,   -26,  -139,   152,
      62,  -139,   152,    13,  -139,   100,   126,  -139,  -139,  -139,
    -139,    62,  -139,   141,   143,     4,  -139,  -139,   100,    44,
    -139,  -139,  -139,   152,   152,    62,    46,  -139,  -139,  -139,
    -139,  -139,    77,  -139,    62,   101
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -139,  -139,  -139,  -139,   144,  -139,  -139,  -138,   132,  -139,
      -2,  -139,   135,  -139,   128,  -139,   107,   -82,  -116,  -139,
    -130,  -139,  -139,  -139,  -139,  -139,  -139,   -43,  -139,   -29,
      86,   -38,  -139,  -139,    81,  -139,    79,  -139,    63,  -139,
     -46,  -139,  -139,   -30,  -139,  -139,  -139,  -139,  -139
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint8 yytable[] =
{
      49,    13,   127,    81,    88,    87,   147,   159,    13,    39,
      40,   108,   157,   165,     1,   104,     5,    81,    15,   142,
     166,    41,    89,   153,   114,     4,   156,    89,   105,    42,
      43,   106,     8,   169,   171,     9,   111,    81,    39,    40,
     116,    25,   128,   129,    44,    17,    45,   168,   170,    29,
      41,    26,   134,    46,    81,    81,    81,   152,    42,    43,
      47,   138,    85,    48,   161,    27,    39,    40,   101,     5,
       6,    28,    86,    44,   102,    45,    95,    96,    41,     7,
     139,   113,    46,   148,    30,     8,    42,    43,     9,    47,
      89,   167,    48,   173,    33,    89,    81,    28,   174,    28,
      34,    44,    35,    45,    37,    63,    84,    64,   162,    81,
      46,   155,    81,    83,    25,   145,    81,    47,    90,    89,
      48,    81,   109,   119,   120,   121,   122,   123,   124,   112,
      39,    40,    65,    81,    81,   115,   172,    66,    67,   132,
     118,   158,    41,   125,   149,   175,    68,   140,   163,   141,
      42,    43,    69,   164,    16,   150,    39,    40,    65,   151,
      38,    36,    82,    66,    67,    44,   137,    45,    41,    70,
     160,   110,    68,    71,    46,   133,    42,    43,    69,   136,
     135,    47,    39,    40,    48,     0,    91,    92,    93,    94,
       0,    44,     0,    45,    41,    70,    95,    96,     0,    71,
      46,     0,    42,     0,     5,     6,     0,    47,    97,    98,
      48,     5,     0,     0,     0,     0,     0,    44,     0,    45,
       8,     0,     0,     9,     0,   143,    46,     8,     0,     0,
       9,     0,     0,    47,     0,     0,    48
};

static const yytype_int16 yycheck[] =
{
      29,     3,    84,    33,    47,    43,     1,   145,    10,     4,
       5,    57,   142,     9,    13,    41,     3,    47,    55,    10,
     158,    16,    18,   139,    67,     0,   142,    18,    54,    24,
      25,    57,    19,   163,   164,    22,    65,    67,     4,     5,
      69,    45,    85,    86,    39,     4,    41,   163,   164,    52,
      16,    55,    90,    48,    84,    85,    86,   139,    24,    25,
      55,   107,    45,    58,   146,    47,     4,     5,    42,     3,
       4,    53,    55,    39,    48,    41,    37,    38,    16,    13,
       8,    47,    48,   126,     4,    19,    24,    25,    22,    55,
      18,    47,    58,    47,    56,    18,   126,    53,    21,    53,
      47,    39,     5,    41,     4,    45,    56,    53,   151,   139,
      48,   140,   142,    46,    45,   117,   146,    55,    23,    18,
      58,   151,    46,    31,    32,    33,    34,    35,    36,     4,
       4,     5,     6,   163,   164,    47,   165,    11,    12,    56,
      47,   143,    16,    51,    46,   174,    20,    51,     7,    47,
      24,    25,    26,    10,    10,    56,     4,     5,     6,    53,
      28,    26,    34,    11,    12,    39,   103,    41,    16,    43,
      44,    64,    20,    47,    48,    89,    24,    25,    26,   100,
      99,    55,     4,     5,    58,    -1,    27,    28,    29,    30,
      -1,    39,    -1,    41,    16,    43,    37,    38,    -1,    47,
      48,    -1,    24,    -1,     3,     4,    -1,    55,    49,    50,
      58,     3,    -1,    -1,    -1,    -1,    -1,    39,    -1,    41,
      19,    -1,    -1,    22,    -1,    17,    48,    19,    -1,    -1,
      22,    -1,    -1,    55,    -1,    -1,    58
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    13,    62,    63,     0,     3,     4,    13,    19,    22,
      64,    65,    66,    71,    72,    55,    65,     4,    68,    69,
      70,    71,    73,    74,    75,    45,    55,    47,    53,    52,
       4,    76,    77,    56,    47,     5,    73,     4,    69,     4,
       5,    16,    24,    25,    39,    41,    48,    55,    58,    90,
      91,    92,    93,    95,    97,    99,   101,   102,   103,   104,
     105,   106,   109,    45,    53,     6,    11,    12,    20,    26,
      43,    47,    78,    79,    81,    82,    83,    86,    87,    88,
      90,   104,    75,    46,    56,    45,    55,    92,    88,    18,
      23,    27,    28,    29,    30,    37,    38,    49,    50,    94,
      96,    42,    48,    98,    41,    54,    57,   100,   101,    46,
      77,    90,     4,    47,    88,    47,    90,    84,    47,    31,
      32,    33,    34,    35,    36,    51,    89,    78,    88,    88,
     107,   108,    56,    91,    92,    95,    97,    99,   101,     8,
      51,    47,    10,    17,    67,    71,    85,     1,    88,    46,
      56,    53,    78,    79,    80,    90,    79,    81,    71,    68,
      44,    78,    88,     7,    10,     9,    68,    47,    79,    81,
      79,    81,    90,    47,    21,    90
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 81 "parser.y"
    {syntaxTree = (yyvsp[(2) - (2)].tree);;}
    break;

  case 3:
#line 84 "parser.y"
    { (yyval.tree) = NULL; printf("%s\n", yylval.tokenData->tokenstr);;}
    break;

  case 4:
#line 85 "parser.y"
    { (yyval.tree) = NULL; printf("%s\n", yylval.tokenData->tokenstr);;}
    break;

  case 5:
#line 86 "parser.y"
    { (yyval.tree) = NULL;;}
    break;

  case 6:
#line 89 "parser.y"
    { (yyval.tree) = addSibling((yyvsp[(1) - (2)].tree), (yyvsp[(2) - (2)].tree));;}
    break;

  case 7:
#line 90 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 8:
#line 93 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 9:
#line 94 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 10:
#line 97 "parser.y"
    { (yyval.tree) = (yyvsp[(2) - (3)].tree); setType((yyvsp[(2) - (3)].tree), (yyvsp[(1) - (3)].type), false); yyerrok;;}
    break;

  case 11:
#line 100 "parser.y"
    { (yyval.tree) = (yyvsp[(3) - (4)].tree); setType((yyval.tree), (yyvsp[(2) - (4)].type), true); yyerrok;;}
    break;

  case 12:
#line 101 "parser.y"
    { (yyval.tree) = (yyvsp[(2) - (3)].tree); setType((yyval.tree), (yyvsp[(1) - (3)].type), false); yyerrok;;}
    break;

  case 13:
#line 104 "parser.y"
    { (yyval.tree) = ((yyvsp[(3) - (3)].tree)==NULL ? (yyvsp[(1) - (3)].tree) : addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree))); ;}
    break;

  case 14:
#line 105 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 15:
#line 108 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 16:
#line 109 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (3)].tree); (yyval.tree)->child[0] = (yyvsp[(3) - (3)].tree);;}
    break;

  case 17:
#line 112 "parser.y"
    { (yyval.tree) = newDeclNode(DeclKind::VarK, ExpType::UndefinedType, (yyvsp[(1) - (1)].tokenData)); (yyval.tree)->isArray = false; (yyval.tree)->isStatic = false; ;}
    break;

  case 18:
#line 113 "parser.y"
    { (yyval.tree) = newDeclNode(DeclKind::VarK, ExpType::UndefinedType, (yyvsp[(1) - (4)].tokenData)); (yyval.tree)->isArray = true; (yyval.tree)->isStatic = true; (yyval.tree)->size = (yyvsp[(3) - (4)].tokenData)->nvalue;;}
    break;

  case 19:
#line 116 "parser.y"
    { (yyval.type) = ExpType::Integer;;}
    break;

  case 20:
#line 117 "parser.y"
    { (yyval.type) = ExpType::Boolean;;}
    break;

  case 21:
#line 118 "parser.y"
    { (yyval.type) = ExpType::Char;;}
    break;

  case 22:
#line 121 "parser.y"
    { (yyval.tree) = newDeclNode(DeclKind::FuncK, (yyvsp[(1) - (6)].type), (yyvsp[(2) - (6)].tokenData), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree)); (yyval.tree)->isArray = false; (yyval.tree)->isStatic = false; ;}
    break;

  case 23:
#line 122 "parser.y"
    { (yyval.tree) = newDeclNode(DeclKind::FuncK, ExpType::Void, (yyvsp[(1) - (5)].tokenData), (yyvsp[(3) - (5)].tree), (yyvsp[(5) - (5)].tree)); (yyval.tree)->isArray = false; (yyval.tree)->isStatic = false; ;}
    break;

  case 24:
#line 125 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 25:
#line 126 "parser.y"
    { (yyval.tree) = NULL;;}
    break;

  case 26:
#line 129 "parser.y"
    { (yyval.tree) = ((yyvsp[(3) - (3)].tree)==NULL ? (yyvsp[(1) - (3)].tree) : addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree))); ;}
    break;

  case 27:
#line 130 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 28:
#line 133 "parser.y"
    { (yyval.tree) = (yyvsp[(2) - (2)].tree); setType((yyvsp[(2) - (2)].tree), (yyvsp[(1) - (2)].type), false); ;}
    break;

  case 29:
#line 136 "parser.y"
    { (yyval.tree) = ((yyvsp[(3) - (3)].tree)==NULL ? (yyvsp[(1) - (3)].tree) : addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree))); ;}
    break;

  case 30:
#line 137 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 31:
#line 140 "parser.y"
    { (yyval.tree) = newDeclNode(DeclKind::ParamK, ExpType::UndefinedType, (yyvsp[(1) - (1)].tokenData)); ;}
    break;

  case 32:
#line 141 "parser.y"
    { (yyval.tree) = newDeclNode(DeclKind::ParamK, ExpType::UndefinedType, (yyvsp[(1) - (3)].tokenData)); (yyval.tree)->isArray = true; ;}
    break;

  case 33:
#line 144 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 34:
#line 145 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 35:
#line 148 "parser.y"
    { (yyval.tree) = newStmtNode(StmtKind::IfK, (yyvsp[(1) - (6)].tokenData), (yyvsp[(2) - (6)].tree), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree)); ;}
    break;

  case 36:
#line 149 "parser.y"
    { (yyval.tree) = newStmtNode(StmtKind::WhileK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(4) - (4)].tree)); ;}
    break;

  case 37:
#line 150 "parser.y"
    { (yyval.tree) = newStmtNode(StmtKind::ForK, (yyvsp[(1) - (6)].tokenData), newDeclNode(DeclKind::VarK, ExpType::Integer, (yyvsp[(2) - (6)].tokenData)), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree)); ;}
    break;

  case 38:
#line 151 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 39:
#line 152 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 40:
#line 153 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 41:
#line 154 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 42:
#line 157 "parser.y"
    { (yyval.tree) = newStmtNode(StmtKind::RangeK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); ;}
    break;

  case 43:
#line 158 "parser.y"
    { (yyval.tree) = newStmtNode(StmtKind::RangeK, (yyvsp[(2) - (5)].tokenData), (yyvsp[(1) - (5)].tree), (yyvsp[(3) - (5)].tree), (yyvsp[(5) - (5)].tree)); ;}
    break;

  case 44:
#line 161 "parser.y"
    { (yyval.tree) = newStmtNode(StmtKind::IfK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(4) - (4)].tree)); ;}
    break;

  case 45:
#line 162 "parser.y"
    { (yyval.tree) = newStmtNode(StmtKind::IfK, (yyvsp[(1) - (6)].tokenData), (yyvsp[(2) - (6)].tree), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree)); ;}
    break;

  case 46:
#line 163 "parser.y"
    { (yyval.tree) = newStmtNode(StmtKind::WhileK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(4) - (4)].tree)); ;}
    break;

  case 47:
#line 164 "parser.y"
    { (yyval.tree) = newStmtNode(StmtKind::ForK, (yyvsp[(1) - (6)].tokenData), newDeclNode(DeclKind::VarK, ExpType::Integer, (yyvsp[(2) - (6)].tokenData)), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree)); ;}
    break;

  case 48:
#line 167 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (2)].tree); ;}
    break;

  case 49:
#line 168 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 50:
#line 171 "parser.y"
    { (yyval.tree) = newStmtNode(StmtKind::CompoundK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(3) - (4)].tree)); yyerrok; ;}
    break;

  case 51:
#line 174 "parser.y"
    { (yyval.tree) = ((yyvsp[(2) - (2)].tree)==NULL ? (yyvsp[(1) - (2)].tree) : addSibling((yyvsp[(1) - (2)].tree), (yyvsp[(2) - (2)].tree))); ;}
    break;

  case 52:
#line 175 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 53:
#line 178 "parser.y"
    { (yyval.tree) = ((yyvsp[(2) - (2)].tree)==NULL ? (yyvsp[(1) - (2)].tree) : addSibling((yyvsp[(1) - (2)].tree), (yyvsp[(2) - (2)].tree))); ;}
    break;

  case 54:
#line 179 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 55:
#line 182 "parser.y"
    { (yyval.tree) = newStmtNode(StmtKind::ReturnK, (yyvsp[(1) - (2)].tokenData)); ;}
    break;

  case 56:
#line 183 "parser.y"
    { (yyval.tree) = newStmtNode(StmtKind::ReturnK, (yyvsp[(1) - (3)].tokenData), (yyvsp[(2) - (3)].tree)); ;}
    break;

  case 57:
#line 186 "parser.y"
    { (yyval.tree) = newStmtNode(StmtKind::BreakK, (yyvsp[(1) - (2)].tokenData)); ;}
    break;

  case 58:
#line 189 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 59:
#line 190 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::AssignK, (yyvsp[(2) - (2)].tokenData), (yyvsp[(1) - (2)].tree)); ;}
    break;

  case 60:
#line 191 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::AssignK, (yyvsp[(2) - (2)].tokenData), (yyvsp[(1) - (2)].tree)); ;}
    break;

  case 61:
#line 192 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 62:
#line 193 "parser.y"
    { ;}
    break;

  case 63:
#line 196 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 64:
#line 197 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 65:
#line 198 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 66:
#line 199 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 67:
#line 200 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 68:
#line 203 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::OpK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); ;}
    break;

  case 69:
#line 204 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 70:
#line 207 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::OpK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); ;}
    break;

  case 71:
#line 208 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 72:
#line 211 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::OpK, (yyvsp[(1) - (2)].tokenData), (yyvsp[(2) - (2)].tree)); ;}
    break;

  case 73:
#line 212 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 74:
#line 215 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::OpK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); ;}
    break;

  case 75:
#line 216 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 76:
#line 219 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 77:
#line 220 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 78:
#line 221 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 79:
#line 222 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 80:
#line 223 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 81:
#line 224 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 82:
#line 227 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::OpK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); ;}
    break;

  case 83:
#line 228 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 84:
#line 231 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 85:
#line 232 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);;}
    break;

  case 86:
#line 235 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::OpK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); ;}
    break;

  case 87:
#line 236 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 88:
#line 239 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 89:
#line 240 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 90:
#line 243 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::OpK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); ;}
    break;

  case 91:
#line 244 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 92:
#line 247 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 93:
#line 248 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 94:
#line 249 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 95:
#line 252 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::OpK, (yyvsp[(1) - (2)].tokenData), (yyvsp[(2) - (2)].tree)); ;}
    break;

  case 96:
#line 253 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 97:
#line 256 "parser.y"
    { (yyvsp[(1) - (1)].tokenData)->tokenclass = CHSIGN; (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 98:
#line 257 "parser.y"
    { (yyvsp[(1) - (1)].tokenData)->tokenclass = SIZEOF; (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 99:
#line 258 "parser.y"
    { (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData); ;}
    break;

  case 100:
#line 261 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 101:
#line 262 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 102:
#line 265 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::IdK, (yyvsp[(1) - (1)].tokenData)); ;}
    break;

  case 103:
#line 266 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::OpK, (yyvsp[(2) - (4)].tokenData), newExpNode(ExpKind::IdK, (yyvsp[(1) - (4)].tokenData)), (yyvsp[(3) - (4)].tree)); (yyval.tree)->attr.op = (yyvsp[(2) - (4)].tokenData)->tokenclass; (yyval.tree)->isArray = true; ;}
    break;

  case 104:
#line 269 "parser.y"
    { (yyval.tree) = (yyvsp[(2) - (3)].tree); ;}
    break;

  case 105:
#line 270 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 106:
#line 271 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 107:
#line 274 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::CallK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(3) - (4)].tree));;}
    break;

  case 108:
#line 277 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 109:
#line 278 "parser.y"
    { (yyval.tree) = NULL;;}
    break;

  case 110:
#line 281 "parser.y"
    { (yyval.tree) = addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 111:
#line 282 "parser.y"
    { (yyval.tree) = (yyvsp[(1) - (1)].tree); ;}
    break;

  case 112:
#line 285 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::ConstantK, (yyvsp[(1) - (1)].tokenData)); (yyval.tree)->type = ExpType::Integer;;}
    break;

  case 113:
#line 286 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::ConstantK, (yyvsp[(1) - (1)].tokenData)); (yyval.tree)->type = ExpType::Char; (yyval.tree)->isArray = false; (yyval.tree)->size = 1; (yyval.tree)->attr.cvalue = (yyvsp[(1) - (1)].tokenData)->cvalue;;}
    break;

  case 114:
#line 287 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::ConstantK, (yyvsp[(1) - (1)].tokenData)); (yyval.tree)->type = ExpType::Char; (yyval.tree)->isArray = true; (yyval.tree)->size = strlen((yyvsp[(1) - (1)].tokenData)->tokenstr);;}
    break;

  case 115:
#line 288 "parser.y"
    { (yyval.tree) = newExpNode(ExpKind::ConstantK, (yyvsp[(1) - (1)].tokenData)); (yyval.tree)->type = ExpType::Boolean;;}
    break;


/* Line 1267 of yacc.c.  */
#line 2213 "parser.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 291 "parser.y"

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
      printTree(stdout, syntaxTree, true /* changed from false */, false);
      if(dotAST) {
         //printDotTree(stdout, syntaxTree, false, false);
      }
   }
   // this is all new 
   SymbolTable *symtab;
   symtab = new SymbolTable();
   symtab->debug(debugSymTab);
   syntaxTree = semanticAnalysis(syntaxTree,
                                 shareCompoundSpace, // true
                                 noDuplicateUndefs, // false unless u option
                                 symtab,
                                 globalOffset);
   printf("Number of warnings: %d\n", numWarnings);
   printf("Number of errors: %d\n", numErrors);
   return 0;
}


