/* strpascal.c: deal with C vs. Pascal strings.  */

#include "config.h"

/* Change the Pascal string P_STRING into a C string; i.e., make it
   start after the leading character Pascal puts in, and terminate it
   with a null.  */

void make_c_string(char **p_string)
{
  (*p_string)++;
  null_terminate(*p_string);
}

/* Replace the first space we come to with a null.  */

void null_terminate(char *s)
{
  while (*s != ' ') s++;
  *s = 0;
}

/* Change the C string C_STRING into a Pascal string; i.e., make it
   start one character before it does now (so C_STRING had better have
   been a Pascal string originally), and terminate with a space. */

void make_pascal_string(char **c_string)
{
  space_terminate(*c_string);
  (*c_string)--;
}


/* Replace the first null we come to with a space.  */

void space_terminate(char *s)
{
  while (*s != 0) s++;
  *s = ' ';
}
