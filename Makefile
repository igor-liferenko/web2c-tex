# ftp://tug.ctan.org/pub/tex/historic/systems/web2c/
# http://tug.ctan.org/tex-archive/systems/knuth/local/tex/initex.ch
# http://tug.ctan.org/tex-archive/systems/knuth/local/tex-sparc/
all:
	make -C web2c
	ctangle -bhp ext
	@#
	tangle tex.web initex.ch
	sh convert
	gcc -g -c ext.c
	cat -s tex.c | indent -nce -nut -i2 -kr | sponge tex.c
	gcc -g -c tex.c
	@#
	gcc -o initex -g ext.o tex.o
	@cp coerce.h coerce-initex.h
	@cp texd.h texd-initex.h
	@cp tex.c tex-initex.c
	@cp tex.p tex-initex.p
	@#
	./ini_to_vir initex.ch virtex.ch
	tangle tex.web virtex.ch
	sh convert
	gcc -g -c ext.c
	cat -s tex.c | indent -nce -nut -i2 -kr | sponge tex.c
	gcc -g -c tex.c
	gcc -o virtex -g ext.o tex.o

clean:
	git clean -X -d -f
