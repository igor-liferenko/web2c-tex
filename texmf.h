#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <unistd.h>
#include <ctype.h>

typedef char schar;
typedef int boolean;
#define true 1
#define false 0

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

extern integer zround();

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


extern boolean a_open_in();
extern boolean a_open_out();
extern void a_close();
extern boolean b_open_in();
extern boolean b_open_out();
extern void b_close();
extern boolean w_open_in();
extern boolean w_open_out();
extern void w_close();

/* Other standard predefined routines.  */
#define	chr(x)		(x)
#define ord(x)		(x)
#define	odd(x)		((x) % 2)
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
extern void calledit ();
extern boolean input_line ();
