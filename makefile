#plik makefile

code2: code2.o libfunc.so
	gcc -o code2 code2.o libfunc.so -Wl,-rpath=/home/student/make

code2.o: code2.c square.h cube.h
	gcc -c code2.c

square.o: square.c
	gcc -fPIC -c square.c

cube.o: cube.c
	gcc -fPIC -c cube.c

libfunc.so: cube.o square.o
	gcc -shared -o libfunc.so cube.o square.o

clear:
	rm  code2 code2.o square.o cube.o libfunc.so
