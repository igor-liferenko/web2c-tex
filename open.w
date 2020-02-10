@ @c
#include <stdio.h>
@<Predeclarations of procedures@>@;
#define IS_DIR_SEP(ch) ((ch) == '/')

#define EXTERN
#include "texd.h"

/* Open an input file F, using the path PATHSPEC and passing
   FOPEN_MODE to fopen.  The filename is in `nameoffile', as a Pascal
   string. We return whether or not the open succeeded.  If it did, we
   also set `namelength' to the length of the full pathname that we
   opened.  */

boolean wopenin(FILE **f)
{
  boolean openable = false;

  if (1/*testreadaccess (nameoffile, path_index) - see commit a59a2591cb51ae028c */)
    {
      /* We can assume `nameoffile' is openable, since
         `testreadaccess' just returned true.  */
      *f = xfopen_pas (nameoffile, "rb");
      
      /* If we found the file in the current directory, don't leave the
         `./' at the beginning of `nameoffile', since it looks dumb when
         TeX says `(./foo.tex ... )', and analogously for Metafont.  */
      if (nameoffile[1] == '.' && IS_DIR_SEP (nameoffile[2]))
        {
          unsigned i = 1;
          while (nameoffile[i + 2] != ' ')
            {
              nameoffile[i] = nameoffile[i + 2];
              i++;
            }
          nameoffile[i] = ' ';
          namelength = i - 1;
        }
      else
        namelength = strchr (nameoffile + 1, ' ') - nameoffile - 1;
      
      openable = true;
    }

  return openable;
}

@ @c
boolean aopenin(FILE **f)
{
  boolean openable = false;

  if (1/*testreadaccess (nameoffile, path_index) - see commit a59a2591cb51ae028c */)
    {
      /* We can assume `nameoffile' is openable, since
         `testreadaccess' just returned true.  */
      *f = xfopen_pas (nameoffile, "r");

      /* If we found the file in the current directory, don't leave the
         `./' at the beginning of `nameoffile', since it looks dumb when
         TeX says `(./foo.tex ... )', and analogously for Metafont.  */
      if (nameoffile[1] == '.' && IS_DIR_SEP (nameoffile[2]))
        {
          unsigned i = 1;
          while (nameoffile[i + 2] != ' ')
            {
              nameoffile[i] = nameoffile[i + 2];
              i++;
            }
          nameoffile[i] = ' ';
          namelength = i - 1;
        }
      else
        namelength = strchr (nameoffile + 1, ' ') - nameoffile - 1;

      openable = true;
    }

  return openable;
}

boolean bopenin(FILE **f)
{
  boolean openable = false;

  if (1/*testreadaccess (nameoffile, path_index) - see commit a59a2591cb51ae028c */)
    {
      /* We can assume `nameoffile' is openable, since
         `testreadaccess' just returned true.  */
      *f = xfopen_pas (nameoffile, "rb");

      /* If we found the file in the current directory, don't leave the
         `./' at the beginning of `nameoffile', since it looks dumb when
         TeX says `(./foo.tex ... )', and analogously for Metafont.  */
      if (nameoffile[1] == '.' && IS_DIR_SEP (nameoffile[2]))
        {
          unsigned i = 1;
          while (nameoffile[i + 2] != ' ')
            {
              nameoffile[i] = nameoffile[i + 2];
              i++;
            }
          nameoffile[i] = ' ';
          namelength = i - 1;
        }
      else
        namelength = strchr (nameoffile + 1, ' ') - nameoffile - 1;

      /* We just opened a TFM file, we have to read the first byte,
         since TeX wants to look at it.
         See 30.564 in initex.ch for why we need this.  */
      extern integer tfmtemp;
      tfmtemp = getc(*f);

      openable = true;
    }

  return openable;
}

/* These are called by TeX or MF if an input or TFM file can't be opened.  */

boolean
maketextex ()
{
  return false;
}

boolean
maketexmf ()
{
  return false;
}

boolean
maketextfm ()
{
  return false;
}

/* Open an output file F either in the current directory or in
   $TEXMFOUTPUT/F, if the environment variable `TEXMFOUTPUT' exists.
   (Actually, this applies to the BibTeX output files, also, but
   `TEXMFBIBOUTPUT' was just too long.)  The filename is in the global
   `nameoffile', as a Pascal string.  We return whether or not the open
   succeeded.  If it did, the global `namelength' is set to the length
   of the actual filename.  */

boolean bopenout(FILE **f)
{
  unsigned temp_length;

  /* Make the filename into a C string.  */
  null_terminate (nameoffile + 1);
  
  /* Is the filename openable as given?  */
  *f = fopen (nameoffile + 1, "wb");

  /* Back into a Pascal string, but first get its length.  */
  temp_length = strlen (nameoffile + 1);
  space_terminate (nameoffile + 1);

  /* Only set `namelength' if we succeeded.  I'm not sure why.  */
  if (*f)
    namelength = temp_length;
  
  return *f != NULL;
}

