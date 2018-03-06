cp -f tangleboot.pin tangleboot.p
/bin/bash ./web2c/convert tangleboot
depbase=`echo tangleboot.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\
gcc -DHAVE_CONFIG_H -I. -I./w2c    -Wimplicit -Wreturn-type -g -O2 -MT tangleboot.o -MD -MP -MF $depbase.Tpo -c -o tangleboot.o tangleboot.c &&\
mv -f $depbase.Tpo $depbase.Po
/bin/bash ./libtool  --tag=CC   --mode=link gcc -Wimplicit -Wreturn-type -g -O2   -o tangleboot tangleboot.o lib/lib.a -lkpathsea -lm 
libtool: link: gcc -Wimplicit -Wreturn-type -g -O2 -o tangleboot tangleboot.o  lib/lib.a -lkpathsea -lm
WEBINPUTS=.:. TEXMFCNF=./../kpathsea ./tangleboot tangle tangle
This is TANGLE, Version 4.5 (TeX Live 2018)
*1*11*19*29*37*50*65*70*77*94*112*123*143*156*163*171*179*182*188*200
Writing the output file.....500....
Done.
(No errors were found.)
/bin/bash ./web2c/convert tangle
depbase=`echo tangle.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\
gcc -DHAVE_CONFIG_H -I. -I./w2c    -Wimplicit -Wreturn-type -g -O2 -MT tangle.o -MD -MP -MF $depbase.Tpo -c -o tangle.o tangle.c &&\
mv -f $depbase.Tpo $depbase.Po
/bin/bash ./libtool  --tag=CC   --mode=link gcc -Wimplicit -Wreturn-type -g -O2   -o tangle tangle.o lib/lib.a -lkpathsea -lm 
libtool: link: gcc -Wimplicit -Wreturn-type -g -O2 -o tangle tangle.o  lib/lib.a -lkpathsea -lm
cp -f ctangleboot.cin ctangleboot.c
cp -f cwebboot.hin cwebboot.h
depbase=`echo ctangleboot.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\
gcc -DHAVE_CONFIG_H -I. -I./w2c    -Wimplicit -Wreturn-type -g -O2 -MT ctangleboot.o -MD -MP -MF $depbase.Tpo -c -o ctangleboot.o ctangleboot.c &&\
mv -f $depbase.Tpo $depbase.Po
cwebdir/common.h:150:8: warning: type defaults to ‘int’ in declaration of ‘change_depth’ [-Wimplicit-int]
 extern change_depth; /* where \.{@@y} originated during a change */
        ^~~~~~~~~~~~
cp -f cwebboot.cin cwebboot.c
depbase=`echo cwebboot.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\
gcc -DHAVE_CONFIG_H -I. -I./w2c    -Wimplicit -Wreturn-type -g -O2 -MT cwebboot.o -MD -MP -MF $depbase.Tpo -c -o cwebboot.o cwebboot.c &&\
mv -f $depbase.Tpo $depbase.Po
/bin/bash ./libtool  --tag=CC   --mode=link gcc -Wimplicit -Wreturn-type -g -O2   -o ctangleboot ctangleboot.o cwebboot.o lib/lib.a -lkpathsea -lm 
libtool: link: gcc -Wimplicit -Wreturn-type -g -O2 -o ctangleboot ctangleboot.o cwebboot.o  lib/lib.a -lkpathsea -lm
./ctangleboot ctangle ctang-w2c
This is CTANGLE, Version 3.64 (TeX Live 2018)
*1*15*22*26*34*40*54*60*74*81*95
Writing the output file (ctangle.c):.....500.....1000..
Done.
(No errors were found.)
./ctangleboot common comm-w2c cweb.c
This is CTANGLE, Version 3.64 (TeX Live 2018)
*1*5*7*29*58*69*79*84*85*88
Writing the output files: (cweb.c).....500...
(cweb.h)
Done.
(No errors were found.)
depbase=`echo ctangle.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\
gcc -DHAVE_CONFIG_H -I. -I./w2c    -Wimplicit -Wreturn-type -g -O2 -MT ctangle.o -MD -MP -MF $depbase.Tpo -c -o ctangle.o ctangle.c &&\
mv -f $depbase.Tpo $depbase.Po
./cwebdir/common.h:150:8: warning: type defaults to ‘int’ in declaration of ‘change_depth’ [-Wimplicit-int]
 extern change_depth; /* where \.{@@y} originated during a change */
        ^~~~~~~~~~~~
depbase=`echo cweb.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\
gcc -DHAVE_CONFIG_H -I. -I./w2c    -Wimplicit -Wreturn-type -g -O2 -MT cweb.o -MD -MP -MF $depbase.Tpo -c -o cweb.o cweb.c &&\
mv -f $depbase.Tpo $depbase.Po
/bin/bash ./libtool  --tag=CC   --mode=link gcc -Wimplicit -Wreturn-type -g -O2   -o ctangle ctangle.o cweb.o lib/lib.a -lkpathsea -lm 
libtool: link: gcc -Wimplicit -Wreturn-type -g -O2 -o ctangle ctangle.o cweb.o  lib/lib.a -lkpathsea -lm
CWEBINPUTS=./ctiedir TEXMFCNF=./../kpathsea ./ctangle ctie.w ctie-k.ch
This is CTANGLE, Version 3.64 (TeX Live 2018)
*1*10*12*21*30*40*44*72*73
Writing the output file (ctie.c):.....500...
Done.
(No errors were found.)
depbase=`echo ctie.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\
gcc -DHAVE_CONFIG_H -I. -I./w2c    -Wimplicit -Wreturn-type -g -O2 -MT ctie.o -MD -MP -MF $depbase.Tpo -c -o ctie.o ctie.c &&\
mv -f $depbase.Tpo $depbase.Po
/bin/bash ./libtool  --tag=CC   --mode=link gcc -Wimplicit -Wreturn-type -g -O2   -o ctie ctie.o lib/lib.a -lkpathsea -lm 
libtool: link: gcc -Wimplicit -Wreturn-type -g -O2 -o ctie ctie.o  lib/lib.a -lkpathsea -lm
CWEBINPUTS=./cwebdir TEXMFCNF=./../kpathsea ./ctangle cweave cweav-w2c
This is CTANGLE, Version 3.64 (TeX Live 2018)
*1*15*28*36*57*76*87*95*102*173*184*204*224*250
Writing the output file (cweave.c):.....500.....1000.....1500.....2000.....2500.....3000...
Done.
(No errors were found.)
depbase=`echo cweave.o | sed 's|[^/]*$|.deps/&|;s|\.o$||'`;\
gcc -DHAVE_CONFIG_H -I. -I./w2c    -Wimplicit -Wreturn-type -g -O2 -MT cweave.o -MD -MP -MF $depbase.Tpo -c -o cweave.o cweave.c &&\
mv -f $depbase.Tpo $depbase.Po
./cwebdir/common.h:150:8: warning: type defaults to ‘int’ in declaration of ‘change_depth’ [-Wimplicit-int]
 extern change_depth; /* where \.{@@y} originated during a change */
        ^~~~~~~~~~~~
/bin/bash ./libtool  --tag=CC   --mode=link gcc -Wimplicit -Wreturn-type -g -O2   -o cweave cweave.o cweb.o lib/lib.a -lkpathsea -lm 
libtool: link: gcc -Wimplicit -Wreturn-type -g -O2 -o cweave cweave.o cweb.o  lib/lib.a -lkpathsea -lm
CWEBINPUTS=./tiedir TEXMFCNF=./../kpathsea ./ctangle tie.w tie-w2c.ch
This is CTANGLE, Version 3.64 (TeX Live 2018)
*1*7*15*18*24*31*34*38*59*61*62
Writing the output file (tie.c):.....500..
Done.
(No errors were found.)
gcc -DHAVE_CONFIG_H -I. -I./w2c   -DNOT_WEB2C  -Wimplicit -Wreturn-type -g -O2 -MT tie-tie.o -MD -MP -MF .deps/tie-tie.Tpo -c -o tie-tie.o `test -f 'tie.c' || echo './'`tie.c
mv -f .deps/tie-tie.Tpo .deps/tie-tie.Po
/bin/bash ./libtool  --tag=CC   --mode=link gcc -Wimplicit -Wreturn-type -g -O2   -o tie tie-tie.o lib/lib.a -lkpathsea -lm 
libtool: link: gcc -Wimplicit -Wreturn-type -g -O2 -o tie tie-tie.o  lib/lib.a -lkpathsea -lm
WEBINPUTS=.:. TEXMFCNF=./../kpathsea ./tie -c tex-final.ch tex.web tex.ch enctex.ch  tex-binpool.ch
This is TIE, CWEB Version 2.4. (TeX Live 2018)
Copyright (c) 1989,1992 by THD/ITI. All rights reserved.
(tex.web)
(tex.ch)
(enctex.ch)
(tex-binpool.ch)
....500....1000....1500....2000....2500....3000....3500....4000....4500....5000....5500....6000....6500....7000....7500....8000....8500....9000....9500....10000....10500....11000....11500....12000....12500....13000....13500....14000....14500....15000....15500....16000....16500....17000....17500....18000....18500....19000....19500....20000....20500....21000....21500....22000....22500....23000....23500....24000....24500....
(No errors were found.)
WEBINPUTS=.:. TEXMFCNF=./../kpathsea ./tangle tex tex-final
This is TANGLE, Version 4.5 (TeX Live 2018)
*1*17*25*38*54*72*99*110*115*133*162*173*199*203*207*211*220*256*268*289*297*300*321*332*366*405*467*490*514*542*586*595*647*683*702*722*771*816*865*894*903*922*945*970*983*1032*1058*1139*1211*1302*1333*1341*1343*1382*1391*1393*1405*1414*1417
Writing the output file.....500.....1000.....1500.....2000.....2500.....3000.....3500.....4000.....4500.....5000.....5500.....6000.....6500.....7000.
Done.
1090 strings written to string pool file.
(No errors were found.)
/bin/bash ./web2c/convert tex
gcc -DHAVE_CONFIG_H -I. -I./w2c     -Wimplicit -Wreturn-type -g -O2 -MT tex-texextra.o -MD -MP -MF .deps/tex-texextra.Tpo -c -o tex-texextra.o `test -f 'texextra.c' || echo './'`texextra.c
mv -f .deps/tex-texextra.Tpo .deps/tex-texextra.Po
gcc -DHAVE_CONFIG_H -I. -I./w2c     -Wimplicit -Wreturn-type -g -O2 -MT tex-texini.o -MD -MP -MF .deps/tex-texini.Tpo -c -o tex-texini.o `test -f 'texini.c' || echo './'`texini.c
mv -f .deps/tex-texini.Tpo .deps/tex-texini.Po
gcc -DHAVE_CONFIG_H -I. -I./w2c     -Wimplicit -Wreturn-type -g -O2 -MT tex-tex0.o -MD -MP -MF .deps/tex-tex0.Tpo -c -o tex-tex0.o `test -f 'tex0.c' || echo './'`tex0.c
mv -f .deps/tex-tex0.Tpo .deps/tex-tex0.Po
web2c/makecpool tex >tex-pool.c || rm -f tex-pool.c
gcc -DHAVE_CONFIG_H -I. -I./w2c     -Wimplicit -Wreturn-type -g -O2 -MT tex-tex-pool.o -MD -MP -MF .deps/tex-tex-pool.Tpo -c -o tex-tex-pool.o `test -f 'tex-pool.c' || echo './'`tex-pool.c
mv -f .deps/tex-tex-pool.Tpo .deps/tex-tex-pool.Po
/bin/bash ./libtool  --tag=CC   --mode=link gcc -Wimplicit -Wreturn-type -g -O2   -o tex tex-texextra.o  tex-texini.o tex-tex0.o tex-tex-pool.o lib/lib.a -lkpathsea   -lm 
libtool: link: gcc -Wimplicit -Wreturn-type -g -O2 -o tex tex-texextra.o tex-texini.o tex-tex0.o tex-tex-pool.o  lib/lib.a -lkpathsea -lm
