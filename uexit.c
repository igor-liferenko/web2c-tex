/* uexit.c: define uexit to do an exit with the right status.  We can't
   just call `exit' from the web files, since the webs use `exit' as a
   loop label.  */

#include <stdlib.h>

void uexit(int unix_code)
{
  exit(unix_code);
}
