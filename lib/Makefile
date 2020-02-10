all:
	gcc -I. -g  -c fprintreal.c
	gcc -I. -g  -c inputint.c
	rm -f lib.a
	ar cq lib.a fprintreal.o inputint.o
	ranlib lib.a
