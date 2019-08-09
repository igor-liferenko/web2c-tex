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
	mv virtex /usr/local/bin/
	@mkdir -p /usr/local/share/texmf/web2c/
	mv tex.pool /usr/local/share/texmf/web2c/

# remove the following and ./lhplain.ini when you will not intend to do changes in this repo anymore
fmt:
	@perl -ne 'print if /plain/ or /\\let\\\w{6,}=\\undefined/ or /hoffset/..eof' lhplain.ini >tex.ini
	@initex tex.ini >/dev/null
	@mv tex.fmt /usr/local/share/texmf/web2c/
	@perl -ne 'print unless /^\s+\\xordcode/' lhplain.ini >ru.ini # TL's tex works OK as-is, but this tex does not process \xordcode for some reason, so exclude it and convert manually in the next command
	@cat /usr/share/texlive/texmf-dist/tex/generic/ruhyphen/ruhyphal.tex | iconv -f koi8-r -t cp866 >ruhyphal.tex
	@initex ru.ini >/dev/null
	@mv ru.fmt /usr/local/share/texmf/web2c/
	@mkdir -p /usr/local/share/texmf/web2c/pdftex/
	@perl -pe 's/^(?=\\hoffset)/\\ifx\\pdfoutput\\undefined\\else\\pdfoutput=1 \\pdfcompresslevel=9 \\pdfdecimaldigits=3 \\pdfpkresolution=600 \\pdfminorversion=5 \\pdfobjcompresslevel=2 \\pdfhorigin=1in \\pdfvorigin=1in \\pdfpagewidth=210mm \\pdfpageheight=297mm \\fi\n/;s/^(?=  \\hoffset)/\\ifx\\pdfoutput\\undefined\\else\\pdfhorigin1truein \\pdfvorigin1truein \\pdfpagewidth210truemm \\pdfpageheight297truemm \\fi\n/' lhplain.ini >pdflhplain.ini
	@pdftex -ini -jobname pdftex pdflhplain.ini >/dev/null
	@mv pdftex.fmt /usr/local/share/texmf/web2c/pdftex/
	@pdftex -ini -enc -jobname pdfru pdflhplain.ini >/dev/null
	@mv pdfru.fmt /usr/local/share/texmf/web2c/pdftex/
	@texhash /usr/local/share/texmf >/dev/null
