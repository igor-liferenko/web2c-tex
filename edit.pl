#!/usr/bin/perl -0777 -p
s/write\s*\(([^,]+),\s*([^"]+?)\)/putc($2, $1)/g;
s/write\s*\(([^,]+),\s*"(.+?)"/Fputs($1, "$2"/g;
s/writeln\s*\(([^,]+?)\)/putc('\\n', $1)/g;
s/writeln\s*\(([^,]+?),\s*([^,]+?)\)/fprintf($1, "%s\\n", $2)/g;
s/writeln\s*\(([^,]+?),\s*([^,]+?),\s*([^,]+?)\)/fprintf($1, "%s%s\\n", $2, $3)/g;
s/writeln\s*\(([^,]+?),\s*([^,]+?),\s*([^,]+?),\s*([^,]+?)\)/fprintf($1, "%s%s%ld\\n", $2, $3, (long) $4)/g;
s/aopenin\s*\((.+?)\)/aopenin(&($1))/g;
s/aopenout\s*\((.+?)\)/aopenout(&($1))/g;
s/bopenin\s*\((.+?)\)/bopenin(&($1))/g;
__END__

This script does the following substitutions:

write(x, y); -> putc(y, x);
write(x, "y"); -> Fputs(x, "y");
writeln(x); -> putc('\n', x);
writeln(x, y); -> fprintf(x, "%s\n", y);
writeln(x, y, z); -> fprintf(x, "%s%s\n", y, z);
writeln(x, y, z, v); -> fprintf(x, "%s%s%ld\n", y, z, (long) v);
aopenin(f) -> aopenin(&(f))
aopenout(f) -> aopenout(&(f))
bopenin(f) -> bopenin(&(f))
