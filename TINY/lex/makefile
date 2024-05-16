#
# Makefile for Lex
# created by qdl in 2020/10/30
#

CC = gcc

CFLAGS = -w

OBJS = main.o util.o scan.o

all: tiny

tiny: main.o util.o scan.o
	$(CC) $(CFLAGS) -o $@ main.o util.o scan.o -lfl

main.o: main.c globals.h
	$(CC) $(CFLAGS) -c main.c

util.o: util.c util.h globals.h
	$(CC) $(CFLAGS) -c util.c

scan.o: lex.yy.c scan.h util.h globals.h
	$(CC) $(CFLAGS) -c lex.yy.c -o scan.o

clean:
	-rm $(OBJS)
	-rm tiny
