# ftp://tug.ctan.org/pub/tex/historic/systems/web2c/
# http://tug.ctan.org/tex-archive/systems/knuth/local/tex/initex.ch
# https://bencane.com/2011/09/22/kill-creating-a-core-dump/
all:
	make -C lib
	make -C web2c
	rm -f iextra.c
	ln -s lib/texmf.c iextra.c
	rm -f ctex.ch
	tie -c ctex.ch tex.web tex.ch ru.ch enctex.ch
	tangle tex.web ctex.ch
	/bin/sh ./convert
	gcc -DTeX -Ilib -DINITEX -DINI -g  -c iextra.c
	rm -f initex.c
	ln -s itex.c initex.c
	gcc -DTeX -Ilib -DINITEX -g  -c initex.c
	rm -f openinout.c
	ln -s lib/openinout.c openinout.c
	gcc -DTeX -Ilib -g  -c openinout.c
	gcc -DTeX -Ilib -g  -c tex0.c
	gcc -DTeX -Ilib -g  -c tex1.c
	gcc -DTeX -Ilib -g  -c tex2.c
	gcc -DTeX -Ilib -g  -c tex3.c
	gcc -DTeX -Ilib -g  -c tex4.c
	gcc -DTeX -Ilib -g  -c tex5.c
	gcc -DTeX -Ilib -g  -c tex6.c
	gcc -DTeX -Ilib -g  -c tex7.c
	gcc -DTeX -Ilib -g  -c tex8.c
	gcc -DTeX -Ilib -g  -c tex9.c
	gcc -o initex -g   iextra.o initex.o openinout.o tex0.o tex1.o tex2.o tex3.o tex4.o tex5.o tex6.o tex7.o tex8.o tex9.o  lib/lib.a -lkpathsea
	mv initex /usr/local/bin/
	rm -f vextra.c
	ln -s lib/texmf.c vextra.c
	gcc -DTeX -Ilib -g  -c vextra.c
	gcc -DTeX -Ilib -g  -c itex.c
	gcc -o virtex -g   vextra.o itex.o openinout.o tex0.o tex1.o tex2.o tex3.o tex4.o tex5.o tex6.o tex7.o tex8.o tex9.o  lib/lib.a -lkpathsea
