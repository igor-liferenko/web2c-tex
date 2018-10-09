all:
	make -C web2c
	tie -c tex-final.ch tex.web tex.ch enctex.ch  tex-binpool.ch
	tangle tex tex-final
	web2c/convert tex # creates tex0.c
	gcc -DHAVE_CONFIG_H -I. -I./w2c -Wimplicit -Wreturn-type -g -O2 -c -o tex-texextra.o texextra.c
	gcc -DHAVE_CONFIG_H -I. -I./w2c -Wimplicit -Wreturn-type -g -O2 -c -o texini.o texini.c
	gcc -DHAVE_CONFIG_H -I. -I./w2c -Wimplicit -Wreturn-type -g -O2 -c -o tex0.o tex0.c
	web2c/makecpool tex >tex-pool.c || rm -f tex-pool.c
	gcc -DHAVE_CONFIG_H -I. -I./w2c -Wimplicit -Wreturn-type -g -O2 -c -o tex-pool.o tex-pool.c
	make -C lib # creates lib.a
	gcc -Wimplicit -Wreturn-type -g -O2 -o tex tex-texextra.o texini.o tex0.o tex-pool.o lib/lib.a -lkpathsea -lm
	mv tex /usr/local/bin/
