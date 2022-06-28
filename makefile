#plik makefile

CC = gcc
RM = rm -f
CFLAGS = -c
PROGS = code2.o libfunc.so
RMPROG = code2 code2.o square.o cube.o libfunc.so square.h.gch cube.h.gch
PATHL = /home/student/make

code2: $(PROGS)
    $(CC) -o $@ $^ -Wl,-rpath=$(PATHL)

code2.o: code2.c square.h cube.h
    $(CC) $(CFLAGS) $^

square.o: square.c
    $(CC) -fPIC $(CFLAGS) $<

cube.o: cube.c
    $(CC) -fPIC $(CFLAGS) $<

libfunc.so: cube.o square.o
    $(CC) -shared -o $@ $^

clean:
    $(RM) $(RMPROG)