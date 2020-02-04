all:
	make -C lib
	make -C web2c
	ctangle -bhp splitup
	gcc -g -o splitup splitup.c
	@#
	tangle tex.web tex.ch
	/bin/sh ./convert
	gcc -DTeX -Ilib -g -c lib/openinout.c
	gcc -DTeX -Ilib -g -c tex0.c
	@#
	gcc -DTeX -Ilib -DINI -g -c lib/texmf.c
	gcc -DTeX -Ilib -g -c itex.c
	gcc -o initex -g texmf.o itex.o openinout.o tex0.o lib/lib.a -lkpathsea
	@#
	tie -c ctex.ch tex.web tex.ch virtex.ch
	tangle tex.web ctex.ch
	/bin/sh ./convert
	gcc -DTeX -Ilib -g -c lib/openinout.c
	gcc -DTeX -Ilib -g -c tex0.c
	gcc -DTeX -Ilib -g -c lib/texmf.c
	gcc -DTeX -Ilib -g -c itex.c
	gcc -o virtex -g texmf.o itex.o openinout.o tex0.o lib/lib.a -lkpathsea
