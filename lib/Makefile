all:
	gcc -I. -g  -c fprintreal.c
	gcc -I. -g  -c inputint.c
	gcc -I. -g  -c strpascal.c
	rm -f lib.a
	ar cq lib.a fprintreal.o inputint.o strpascal.o
	ranlib lib.a