boolean aopenout(FILE **f)
{
  unsigned temp_length;

  /* Make the filename into a C string.  */
  null_terminate (nameoffile + 1);

  /* Is the filename openable as given?  */
  *f = fopen (nameoffile + 1, "w");

  /* Back into a Pascal string, but first get its length.  */
  temp_length = strlen (nameoffile + 1);
  space_terminate (nameoffile + 1);

  /* Only set `namelength' if we succeeded.  I'm not sure why.  */
  if (*f)
    namelength = temp_length;

  return *f != NULL;
}


/* Test if the Pascal string BASE concatenated with the extension
   `.SUFFIX' is the same file as just BASE.  SUFFIX is a C string.  */

boolean
extensionirrelevantp (base, suffix)
    char *base;
    char *suffix;
{
  boolean ret;
  char temp[PATH_MAX];
  
  make_c_string (&base);
  strcpy (temp, base);
  strcat (temp, ".");
  strcat (temp, suffix);
  
  ret = (strcmp(base, temp) == 0);
  make_pascal_string (&base);
  
  return ret;
}

@ Open a file; don't return if any error occurs.  NAME
   should be a Pascal string; it is changed to a C string and then
   changed back.
@<Predecl...@>=
FILE *xfopen_pas(char *name, char *mode);

@ @c
FILE *xfopen_pas(char *name, char *mode)
{
  FILE *result;

  make_c_string (&name);
  result = fopen (name, mode);

  if (result != NULL)
    {
      make_pascal_string (&name);
      return result;
    }
  
  fprintf(stderr, "%s: %m\n", name);
  exit(EXIT_FAILURE);
}

#define edit_value tex_edit_value
#define edit_var "TEXEDIT"

/* For `struct tm'.  */
#include <time.h>
extern struct tm *localtime ();

/* Catch interrupts.  */
#include <signal.h>

/* What we were invoked as and with.  */
static char *program_name = NULL;
static int gargc;
char **gargv;
int argc;

/* The entry point: set up for reading the command line, which will
   happen in `topenin', then call the main body.  */
void main (int ac, char *av[])
{
  gargc = ac;
  gargv = av;

  TEXformatdefault = " plain.fmt";
  formatdefaultlength = strlen(" plain.fmt" + 1);

  char *program_name = strrchr(av[0], DIR_SEP);
  if (program_name == NULL)
    program_name = av[0];
  else
    program_name++;
/*
  if (strcmp(program_name, "virtex") == 0) {
    if (command line contains -format option) {
          char custom_default[PATH_MAX];

          /* TeX adds the space at the end of the name.  */
          sprintf (custom_default, dump_format, program_name);
          dump_default_var = custom_default;
          dump_default_length = strlen (program_name) + dump_ext_length;
    }
  }
*/

  texbody();
} 

/* This is supposed to ``open the terminal for input'', but what we
   really do is copy command line arguments into TeX's or Metafont's
   buffer, so they can handle them.  If nothing is available, or we've
   been called already (and hence, gargc==0), we return with
   `last=first'.  */
void topenin()
{
  register int i;

  buffer[first] = 0;	/* So the first `strcat' will work.  */

  if (gargc > 1)
    { /* We have command line arguments.  */
      for (i = 1; i < gargc; i++)
        {
	  (void) strcat ((char *) &buffer[first], gargv[i]);
          (void) strcat ((char *) &buffer[first], " ");
	}
      gargc = 0;	/* Don't do this again.  */
    }

  /* Find the end of the buffer.  */
  for (last = first; buffer[last]; ++last)
    ;

  /* Make `last' be one past the last non-blank non-formfeed character
     in `buffer'.  */
  for (--last; last >= first
       && ISSPACE (buffer[last]) && buffer[last] != '\f'; --last) 
    ;
  last++;

  // TODO: here we will need to convert to wide characters with mbstowcs()
  for (i = first; i < last; i++)
    buffer[i] = xord[buffer[i]];
}

/* All our interrupt handler has to do is set TeX's or Metafont's global
   variable `interrupt'; then they will do everything needed.  */
static void catch_interrupt(int arg)
{
  interrupt = 1;
  (void) signal (SIGINT, catch_interrupt);
}

/* Besides getting the date and time here, we also set up the interrupt
   handler, for no particularly good reason.  It's just that since the
   `fix_date_and_time' routine is called early on (section 1337 in TeX,
   ``Get the first line of input and prepare to start''), this is as
   good a place as any.  */
