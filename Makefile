# ftp://tug.ctan.org/pub/tex/historic/systems/web2c/
# http://tug.ctan.org/tex-archive/systems/knuth/local/tex/initex.ch
# http://tug.ctan.org/tex-archive/systems/knuth/local/tex-sparc/
all:
	gcc -g -c uexit.c
	make -C web2c
	@#
	tangle tex.web initex.ch
	sh convert
	ctangle -bhp open
	gcc -g -c open.c
	cat -s tex.c | indent -nce -nut -i2 -kr | sponge tex.c
	gcc -Ilib -g -c tex.c
	@#
	gcc -o initex -g open.o tex.o uexit.o
	@#
	./ini_to_vir initex.ch virtex.ch
	tangle tex.web virtex.ch
	sh convert
	ctangle -bhp open
	gcc -g -c open.c
	cat -s tex.c | indent -nce -nut -i2 -kr | sponge tex.c
	gcc -Ilib -g -c tex.c
	gcc -o virtex -g open.o tex.o uexit.o
