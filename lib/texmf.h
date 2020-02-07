#include "config.h"

extern boolean aopenin();
extern boolean aopenout();
#define aclose(f) if (f) fclose(f)
extern boolean bopenin();
extern boolean bopenout();
#define bclose(f) if (f) fclose(f)
extern boolean wopenin();
#define wopenout bopenout
#define wclose(f) if (f) fclose(f)

#include "cpascal.h"

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

/* If we're running under Unix, use system calls instead of standard I/O
   to read and write the output files; also, be able to make a core dump. */ 
#ifndef unix
#define	dumpcore()	exit (1)

#define	writedvi(a, b)							\
  (void) fwrite ((char *) &dvibuf[a], sizeof (dvibuf[a]),		\
                 (int) ((b) - (a) + 1), dvifile)

#else /* unix */
#define	dumpcore	abort

#define	writedvi(start, end)						\
  if (write (fileno (dvifile), (char *) &dvibuf[start],			\
             (int) ((end) - (start) + 1))				\
      != (int) ((end) - (start) + 1))					\
    FATAL_PERROR ("dvi file")
#endif /* unix */

/* Reading and writing the dump files.  `(un)dumpthings' is called from
   the change file.*/
#define	dumpthings(base, len)						\
  do_dump ((char *) &(base), sizeof (base), (int) (len), dump_file)

#define	undumpthings(base, len)						\
  do_undump ((char *) &(base), sizeof (base), (int) (len), dump_file)

/* We define the routines to do the actual work in texmf.c.  */
extern void do_dump (), do_undump ();

/* Use the above for all the other dumping and undumping.  */
#define generic_dump(x) dumpthings (x, 1)
#define generic_undump(x) undumpthings (x, 1)

#define dumpwd		generic_dump
#define undumpwd	generic_undump
#define dumphh		generic_dump
#define undumphh	generic_undump
#define dumpqqqq   	generic_dump
#define	undumpqqqq	generic_undump

/* `dump_int' is called with constant integers, so we put them into a
   variable first.  */
#define	dumpint(x)							\
  do									\
    {									\
      integer x_val = (x);						\
      generic_dump (x_val);						\
    }									\
  while (0)

/* web2c/regfix puts variables in the format file loading into
   registers.  Some compilers aren't willing to take addresses of such
   variables.  So we must kludge.  */
#ifdef REGFIX
#define undumpint(x)							\
  do									\
    {									\
      integer x_val;							\
      generic_undump (x_val);						\
      x = x_val;							\
    }									\
  while (0)
#else
#define	undumpint	generic_undump
#endif

/* Metafont wants to write bytes to the TFM file.  The casts in these
   routines are important, since otherwise memory is clobbered in some
   strange way, which causes ``13 font metric dimensions to be
   decreased'' in the trap test, instead of 4.  */

#define bwritebyte(f, b)    putc ((char) (b), f)
#define bwrite2bytes(f, h)						\
  do									\
    {									\
      integer v = (integer) (h);					\
      putc (v >> 8, f);  putc (v & 0xff, f);				\
    }									\
  while (0)
#define bwrite4bytes(f, w)						\
  do									\
    {									\
      integer v = (integer) (w);					\
      putc (v >> 24, f); putc (v >> 16, f);				\
      putc (v >> 8, f);  putc (v & 0xff, f);				\
    }									\
  while (0)

/* Declare routines in texmf.c.  */
extern void get_date_and_time ();
extern void topenin ();
extern void calledit ();
extern boolean extensionirrelevantp ();
extern boolean input_line ();
extern void do_dump ();
extern void do_undump ();
extern boolean maketextex ();
extern boolean maketextfm ();
