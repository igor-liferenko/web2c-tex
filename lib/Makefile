all:
	gcc -g  -c alloca.c
	gcc -DHAVE_CONFIG_H -I. -I../web2c-6.1 -g  -c eofeoln.c
	gcc -DHAVE_CONFIG_H -I. -I../web2c-6.1 -g  -c fprintreal.c
	gcc -DHAVE_CONFIG_H -I. -I../web2c-6.1 -g  -c getopt.c
	gcc -DHAVE_CONFIG_H -I. -I../web2c-6.1 -g  -c getopt1.c
	gcc -DHAVE_CONFIG_H -I. -I../web2c-6.1 -g  -c inputint.c
	gcc -DHAVE_CONFIG_H -I. -I../web2c-6.1 -g  -c main.c
	gcc -DHAVE_CONFIG_H -I. -I../web2c-6.1 -g  -c ourpaths.c
	gcc -DHAVE_CONFIG_H -I. -I../web2c-6.1 -g  -c strpascal.c
	gcc -DHAVE_CONFIG_H -I. -I../web2c-6.1 -g  -c uexit.c
	gcc -DHAVE_CONFIG_H -I. -I../web2c-6.1 -g  -c version.c
	gcc -DHAVE_CONFIG_H -I. -I../web2c-6.1 -g  -c xfopen-pas.c
	gcc -DHAVE_CONFIG_H -I. -I../web2c-6.1 -g  -c zround.c
	rm -f lib.a
	ar cq lib.a alloca.o eofeoln.o fprintreal.o getopt.o getopt1.o inputint.o main.o ourpaths.o strpascal.o uexit.o version.o xfopen-pas.o zround.o
	ranlib lib.a
