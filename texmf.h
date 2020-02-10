/* config.h: Master configuration file.  This is included by common.h,
   which everyone includes.  */

#ifndef CONFIG_H
#define CONFIG_H

#include <stdio.h>
typedef int boolean;
#define true 1
#define false 0
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <unistd.h>
#define ISSPACE(c) (isascii (c) && isspace((unsigned char)c))
#include <ctype.h>
#define DIR_SEP '/'

/* Path searching.  */
#define TEXFORMATPATH 7
#define TEXINPUTPATH 8
#define TEXPOOLPATH 9
#define TFMFILEPATH 10
#define TEXFORMATPATHBIT (1 << TEXFORMATPATH)
#define TEXINPUTPATHBIT (1 << TEXINPUTPATH)
#define TEXPOOLPATHBIT (1 << TEXPOOLPATH)
#define TFMFILEPATHBIT (1 << TFMFILEPATH)

/* We never need the `link' system call, which is sometimes declared in
   <unistd.h>, but we do have lots of variables called `link' in the web
   sources.  */
#ifdef link
#undef link
#endif
#define link link_var


/* Throw away VMS' library routine `getname', as WEB uses that name.  */
#ifdef VMS
#ifdef getname
#undef getname
#endif
#define getname vms_getname
#endif

/* The smallest signed type: use `signed char' if ANSI C, `short' if
   char is unsigned, otherwise `char'.  */
#ifndef SCHAR_TYPE
#ifdef __STDC__
#define SCHAR_TYPE signed char
#else /* not __STDC */
#ifdef __CHAR_UNSIGNED__
#define SCHAR_TYPE short
#else
#define SCHAR_TYPE char
#endif
#endif /* not __STDC__ */
#endif /* not SCHAR_TYPE */
typedef SCHAR_TYPE schar;

/* The type `integer' must be a signed integer capable of holding at
   least the range of numbers (-2^31)..(2^31-1).  If your compiler goes
   to great lengths to make programs fail, you might have to change this
   definition.  If this changes, you may have to modify
   web2c/fixwrites.c, since it generates code to do integer output using
   "%ld", and casts all integral values to be printed to `long'. */
#define INTEGER_MAX LONG_MAX
#define INTEGER_MIN LONG_MIN
typedef long integer;

/* The type `glueratio' should be a floating point type which won't
   unnecessarily increase the size of the memoryword structure.  This is
   the basic requirement.  On most machines, if you're building a
   normal-sized TeX, then glueratio must probably meet the following
   restriction: sizeof(glueratio) <= sizeof(integer).  Usually, then,
   glueratio must be `float'.  But if you build a big TeX, you can (on
   most machines) and should make it `double' to avoid loss of precision
   and conversions to and from double during calculations. */
typedef double glueratio;

extern integer zround ();

/* File routines.  */
extern boolean eof ();
extern boolean eoln ();
extern void errprintpascalstring ();
extern void extendfilename ();
extern integer inputint ();
extern boolean open_input ();
extern boolean open_output ();
extern void fprintreal ();
extern void make_c_string ();
extern void make_pascal_string ();
extern void makesuffixpas ();
extern void null_terminate ();
extern void printpascalstring ();
extern void setpaths ();
extern void space_terminate ();
extern boolean test_eof ();
extern void uexit ();
extern void zinput2ints ();
extern void zinput3ints ();


/* Argument handling, etc.  */
extern int argc;
extern char **gargv;

#endif /* not CONFIG_H */


extern boolean aopenin();
extern boolean aopenout();
#define aclose(f) if (f) fclose(f)
extern boolean bopenin();
extern boolean bopenout();
#define bclose(f) if (f) fclose(f)
extern boolean wopenin();
#define wopenout bopenout
#define wclose(f) if (f) fclose(f)

/* cpascal.h: implement various bits of standard Pascal that we use.
   This is the top-level include file for all the web2c-generated C
   programs except TeX and Metafont themselves, which use texmf.h.  */

/* Absolute value.  Without the casts to integer here, the Ultrix and
   AIX compilers (at least) produce bad code (or maybe it's that I don't
   understand all the casting rules in C) for tests on memory fields. 
   Specifically, a test in diag_round (in Metafont) on a quarterword
   comes out differently without the cast, thus causing the trap test to
   fail.  (A path at line 86 is constructed slightly differently).  */
