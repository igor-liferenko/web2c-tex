all:
	echo Expect one shift/reduce conflict.
	bison -y -d -v web2c.yacc
	gcc -I./../lib -I../web2c-6.1 -g  -c web2c.c
	echo Expect one shift/reduce conflict.
	bison -y -d -v web2c.yacc
	gcc -I./../lib -I../web2c-6.1 -g  -c y.tab.c
	flex web2c.lex
	gcc -I./../lib -I../web2c-6.1 -g  -c lex.yy.c
	gcc -o web2c -g   web2c.o y.tab.o lex.yy.o ../lib/lib.a ../web2c-6.1/kpathsea/kpathsea.a  -lfl
	gcc -I./../lib -I../web2c-6.1 -g  -c fixwrites.c
	gcc -o fixwrites -g   fixwrites.o ../lib/lib.a ../web2c-6.1/kpathsea/kpathsea.a 
	gcc -I./../lib -I../web2c-6.1 -g  -c splitup.c
	gcc -o splitup -g   splitup.o ../lib/lib.a ../web2c-6.1/kpathsea/kpathsea.a 
	gcc -I./../lib -I../web2c-6.1 -g  -c regfix.c
	gcc -o regfix -g   regfix.o ../lib/lib.a ../web2c-6.1/kpathsea/kpathsea.a 
