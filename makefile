#plik makefile

.PHONY: clear
.SUFFIXES: .o .c .h

CC = gcc
RM = rm -f
CFLAGS = -c
PROGS = code2.o libfunc.so
DELETE = code2 code2.o square.o cube.o libfunc.so square.h.gch cube.h.gch
SCIEZKA = /home/student/make

.c.o:
	$(CC) -fPIC $(CFLAGS) $<

.o:
	$(CC) $(CFLAGS) $^

code2: $(PROGS)
	$(CC) -o $@ $^ -Wl,-rpath=$(SCIEZKA)

code2.o: code2.c square.h cube.h
square.o: square.c
cube.o: cube.c

libfunc.so: cube.o square.o
	$(CC) -shared -o $@ $^

clear:
	$(RM) $(DELETE)