void get_date_and_time(integer *minutes, integer *day, integer *month, integer *year)
{
  time_t clock = time ((time_t *) 0);
  struct tm *tmptr = localtime (&clock);

  *minutes = tmptr->tm_hour * 60 + tmptr->tm_min;
  *day = tmptr->tm_mday;
  *month = tmptr->tm_mon + 1;
  *year = tmptr->tm_year + 1900;

  {
    struct sigaction a, oa;
    a.sa_handler = catch_interrupt;
    sigemptyset (&a.sa_mask);
    sigaddset (&a.sa_mask, SIGINT);
    a.sa_flags = 0;
    sigaction (SIGINT, &a, &oa);
    if (oa.sa_handler != SIG_DFL)
      sigaction (SIGINT, &oa, (struct sigaction *) 0);
  }
}

/* I/O for TeX and Metafont.  */

/* Read a line of input as efficiently as possible while still looking
   like Pascal.  We set `last' to `first' and return `false' if we get
   to eof.  Otherwise, we return `true' and set last = first +
   length(line except trailing whitespace).  */

boolean
input_line (f)
    FILE *f;
{
  register int i;

  last = first;

  while (last < bufsize && (i = getc (f)) != EOF && i != '\n')
    buffer[last++] = i;

  if (i == EOF && last == first)
      return false;

  /* We didn't get the whole line because our buffer was too small.  */
  if (i != EOF && i != '\n')
    {
      (void) fprintf (stderr,
                     "! Unable to read an entire line---bufsize=%d.\n",
                     bufsize);
      (void) fprintf (stderr, "Please ask a wizard to enlarge me.\n");
      uexit (1);
    }

  buffer[last] = ' ';
  if (last >= maxbufstack)
    maxbufstack = last;

  /* Trim trailing whitespace.  */
  while (last > first
         && (isblank (buffer[last - 1]) || buffer[last - 1] == '\r'))
    --last;

  for (i = first; i <= last; i++)
     buffer[i] = xord[buffer[i]];

    return true;
}

/* This string specifies what the `e' option does in response to an
   error message.  */ 
static char *edit_value = "em %s %d";

/* This procedure is due to sjc@s1-c.  TeX (or Metafont) calls it when
   the user types `e' in response to an error, invoking a text editor on
   the erroneous source file.  FNSTART is how far into FILENAME the
   actual filename starts; FNLENGTH is how long the filename is.
   
   See ../site.h for how to set the default, and how to override it.  */

void
calledit (filename, fnstart, fnlength, linenumber)
    ASCIIcode *filename;
    poolpointer fnstart;
    integer fnlength, linenumber;
{
  char *temp, *command;
  char c;
  int sdone, ddone, i;

  sdone = ddone = 0;
  filename += fnstart;

  /* Close any open input files, since we're going to kill the job.  */
  for (i = 1; i <= inopen; i++)
    (void) fclose (inputfile[i]);

  /* Replace the default with the value of the appropriate environment
     variable, if it's set.  */
  temp = getenv (edit_var);
  if (temp != NULL)
    edit_value = temp;

  /* Construct the command string.  The `11' is the maximum length an
     integer might be.  */
  if (NULL == (command = (char*) malloc(strlen(edit_value) + fnlength + 11))) exit(1);

  /* So we can construct it as we go.  */
  temp = command;

  while ((c = *edit_value++) != 0)
    {
      if (c == '%')
        {
          switch (c = *edit_value++)
            {
	    case 'd':
	      if (ddone)
                {
		  (void) fprintf (stderr,
                           "! `%%d' cannot appear twice in editor command.\n");
	          uexit (1);
		}
              (void) sprintf (temp, "%d", linenumber);
              while (*temp != '\0')
                temp++;
              ddone = 1;
              break;

	    case 's':
              if (sdone)
                {
	          (void) fprintf(stderr,
                           "! `%%s' cannot appear twice in editor command.\n");
		  uexit (1);
		}
              for (i =0; i < fnlength; i++)
		*temp++ = xchr[filename[i]]; // TODO: maybe here mbstowcs() is needed
              sdone = 1;
              break;

	    case '\0':
              *temp++ = '%';
              /* Back up to the null to force termination.  */
	      edit_value--;
	      break;

	    default:
	      *temp++ = '%';
	      *temp++ = c;
	      break;
	    }
	}
      else
	*temp++ = c;
    }

  *temp = 0;

  /* Execute the command.  */
  if (system (command) != 0)
    fprintf (stderr, "! Trouble executing `%s'.\n", command);

  /* Quit, since we found an error.  */
  uexit (1);
}

