all:
	echo Expect one shift/reduce conflict.
	bison -y -d -v web2c.yacc
	gcc -I./../lib -g  -c web2c.c
	echo Expect one shift/reduce conflict.
	bison -y -d -v web2c.yacc
	gcc -I./../lib -g  -c y.tab.c
	flex web2c.lex
	gcc -I./../lib -g  -c lex.yy.c
	gcc -o web2c -g   web2c.o y.tab.o lex.yy.o ../lib/lib.a -lkpathsea  -lfl
	gcc -I./../lib -g  -c fixwrites.c
	gcc -o fixwrites -g   fixwrites.o ../lib/lib.a -lkpathsea
	gcc -I./../lib -g  -c regfix.c
	gcc -o regfix -g   regfix.o ../lib/lib.a -lkpathsea 
