/* ourpaths.c: path searching.  */

#include "config.h"

/* This sets up the paths, by either copying from an environment variable
   or using the default path, which is defined as a preprocessor symbol
   (with the same name as the environment variable) in `site.h'.  The
   parameter PATH_BITS is a logical or of the paths we need to set.  */

extern void
setpaths (int path_bits)
{
}

/* Look for NAME, a Pascal string, in the colon-separated list of
   directories given by `path_dirs[PATH_INDEX]'.  If the search is
   successful, leave the full pathname in NAME (which therefore must
   have enough room for such a pathname), padded with blanks.
   Otherwise, or if NAME is an absolute or relative pathname, just leave
   it alone.  */

boolean
testreadaccess (char *name, int path_index)
{
  return true;
}
