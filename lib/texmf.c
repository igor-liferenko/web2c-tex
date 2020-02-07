/* `texd.h' will include `texmf.h' */
#define	EXTERN
#include "../texd.h"

#define dump_default_var TEXformatdefault
#define dump_default " plain.fmt"
#define dump_format " %s.fmt"
#define dump_ext_length 4
#define dump_default_length formatdefaultlength
#define virgin_program "virtex"
#define main_program texbody
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

  dump_default_var = dump_default;
  dump_default_length = strlen (dump_default + 1);

#ifndef INI
  if (readyalready != 314159)
    {
      program_name = strrchr (av[0], DIR_SEP);
      if (program_name == NULL)
	program_name = av[0];
      else
	program_name++;
      if (strcmp (program_name, virgin_program) != 0)
        {
          char custom_default[PATH_MAX];

          /* TeX adds the space at the end of the name.  */
          sprintf (custom_default, dump_format, program_name);
          dump_default_var = custom_default;
          dump_default_length = strlen (program_name) + dump_ext_length;
        }
    }
#endif /* not INI */

  main_program ();
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
static RETSIGTYPE catch_interrupt(int arg)
{
  interrupt = 1;
  (void) signal (SIGINT, catch_interrupt);
}

/* Besides getting the date and time here, we also set up the interrupt
   handler, for no particularly good reason.  It's just that since the
   `fix_date_and_time' routine is called early on (section 1337 in TeX,
   ``Get the first line of input and prepare to start''), this is as
   good a place as any.  */

void
get_date_and_time (minutes, day, month, year)
    integer *minutes, *day, *month, *year;
{
  time_t clock = time ((time_t *) 0);
  struct tm *tmptr = localtime (&clock);

  *minutes = tmptr->tm_hour * 60 + tmptr->tm_min;
  *day = tmptr->tm_mday;
  *month = tmptr->tm_mon + 1;
  *year = tmptr->tm_year + 1900;

  {
#ifdef SA_INTERRUPT
    /* Under SunOS 4.1.x, the default action after return from the
       signal handler is to restart the I/O if nothing has been
       transferred.  The effect on TeX is that interrupts are ignored if
       we are waiting for input.  The following tells the system to
       return EINTR from read() in this case.  From ken@cs.toronto.edu.  */

    struct sigaction a, oa;

    a.sa_handler = catch_interrupt;
    sigemptyset (&a.sa_mask);
    sigaddset (&a.sa_mask, SIGINT);
    a.sa_flags = SA_INTERRUPT;
    sigaction (SIGINT, &a, &oa);
    if (oa.sa_handler != SIG_DFL)
      sigaction (SIGINT, &oa, (struct sigaction *) 0);

#else /* no SA_INTERRUPT */
    RETSIGTYPE (*old_handler) ();
    
    old_handler = signal (SIGINT, catch_interrupt);
    if (old_handler != SIG_DFL)
      signal (SIGINT, old_handler);
#endif /* no SA_INTERRUPT */
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
static char *edit_value = EDITOR;

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

#if !defined (WORDS_BIGENDIAN) && !defined (NO_FMTBASE_SWAP) /* this fn */

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
#endif /* not WORDS_BIGENDIAN and not NO_FMTBASE_SWAP */


/* Here we write NITEMS items, each item being ITEM_SIZE bytes long.
   The pointer to the stuff to write is P, and we write to the file
   OUT_FILE.  */

void
do_dump (p, item_size, nitems, out_file)
    char *p;
    int item_size, nitems;
    FILE *out_file;
{
#if !defined (WORDS_BIGENDIAN) && !defined (NO_FMTBASE_SWAP)
  swap_items (p, nitems, item_size);
#endif

  if (fwrite (p, item_size, nitems, out_file) != nitems)
    {
      fprintf (stderr, "! Could not write %d %d-byte item(s).\n",
               nitems, item_size);
      uexit (1);
    }

  /* Have to restore the old contents of memory, since some of it might
     get used again.  */
#if !defined (WORDS_BIGENDIAN) && !defined (NO_FMTBASE_SWAP)
  swap_items (p, nitems, item_size);
#endif
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

#if !defined (WORDS_BIGENDIAN) && !defined (NO_FMTBASE_SWAP)
  swap_items (p, nitems, item_size);
#endif
}
