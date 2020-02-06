all:
	gcc -g -c uexit.c
	make -C lib
	make -C web2c
	@#
	tangle tex.web tex.ch
	sh convert
	gcc -DTeX -Ilib -g -c lib/openinout.c
	cat -s tex.c | indent -nce -nut -i2 -kr | sponge tex.c
	gcc -DTeX -Ilib -g -c tex.c
	@#
	gcc -DTeX -Ilib -DINI -g -c lib/texmf.c
	gcc -o initex -g texmf.o openinout.o tex.o uexit.o lib/setpaths.o lib/lib.a
	@#
	tie -c ctex.ch tex.web tex.ch virtex.ch
	tangle tex.web ctex.ch
	sh convert
	gcc -DTeX -Ilib -g -c lib/openinout.c
	cat -s tex.c | indent -nce -nut -i2 -kr | sponge tex.c
	gcc -DTeX -Ilib -g -c tex.c
	gcc -DTeX -Ilib -g -c lib/texmf.c
	gcc -o virtex -g texmf.o openinout.o tex.o uexit.o lib/setpaths.o lib/lib.a
