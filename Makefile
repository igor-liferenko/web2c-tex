all:
	make -C web2c
	make -C lib
	rm -f iextra.c
	ln -s lib/texmf.c iextra.c
	rm -f ctex.ch
	cp tex.ch ctex.ch
	tangle tex.web ctex.ch
	/bin/sh ./convert
	touch texd.h
	gcc -DTeX -Ilib -Iweb2c-6.1 -DINITEX -DINI -g  -c iextra.c
	/bin/sh ./convert
	touch texd.h
	rm -f initex.c
	ln -s itex.c initex.c
	gcc -DTeX -Ilib -Iweb2c-6.1 -DINITEX -g  -c initex.c
	rm -f openinout.c
	ln -s lib/openinout.c openinout.c
	gcc -DTeX -Ilib -Iweb2c-6.1 -g  -c openinout.c
	/bin/sh ./convert
	touch texd.h
	gcc -DTeX -Ilib -Iweb2c-6.1 -g  -c tex0.c
	/bin/sh ./convert
	touch texd.h
	gcc -DTeX -Ilib -Iweb2c-6.1 -g  -c tex1.c
	/bin/sh ./convert
	touch texd.h
	gcc -DTeX -Ilib -Iweb2c-6.1 -g  -c tex2.c
	/bin/sh ./convert
	touch texd.h
	gcc -DTeX -Ilib -Iweb2c-6.1 -g  -c tex3.c
	/bin/sh ./convert
	touch texd.h
	gcc -DTeX -Ilib -Iweb2c-6.1 -g  -c tex4.c
	/bin/sh ./convert
	touch texd.h
	gcc -DTeX -Ilib -Iweb2c-6.1 -g  -c tex5.c
	/bin/sh ./convert
	touch texd.h
	gcc -DTeX -Ilib -Iweb2c-6.1 -g  -c tex6.c
	/bin/sh ./convert
	touch texd.h
	gcc -DTeX -Ilib -Iweb2c-6.1 -g  -c tex7.c
	/bin/sh ./convert
	touch texd.h
	gcc -DTeX -Ilib -Iweb2c-6.1 -g  -c tex8.c
	/bin/sh ./convert
	touch texd.h
	gcc -DTeX -Ilib -Iweb2c-6.1 -g  -c tex9.c
	gcc -o initex -g   iextra.o initex.o openinout.o tex0.o tex1.o tex2.o tex3.o tex4.o tex5.o tex6.o tex7.o tex8.o tex9.o  lib/lib.a web2c-6.1/kpathsea/kpathsea.a
	rm -f vextra.c
	ln -s lib/texmf.c vextra.c
	gcc -DTeX -Ilib -Iweb2c-6.1 -g  -c vextra.c
	gcc -DTeX -Ilib -Iweb2c-6.1 -g  -c itex.c
	gcc -o virtex -g   vextra.o itex.o openinout.o tex0.o tex1.o tex2.o tex3.o tex4.o tex5.o tex6.o tex7.o tex8.o tex9.o  lib/lib.a web2c-6.1/kpathsea/kpathsea.a
