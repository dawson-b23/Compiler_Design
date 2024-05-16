#
# Makefile for TINY
# Gnu C Version
# K. Louden 2/3/98
#

CC = gcc

CFLAGS = 

OBJS = main.o util.o scan.o parse.o symtab.o analyze.o code.o cgen.o

tiny: main.o parse.o symtab.o scan.o analyze.o code.o cgen.o globals.h util.o lex.yy.o
	$(CC) $(CFLAGS) main.o util.o parse.o symtab.o analyze.o code.o cgen.o lex.yy.o -o tiny

tinyNoLex: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o tinyNoLex

main.o: main.c globals.h util.h scan.h parse.h analyze.h cgen.h
	$(CC) $(CFLAGS) -c main.c

util.o: util.c util.h globals.h
	$(CC) $(CFLAGS) -c util.c

scan.o: scan.c scan.h util.h globals.h
	$(CC) $(CFLAGS) -c scan.c

parse.o: parse.c parse.h scan.h globals.h util.h
	$(CC) $(CFLAGS) -c parse.c

symtab.o: symtab.c symtab.h
	$(CC) $(CFLAGS) -c symtab.c

analyze.o: analyze.c globals.h symtab.h analyze.h
	$(CC) $(CFLAGS) -c analyze.c

code.o: code.c code.h globals.h
	$(CC) $(CFLAGS) -c code.c

cgen.o: cgen.c globals.h symtab.h code.h cgen.h
	$(CC) $(CFLAGS) -c cgen.c

lex.yy.c: tiny.tab.c
	lex lex/tiny.l

tiny.tab.c:
	bison -t -v -d yacc/tiny.y

clean:
	-rm tiny
	-rm lex.yy.c
	-rm tiny.output
	-rm tiny.tab.c
	-rm tiny.tab.h
	-rm $(OBJS)

all: tiny
