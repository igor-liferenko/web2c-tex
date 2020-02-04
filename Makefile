# ftp://tug.ctan.org/pub/tex/historic/systems/web2c/
# http://tug.ctan.org/tex-archive/systems/knuth/local/tex/initex.ch
# https://bencane.com/2011/09/22/kill-creating-a-core-dump/
all:
	make -C lib
	make -C web2c
	rm -f iextra.c
	ln -s lib/texmf.c iextra.c
	tangle tex.web tex.ch
	/bin/sh ./convert
	gcc -DTeX -Ilib -DINITEX -DINI -g -c iextra.c
	rm -f initex.c
	ln -s itex.c initex.c
	gcc -DTeX -Ilib -DINITEX -g -c initex.c
	rm -f openinout.c
	ln -s lib/openinout.c openinout.c
	gcc -DTeX -Ilib -g -c openinout.c
	gcc -DTeX -Ilib -g -c tex0.c
	gcc -o initex -g iextra.o initex.o openinout.o tex0.o lib/lib.a -lkpathsea
	rm -f vextra.c
	ln -s lib/texmf.c vextra.c
	gcc -DTeX -Ilib -g -c vextra.c
	gcc -DTeX -Ilib -g -c itex.c
	gcc -o virtex -g vextra.o itex.o openinout.o tex0.o lib/lib.a -lkpathsea