/* Read and write format (for TeX) or base (for Metafont) files.  In
   tex.web, these files are architecture dependent; specifically,
   BigEndian and LittleEndian architectures produce different files.
   These routines always output BigEndian files.  This still does not
   make the dump files architecture-independent, because it is possible
   to make a format file that dumps a glue ratio, i.e., a floating-point
   number.  Fortunately, none of the standard formats do that.  */

/* This macro is always invoked as a statement.  It assumes a variable
   `temp'.  */
   
#define SWAP(x, y) temp = (x); (x) = (y); (y) = temp;


/* Make the NITEMS items pointed at by P, each of size SIZE, be the
   opposite-endianness of whatever they are now.  */

static void
swap_items (p, nitems, size)
  char *p;
  int nitems;
  int size;
{
  char temp;

  /* Since `size' does not change, we can write a while loop for each
     case, and avoid testing `size' for each time.  */
  switch (size)
    {
    /* 16-byte items happen on the DEC Alpha machine when we are not
       doing sharable memory dumps.  */
    case 16:
      while (nitems--)
        {
          SWAP (p[0], p[15]);
          SWAP (p[1], p[14]);
          SWAP (p[2], p[13]);
          SWAP (p[3], p[12]);
          SWAP (p[4], p[11]);
          SWAP (p[5], p[10]);
          SWAP (p[6], p[9]);
          SWAP (p[7], p[8]);
          p += size;
        }
      break;

    case 8:
      while (nitems--)
        {
          SWAP (p[0], p[7]);
          SWAP (p[1], p[6]);
          SWAP (p[2], p[5]);
          SWAP (p[3], p[4]);
          p += size;
        }
      break;

    case 4:
      while (nitems--)
        {
          SWAP (p[0], p[3]);
          SWAP (p[1], p[2]);
          p += size;
        }
      break;

    case 2:
      while (nitems--)
        {
          SWAP (p[0], p[1]);
          p += size;
        }
      break;

    case 1:
      /* Nothing to do.  */
      break;

    default:
      fprintf (stderr, "! I can't (un)dump a %d byte item.\n", size);
      uexit (1);
  }
}

/* Here we write NITEMS items, each item being ITEM_SIZE bytes long.
   The pointer to the stuff to write is P, and we write to the file
   OUT_FILE.  */
void do_dump(char *p, int item_size, int nitems, FILE *out_file)
{
  swap_items (p, nitems, item_size);

  if (fwrite (p, item_size, nitems, out_file) != nitems)
    {
      fprintf (stderr, "! Could not write %d %d-byte item(s).\n",
               nitems, item_size);
      uexit (1);
    }

  /* Have to restore the old contents of memory, since some of it might
     get used again.  */
  swap_items (p, nitems, item_size);
}


/* Here is the dual of the writing routine.  */

void
do_undump (p, item_size, nitems, in_file)
    char *p;
    int item_size, nitems;
    FILE *in_file;
{
  if (fread (p, item_size, nitems, in_file) != nitems)
    {
      fprintf (stderr, "! Could not read %d %d-byte item(s).\n",
               nitems, item_size);
      uexit (1);
    }

  swap_items (p, nitems, item_size);
}

/* eofeoln.c: implement Pascal's ideas for end-of-file and end-of-line
   testing.  */

/* Return true if we're at the end of FILE, else false.  This implements
   Pascal's `eof' builtin.  */

boolean
eof (file)
  FILE *file;
{
  register int c;

  /* Maybe we're already at the end?  */
  if (feof (file))
    return true;

  if ((c = getc (file)) == EOF)
    return true;

  /* We weren't at the end.  Back up.  */
  (void) ungetc (c, file);

  return false;
}


/* Return true on end-of-line in FILE or at the end of FILE, else false.  */

boolean
eoln (file)
  FILE *file;
{
  register int c;

  if (feof (file))
    return true;
  
  c = getc (file);
  
  if (c != EOF)
    (void) ungetc (c, file);
    
  return c == '\n' || c == EOF;
}

/* zround.c: round R to the nearest whole number.  */

integer
zround (r)
    double r;
{
  integer i;

  /* R can be outside the range of an integer if glue is stretching or
     shrinking a lot.  We can't do any better than returning the largest
     or smallest integer possible in that case.  It doesn't seem to make
     any practical difference.  Here is a sample input file which
     demonstrates the problem, from phil@cs.arizona.edu:
     	\documentstyle{article}
	\begin{document}
	\begin{flushleft}
	$\hbox{} $\hfill 
	\filbreak
	\eject
  */
  if (r > INTEGER_MAX)
    i = INTEGER_MAX;
  else if (r < INTEGER_MIN)
    i = INTEGER_MIN;
  else if (r >= 0.0)
    i = r + 0.5;
  else
    i = r - 0.5;

  return i;
}
