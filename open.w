@ @c
#include <stdio.h>
@<Predeclarations of procedures@>@;
#define IS_DIR_SEP(ch) ((ch) == '/')

#define EXTERN extern
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
  
  FATAL_PERROR (name);
  return NULL; /* Stop compiler warnings.  */
}
