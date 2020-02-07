all:
	gcc -I. -g  -c eofeoln.c
	gcc -I. -g  -c fprintreal.c
	gcc -I. -g  -c inputint.c
	gcc -I. -g  -c main.c
	gcc -I. -g  -c strpascal.c
	gcc -I. -g  -c xfopen-pas.c
	gcc -I. -g  -c zround.c
	rm -f lib.a
	ar cq lib.a eofeoln.o fprintreal.o inputint.o main.o strpascal.o xfopen-pas.o zround.o
	ranlib lib.a