#ifdef abs
/* If the system had an abs #define already, get rid of it.  */
#undef abs
#endif
#define	abs(x) ((integer)(x) >= 0 ? (integer)(x) : (integer)-(x))

/* Other standard predefined routines.  */
#define	chr(x)		(x)
#define ord(x)		(x)
#define	odd(x)		((x) % 2)
#define	round(x)	zround ((double) (x))
#define trunc(x)	((integer) (x))

#define read(f, b)	((b) = getc (f))
#define	readln(f)	{ register int c; \
                          while ((c = getc (f)) != '\n' && c != EOF); }

/* PatGen 2 uses this.  */
#define	input2ints(a, b)  zinput2ints (&a, &b)

/* We need this routine only if TeX is being debugged.  */
#define	input3ints(a, b, c)  zinput3ints (&a, &b, &c)

/* Pascal has no address-of operator, and we need pointers to integers
   to set up the option table.  */
#define addressofint(x)	(&(x))

/* Not all C libraries have fabs, so we'll roll our own.  */
#ifdef fabs
#undef fabs
#endif
#define	fabs(x)		((x) >= 0.0 ? (x) : -(x))

/* The fixwrites program outputs this.  */
#define	Fputs(f, s)	(void) fputs (s, f)

/* Same underscore problem.  */
#define PATHMAX		PATH_MAX

#define printreal(r, n, m)  fprintreal (stdout, r, n, m)
#define	putbyte(x, f)	putc ((char) (x) & 255, f)

#define	toint(x)	((integer) (x))

/* For throwing away input from the file F.  */
#define vgetc(f)	(void) getc (f)

/* Write out elements START through END of BUF to the file F.  */
#define writechunk(f, buf, start, end) \
  (void) fwrite (&buf[start], sizeof (buf[start]), end - start + 1, f)

/* Like fseek(3), but cast the arguments and ignore the return value.  */
#define checkedfseek(f, n, w)  (void) fseek(f, (long) n, (int) w)

/* For faking arrays.  */
typedef unsigned char *pointertobyte;
#define casttobytepointer(e) ((pointertobyte) e)

/* For some initializations of constant strings.  */
typedef char *ccharpointer;

/* `real' is used for noncritical floating-point stuff.  */
typedef double real;

/* C doesn't distinguish between text files and other files.  */
typedef FILE *text, *file_ptr, *alphafile;



#define dump_file fmtfile
#define dump_path TEXFORMATPATH
#define write_out writedvi
#define out_file dvifile
#define out_buf dvibuf

/* File types.  */
typedef FILE *bytefile, *wordfile;

/* Read a line of input as quickly as possible. */
#define	inputln(stream, flag)	input_line (stream)
extern boolean input_line ();

/* This routine has to return four values.  */
#define	dateandtime(i, j, k, l)	get_date_and_time (&(i), &(j), &(k), &(l))

/* Use system calls instead of standard I/O
   to read and write the output files. */
#define	writedvi(start, end)						\
  if (write (fileno (dvifile), (char *) &dvibuf[start],			\
             (int) ((end) - (start) + 1))				\
      != (int) ((end) - (start) + 1))					\
    fprintf(stderr, "dvi file: %m\n"); exit(EXIT_FAILURE)

/* Reading and writing the dump files.  `(un)dumpthings' is called from
   the change file.*/
#define	dumpthings(base, len)						\
  do_dump ((char *) &(base), sizeof (base), (int) (len), dump_file)

#define	undumpthings(base, len)						\
  do_undump ((char *) &(base), sizeof (base), (int) (len), dump_file)

/* We define the routines to do the actual work in texmf.c.  */
extern void do_dump();
extern void do_undump();

/* Use the above for all the other dumping and undumping.  */
#define generic_dump(x) dumpthings (x, 1)
#define generic_undump(x) undumpthings (x, 1)

#define dumphh		generic_dump
#define undumphh	generic_undump

/* `dump_int' is called with constant integers, so we put them into a
   variable first.  */
#define	dumpint(x)							\
  do									\
    {									\
      integer x_val = (x);						\
      generic_dump (x_val);						\
    }									\
  while (0)

#define	undumpint	generic_undump

/* Declare routines in texmf.c.  */
extern void get_date_and_time ();
extern void topenin ();
extern void calledit ();
extern boolean input_line ();
extern boolean maketextex ();
extern boolean maketextfm ();
