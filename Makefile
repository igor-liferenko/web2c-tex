# http://ftp.math.utah.edu/pub/tex/historic/systems/web2c/web2c-7.5.4/
# https://bencane.com/2011/09/22/kill-creating-a-core-dump/
all:
	make -C web2c
	tie -c initex-final.ch tex.web tex.ch initex.ch
	tangle tex initex-final
	mv tex.p initex.p
	web2c/convert initex
	tie -c tex-final.ch tex.web tex.ch
	@#diff -u0 initex-final.ch tex-final.ch
	tangle tex tex-final
	web2c/convert tex # creates tex0.c, texini.c, texcoerce.h and texd.h (texcoerce.h is used in texd.h)
	gcc -DHAVE_CONFIG_H -I. -I./w2c -Wimplicit -Wreturn-type -g -O2 -c -o tex0.o tex0.c # texd.h is used here
	gcc -DHAVE_CONFIG_H -I. -I./w2c -Wimplicit -Wreturn-type -g -O2 -c -o texini.o texini.c # texd.h is used here
	gcc -DHAVE_CONFIG_H -I. -I./w2c -Wimplicit -Wreturn-type -g -O2 -c -o texextra.o texextra.c # texd.h is used here
	make -C lib # creates lib.a
	gcc -Wimplicit -Wreturn-type -g -O2 -o virtex texextra.o texini.o tex0.o lib/lib.a -lkpathsea -lm
	mv virtex /usr/local/bin/
