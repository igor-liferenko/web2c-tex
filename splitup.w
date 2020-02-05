@ @c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define FATAL_PERROR(str) do { \
  perror (str); exit (EXIT_FAILURE); } while (0)

char buffer[1024];

FILE *out, *temp;
FILE *in;

int main (void)
{
    in = stdin;

  @<Write \.{texd.h}@>@;

    if (!(out = fopen("tex.c", "w")))
	FATAL_PERROR ("tex.c");
    (void) fputs("#define EXTERN extern\n", out);
    (void) fprintf(out, "#include \"texd.h\"\n\n");


    while (fgets(buffer, sizeof(buffer), in))
	(void) fputs(buffer, out);

    return 0;
}

@ We read input line by line up to the line

\centerline{\tt \#include "coerce.h"}

and write to \.{texd.h}.

And while writing to \.{texd.h}, append \.{EXTERN} to non-preprocessor directives and non-typedefs.

@<Write \.{texd.h}@>=
    if (!(out = fopen ("texd.h", "w")))
	FATAL_PERROR ("texd.h");

    for ((void) fgets(buffer, sizeof(buffer), in); strncmp(&buffer[10], "coerce.h", 8);
         (void) fgets(buffer, sizeof(buffer), in))
      {
	if (buffer[0] == '#' || buffer[0] == '\n' || buffer[0] == '}'
	    || buffer[0] == ' ' || strncmp(buffer, "typedef", 7) == 0)
          /*nothing*/;
	else
          (void) fputs("EXTERN ", out);

	(void) fputs(buffer, out);
      }

    (void) fputs(buffer, out);
    fclose (out);
