/* lib/c-auto.h.  Generated automatically by configure.  */
/* c-auto.h.in: template for c-auto.h.  */

/* First, here are user-dependent definitions.  configure doesn't change
   any of these by default; if you want different values, the most
   convenient thing to do is edit this file before you run configure.
   
   Alternatively, you can set the environment variable DEFS before
   running configure, as in:
	DEFS="-DSMALLTeX -DNO_FMTBASE_SWAP"
   
   Another alternative is to redefine values via CFLAGS when you
   compile, although then of course whatever configure might have done
   automatically based on these definitions won't happen.  */


/* Define these if you want to compile the small (64K memory) TeX/MF.
   The default is to compile the big (260K memory) versions.
   Similarly for BibTeX.  */

#ifndef SMALLTeX
/* #undef SMALLTeX */
#endif
#ifndef SMALLMF
/* #undef SMALLMF */
#endif
#ifndef SMALLBibTeX
/* #undef SMALLBibTeX */
#endif

/* Metafont online output support: More than one may be defined, except
   that you can't have both X10 and X11 support (because there are
   conflicting routine names in the libraries), or both X11 and XView
   support, for the same reason.
   
   If you want X11 support, see the `Online output from Metafont'
   section in README before compiling.  */
#ifndef HP2627WIN
/* #undef HP2627WIN */	/* HP 2627 */
#endif
#ifndef NEXTWIN
/* #undef NEXTWIN */		/* NeXT, requires separate program;
                           see mf/MFwindow/next.c. */
#endif
#ifndef REGISWIN
/* #undef REGISWIN */		/* Regis */
#endif
#ifndef SUNWIN
/* #undef SUNWIN */		/* SunWindows */
#endif
#ifndef TEKTRONIXWIN
/* #undef TEKTRONIXWIN */	/* Tektronix 4014 */
#endif
#ifndef UNITERMWIN
/* #undef UNITERMWIN */	/* Uniterm Tektronix  */
#endif
#ifndef XVIEWWIN
/* #undef XVIEWWIN */		/* Sun OpenWindows  */
#endif
#ifndef X10WIN
/* #undef X10WIN */		/* X Version 10 */
#endif
#ifndef NO_X11WIN
#define X11WIN		/* X Version 11 */
#endif

/* Default editor command string: `%d' expands to the line number where
   TeX or Metafont found an error and `%s' expands to the name of the
   file.  The environment variables TEXEDIT and MFEDIT override this.  */
#ifndef EDITOR
#define EDITOR "vi +%d %s"
#endif

/* If you want fmt/base files to be different on different Endian
   architectures, and hence non-sharable, define this.
   You might want this because sharable files load slower on
   LittleEndian machines.  */ 
#ifndef NO_FMTBASE_SWAP
/* #undef NO_FMTBASE_SWAP */
#endif

/* On some systems, explicit register declarations make a big
   difference.  On others, they make no difference at all -- for
   example, the GNU C compiler ignores them when optimizing.  */
#ifndef REGFIX
/* #undef REGFIX */
#endif

/* Redefine this only if you are using some non-standard TeX
   variant which has a different string pool, e.g., Michael Ferguson's
   MLTeX.  You may also need to define $(extra_tex_obj)=tex10.o or some
   such for `tex/Makefile'.  */
#ifndef TEXPOOLNAME
#define TEXPOOLNAME "tex.pool"
#endif

#define UNIX_ST_NLINK

/* Define as the proper declaration for yytext.  */
#define DECLARE_YYTEXT extern char *yytext;

/* Define if you have dirent.h.  */
#define DIRENT 1

/* Define if long int is 64 bits.  */
#define LONG_64_BITS 1

/* Define as the return type of signal handlers (int or void).  */
#define RETSIGTYPE void

/* Define if you have the ANSI C header files.  */
#define STDC_HEADERS 1

/* Define if you have memmove.  */
#define HAVE_MEMMOVE 1

/* Define if you have putenv.  */
#define HAVE_PUTENV 1

/* Define if you have the <assert.h> header file.  */
#define HAVE_ASSERT_H 1

/* Define if you have the <float.h> header file.  */
#define HAVE_FLOAT_H 1

/* Define if you have the <limits.h> header file.  */
#define HAVE_LIMITS_H 1

/* Define if you have the <memory.h> header file.  */
#define HAVE_MEMORY_H 1

/* Define if you have the <pwd.h> header file.  */
#define HAVE_PWD_H 1

/* Define if you have the <stdlib.h> header file.  */
#define HAVE_STDLIB_H 1

/* Define if you have the <string.h> header file.  */
#define HAVE_STRING_H 1

/* Define if you have the <unistd.h> header file.  */
#define HAVE_UNISTD_H 1
