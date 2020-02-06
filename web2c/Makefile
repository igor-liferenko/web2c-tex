all:
	bison -y -d -v web2c.yacc
	gcc -I./../lib -g -c web2c.c
	gcc -I./../lib -g -c y.tab.c
	flex web2c.lex
	gcc -I./../lib -g -c lex.yy.c
	gcc -o web2c -g web2c.o y.tab.o lex.yy.o ../uexit.o -lfl
