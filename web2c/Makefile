all:
	bison -y -d -v web2c.yacc
	gcc -g -c web2c.c
	gcc -g -c y.tab.c
	flex web2c.lex
	gcc -g -c lex.yy.c
	gcc -g -c uexit.c
	gcc -o web2c -g web2c.o y.tab.o lex.yy.o uexit.o -lfl
