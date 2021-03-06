#!/usr/bin/perl -0777 -p
use Regexp::Common;
BEGIN { $bp = $RE{balanced}{-parens=>'()'} }
s/write\s*\(([^,]+),\s*([^"]+?)\)/putc($2, $1)/g;
s/write\s*\(([^,]+),\s*"(.+?)"/Fputs($1, "$2"/g;
s/writeln\s*\(([^,]+?)\)/putc('\\n', $1)/g;
s/writeln\s*\(([^,]+?),\s*([^,]+?)\)/fprintf($1, "%s\\n", $2)/g;
s/writeln\s*\(([^,]+?),\s*([^,]+?),\s*([^,]+?)\)/fprintf($1, "%s%s\\n", $2, $3)/g;
s/writeln\s*\(([^,]+?),\s*([^,]+?),\s*([^,]+?),\s*([^,]+?)\)/fprintf($1, "%s%s%ld\\n", $2, $3, (long) $4)/g;
s/aopenin\s*\((.+?)\)/a_open_in(&($1))/g;
s/aopenout\s*\((.+?)\)/a_open_out(&($1))/g;
s/bopenin\s*\((.+?)\)/b_open_in(&($1))/g;
s/wopenin\s*\((.+?)\)/w_open_in(&($1))/g;
s/bopenout\s*\((.+?)\)/b_open_out(&($1))/g;
s/wopenout\s*\((.+?)\)/w_open_out(&($1))/g;
s/aclose\s*\((.+?)\)/a_close(&($1))/g;
s/bclose\s*\((.+?)\)/b_close(&($1))/g;
s/wclose\s*\((.+?)\)/w_close(&($1))/g;
s/\bzround\s*$bp/zround((double)$1)/g;
s/\babs\s*$bp/((integer)$1>=0?(integer)$1:(integer)-$1)/g;
s/\bodd\s*\((.+?)\)/(($1)%2)/g;
__END__

This script does the following substitutions:

write(x, y); -> putc(y, x);
write(x, "y"); -> Fputs(x, "y");
writeln(x); -> putc('\n', x);
writeln(x, y); -> fprintf(x, "%s\n", y);
writeln(x, y, z); -> fprintf(x, "%s%s\n", y, z);
writeln(x, y, z, v); -> fprintf(x, "%s%s%ld\n", y, z, (long) v);
aopenin(f) -> a_open_in(&(f))
aopenout(f) -> a_open_out(&(f))
bopenin(f) -> b_open_in(&(f))
wopenin(f) -> w_open_in(&(f))
bopenout(f) -> b_open_out(&(f))
wopenout(f) -> w_open_out(&(f))
aclose(f) -> a_close(&(f))
bclose(f) -> b_close(&(f))
wclose(f) -> w_close(&(f))
zround(x) -> zround((double) (x)) # FIXME: do we need the cast?
abs(x) -> ((integer)(x) >= 0 ? (integer)(x) : (integer)-(x)) # FIXME: do we need this?
odd(x) -> ((x) % 2)


TODO: try to change exit here to get rid of uexit (first change uexit to exit, compile and see if errors will be)
