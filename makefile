#plik makefile

.PHONY: clear
.SUFFIXES: .o .c .h

CC = gcc
RM = rm -f
CFLAGS = -c
PROGS = code2.o libfunc.so
DELETE = code2 *.o *.so
SCIEZKA = ../make

%.o: %.c
	$(CC) -fPIC $(CFLAGS) $<

%.o: 
	$(CC) $(CFLAGS) $^

%: %.o
	$(CC) -o $@ $^ -Wl,-rpath=$(SCIEZKA)

lib%.so:
	$(CC) -shared -o $@ $^

code2: $(PROGS)
code2.o: code2.c square.h cube.h
square.o: square.c
cube.o: cube.c
libfunc.so: cube.o square.o

clear:
	$(RM) $(DELETE)
