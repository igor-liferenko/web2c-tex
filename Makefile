all:
	make -C lib
	make -C web2c
	gcc -DTeX -Ilib -g -c lib/openinout.c
	@#
	tangle tex.web tex.ch
	/bin/sh ./convert
	gcc -DTeX -Ilib -g -c tex0.c
	@#
	gcc -DTeX -Ilib -DINITEX -DINI -g -c lib/texmf.c
	gcc -DTeX -Ilib -DINITEX -g -c itex.c
	gcc -o initex -g texmf.o itex.o openinout.o tex0.o lib/lib.a -lkpathsea
	@#
	gcc -DTeX -Ilib -g -c lib/texmf.c
	gcc -DTeX -Ilib -g -c itex.c
	gcc -o virtex -g texmf.o itex.o openinout.o tex0.o lib/lib.a -lkpathsea
