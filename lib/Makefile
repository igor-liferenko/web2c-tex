all:
	gcc -I. -g  -c fprintreal.c
	gcc -I. -g  -c inputint.c
	gcc -I. -g  -c main.c
	gcc -I. -g  -c strpascal.c
	gcc -I. -g  -c zround.c
	rm -f lib.a
	ar cq lib.a fprintreal.o inputint.o main.o strpascal.o zround.o
	ranlib lib.a
