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
extern boolean extensionirrelevantp ();
extern boolean input_line ();
extern boolean maketextex ();
extern boolean maketextfm ();
