#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <unistd.h>
#include <ctype.h>

typedef double glueratio;
typedef long integer;
typedef char schar;
typedef int boolean;
#define true 1
#define false 0

extern integer zround();
extern boolean eof();
extern boolean eoln();
extern void make_c_string();
extern void make_pascal_string();
extern void null_terminate();
extern void space_terminate();
extern void uexit();
extern boolean a_open_in();
extern boolean a_open_out();
extern void a_close();
extern boolean b_open_in();
extern boolean b_open_out();
extern void b_close();
extern boolean w_open_in();
extern boolean w_open_out();
extern void w_close();

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

extern void do_dump();
extern void do_undump();

#define dumphh(x)	dumpthings(x, 1)

/* `dump_int' is called with constant integers, so we put them into a
   variable first.  */
#define	dumpint(x)							\
  do									\
    {									\
      integer x_val = (x);						\
      dumpthings(x_val, 1);						\
    }									\
  while (0)

#define undumphh(x) undumpthings(x, 1)
#define	undumpint(x) undumpthings(x, 1)

/* Declare routines in texmf.c.  */
extern void get_date_and_time ();
extern void calledit ();
extern boolean input_line ();
