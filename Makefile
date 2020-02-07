# ftp://tug.ctan.org/pub/tex/historic/systems/web2c/
# http://tug.ctan.org/tex-archive/systems/knuth/local/tex/initex.ch
# http://tug.ctan.org/tex-archive/systems/knuth/local/tex-sparc/
all:
	gcc -g -c uexit.c
	make -C lib
	make -C web2c
	@#
	tangle tex.web initex.ch
	sh convert
	ctangle -bhp open
	gcc -DTeX -g -c open.c
	cat -s tex.c | indent -nce -nut -i2 -kr | sponge tex.c
	gcc -DTeX -Ilib -g -c tex.c
	@#
	gcc -DTeX -Ilib -DINI -g -c lib/texmf.c
	gcc -o initex -g texmf.o open.o tex.o uexit.o lib/lib.a
	@#
	./ini_to_vir initex.ch virtex.ch
	tangle tex.web virtex.ch
	sh convert
	ctangle -bhp open
	gcc -DTeX -g -c open.c
	cat -s tex.c | indent -nce -nut -i2 -kr | sponge tex.c
	gcc -DTeX -Ilib -g -c tex.c
	gcc -DTeX -Ilib -g -c lib/texmf.c
	gcc -o virtex -g texmf.o open.o tex.o uexit.o lib/lib.a
