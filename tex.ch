@x [0.0] l.83 - WEAVE: print changes only.
  \def\?##1]{\hbox to 1in{\hfil##1.\ }}
  }
@y 83
  \def\?##1]{\hbox{Changes to \hbox to 1em{\hfil##1}.\ }}
  }
\let\maybe=\iffalse
@z

@x [1.4] l.233 - program header
Actually the heading shown here is not quite normal: The |program| line
does not mention any |output| file, because \ph\ would ask the \TeX\ user
to specify a file name if |output| were specified here.
@:PASCAL H}{\ph@>
@^system dependencies@>
@y
@z

@x [1.4] l.243 - labels in outer block not needed
program TEX; {all file names are defined dynamically}
label @<Labels in the outer block@>@/
@y
program TEX; {all file names are defined dynamically}
@z

@x [1.6] l.267 - labels in outer block not needed
@ Three labels must be declared in the main program, so we give them
symbolic names.

@d start_of_TEX=1 {go here when \TeX's variables are initialized}
@d end_of_TEX=9998 {go here to close files and terminate gracefully}
@d final_end=9999 {this label marks the ending of the program}

@<Labels in the out...@>=
start_of_TEX@t\hskip-2pt@>, end_of_TEX@t\hskip-2pt@>,@,final_end;
  {key control points}
@y
@ For Web2c, labels are not declared in the main program, but
we still have to declare the symbolic names.

@d start_of_TEX=1 {go here when \TeX's variables are initialized}
@d final_end=9999 {this label marks the ending of the program}
@z

@x [1.11] l.375 - Compile-time constants: most removed for dynamic allocation.
@<Constants...@>=
@!mem_max=30000; {greatest index in \TeX's internal |mem| array;
  must be strictly less than |max_halfword|;
  must be equal to |mem_top| in \.{INITEX}, otherwise |>=mem_top|}
@!mem_min=0; {smallest index in \TeX's internal |mem| array;
  must be |min_halfword| or more;
  must be equal to |mem_bot| in \.{INITEX}, otherwise |<=mem_bot|}
@!buf_size=500; {maximum number of characters simultaneously present in
  current lines of open files and in control sequences between
  \.{\\csname} and \.{\\endcsname}; must not exceed |max_halfword|}
@!error_line=72; {width of context lines on terminal error messages}
@!half_error_line=42; {width of first lines of contexts in terminal
  error messages; should be between 30 and |error_line-15|}
@!max_print_line=79; {width of longest text lines output; should be at least 60}
@!stack_size=200; {maximum number of simultaneous input sources}
@!max_in_open=6; {maximum number of input files and error insertions that
  can be going on simultaneously}
@!font_max=75; {maximum internal font number; must not exceed |max_quarterword|
  and must be at most |font_base+256|}
@!font_mem_size=20000; {number of words of |font_info| for all fonts}
@!param_size=60; {maximum number of simultaneous macro parameters}
@!nest_size=40; {maximum number of semantic levels simultaneously active}
@!max_strings=3000; {maximum number of strings; must not exceed |max_halfword|}
@!string_vacancies=8000; {the minimum number of characters that should be
  available for the user's control sequences and font names,
  after \TeX's own error messages are stored}
@!pool_size=32000; {maximum number of characters in strings, including all
  error messages and help texts, and the names of all fonts and
  control sequences; must exceed |string_vacancies| by the total
  length of \TeX's own strings, which is currently about 23000}
@!save_size=600; {space for saving values outside of current group; must be
  at most |max_halfword|}
@!trie_size=8000; {space for hyphenation patterns; should be larger for
  \.{INITEX} than it is in production versions of \TeX}
@!trie_op_size=500; {space for ``opcodes'' in the hyphenation patterns}
@!dvi_buf_size=800; {size of the output buffer; must be a multiple of 8}
@!file_name_size=40; {file names shouldn't be longer than this}
@!pool_name='TeXformats:TEX.POOL                     ';
  {string of length |file_name_size|; tells where the string pool appears}
@y
@d file_name_size == maxint
@d ssup_error_line = 255
@d ssup_max_strings == 2097151
{Larger values than 65536 cause the arrays to consume much more memory.}
@d ssup_trie_opcode == 65535
@d ssup_trie_size == @"3FFFFF

@d ssup_hyph_size == 65535 {Changing this requires changing (un)dumping!}
@d iinf_hyphen_size == 610 {Must be not less than |hyph_prime|!}

@d max_font_max=9000 {maximum number of internal fonts; this can be
                      increased, but |hash_size+max_font_max|
                      should not exceed 29000.}
@d font_base=0 {smallest internal font number; must be
                |>= min_quarterword|; do not change this without
                modifying the dynamic definition of the font arrays.}


@<Constants...@>=
@!hash_offset=514; {smallest index in hash array, i.e., |hash_base| }
  {Use |hash_offset=0| for compilers which cannot decrement pointers.}
@!trie_op_size=35111; {space for ``opcodes'' in the hyphenation patterns;
  best if relatively prime to 313, 361, and 1009.}
@!neg_trie_op_size=-35111; {for lower |trie_op_hash| array bound;
  must be equal to |-trie_op_size|.}
@!min_trie_op=0; {first possible trie op code for any language}
@!max_trie_op=ssup_trie_opcode; {largest possible trie opcode for any language}
@!pool_name=TEXMF_POOL_NAME; {this is configurable, for the sake of ML-\TeX}
  {string of length |file_name_size|; tells where the string pool appears}
@!engine_name=TEXMF_ENGINE_NAME; {the name of this engine}
@#
@!inf_mem_bot = 0;
@!sup_mem_bot = 1;

@!inf_main_memory = 3000;
@!sup_main_memory = 256000000;

@!inf_trie_size = 8000;
@!sup_trie_size = ssup_trie_size;

@!inf_max_strings = 3000;
@!sup_max_strings = ssup_max_strings;
@!inf_strings_free = 100;
@!sup_strings_free = sup_max_strings;

@!inf_buf_size = 500;
@!sup_buf_size = 30000000;

@!inf_nest_size = 40;
@!sup_nest_size = 4000;

@!inf_max_in_open = 6;
@!sup_max_in_open = 127;

@!inf_param_size = 60;
@!sup_param_size = 32767;

@!inf_save_size = 600;
@!sup_save_size = 80000;

@!inf_stack_size = 200;
@!sup_stack_size = 30000;

@!inf_dvi_buf_size = 800;
@!sup_dvi_buf_size = 65536;

@!inf_font_mem_size = 20000;
@!sup_font_mem_size = 147483647; {|integer|-limited, so 2 could be prepended?}

@!sup_font_max = max_font_max;
@!inf_font_max = 50; {could be smaller, but why?}

@!inf_pool_size = 32000;
@!sup_pool_size = 40000000;
@!inf_pool_free = 1000;
@!sup_pool_free = sup_pool_size;
@!inf_string_vacancies = 8000;
@!sup_string_vacancies = sup_pool_size - 23000;

@!sup_hash_extra = sup_max_strings;
@!inf_hash_extra = 0;

@!sup_hyph_size = ssup_hyph_size;
@!inf_hyph_size = iinf_hyphen_size; {Must be not less than |hyph_prime|!}

@!inf_expand_depth = 10;
@!sup_expand_depth = 10000000;
@z

@x [1.12] l.427 - Constants that are WEB numeric macros.
@d mem_bot=0 {smallest index in the |mem| array dumped by \.{INITEX};
  must not be less than |mem_min|}
@d mem_top==30000 {largest index in the |mem| array dumped by \.{INITEX};
  must be substantially larger than |mem_bot|
  and not greater than |mem_max|}
@d font_base=0 {smallest internal font number; must not be less
  than |min_quarterword|}
@d hash_size=2100 {maximum number of control sequences; it should be at most
  about |(mem_max-mem_min)/10|}
@d hash_prime=1777 {a prime number equal to about 85\pct! of |hash_size|}
@d hyph_size=307 {another prime; the number of \.{\\hyphenation} exceptions}
@y
@d hash_size=15000 {maximum number of control sequences; it should be at most
  about |(mem_max-mem_min)/10|; see also |font_max|}
@d hash_prime=8501 {a prime number equal to about 85\pct! of |hash_size|}
@d hyph_prime=607 {another prime for hashing \.{\\hyphenation} exceptions;
                if you change this, you should also change |iinf_hyphen_size|.}
@z

@x [1.16] l.498 - Use C macros for `incr' and `decr'.
@d incr(#) == #:=#+1 {increase a variable by unity}
@d decr(#) == #:=#-1 {decrease a variable by unity}
@y
@z

% The text_char type is used as an array index into xord.  The
% default type `char' produces signed integers, which are bad array
% indices in C.
@x [2.19] l.565 - data type text_char is 8-bit ASCII_code
@d text_char == char {the data type of characters in text files}
@y
@d text_char == ASCII_code {the data type of characters in text files}
@z

@x [2.20] l.579 - printable characters
@!xchr: array [ASCII_code] of text_char;
  {specifies conversion of output characters}
@y
xchr: array [ASCII_code] of text_char;
   { specifies conversion of output characters }
xprn: array [ASCII_code] of ASCII_code;
   { non zero iff character is printable }
@z

@x [3.27] l.794 - Do file opening in C.
@ The \ph\ compiler with which the present version of \TeX\ was prepared has
extended the rules of \PASCAL\ in a very convenient way. To open file~|f|,
we can write
$$\vbox{\halign{#\hfil\qquad&#\hfil\cr
|reset(f,@t\\{name}@>,'/O')|&for input;\cr
|rewrite(f,@t\\{name}@>,'/O')|&for output.\cr}}$$
The `\\{name}' parameter, which is of type `{\bf packed array
$[\langle\\{any}\rangle]$ of \\{char}}', stands for the name of
the external file that is being opened for input or output.
Blank spaces that might appear in \\{name} are ignored.

The `\.{/O}' parameter tells the operating system not to issue its own
error messages if something goes wrong. If a file of the specified name
cannot be found, or if such a file cannot be opened for some other reason
(e.g., someone may already be trying to write the same file), we will have
|@!erstat(f)<>0| after an unsuccessful |reset| or |rewrite|.  This allows
\TeX\ to undertake appropriate corrective action.
@:PASCAL H}{\ph@>
@^system dependencies@>

\TeX's file-opening procedures return |false| if no file identified by
|name_of_file| could be opened.

@d reset_OK(#)==erstat(#)=0
@d rewrite_OK(#)==erstat(#)=0

@p function a_open_in(var f:alpha_file):boolean;
  {open a text file for input}
begin reset(f,name_of_file,'/O'); a_open_in:=reset_OK(f);
end;
@#
function a_open_out(var f:alpha_file):boolean;
  {open a text file for output}
begin rewrite(f,name_of_file,'/O'); a_open_out:=rewrite_OK(f);
end;
@#
function b_open_in(var f:byte_file):boolean;
  {open a binary file for input}
begin reset(f,name_of_file,'/O'); b_open_in:=reset_OK(f);
end;
@#
function b_open_out(var f:byte_file):boolean;
  {open a binary file for output}
begin rewrite(f,name_of_file,'/O'); b_open_out:=rewrite_OK(f);
end;
@#
function w_open_in(var f:word_file):boolean;
  {open a word file for input}
begin reset(f,name_of_file,'/O'); w_open_in:=reset_OK(f);
end;
@#
function w_open_out(var f:word_file):boolean;
  {open a word file for output}
begin rewrite(f,name_of_file,'/O'); w_open_out:=rewrite_OK(f);
end;
@y
@ All of the file opening functions are defined in C.
@z

@x [3.28] l.850 - Do file closing in C.
@ Files can be closed with the \ph\ routine `|close(f)|', which
@:PASCAL H}{\ph@>
@^system dependencies@>
should be used when all input or output with respect to |f| has been completed.
This makes |f| available to be opened again, if desired; and if |f| was used for
output, the |close| operation makes the corresponding external file appear
on the user's area, ready to be read.

These procedures should not generate error messages if a file is
being closed before it has been successfully opened.

@p procedure a_close(var f:alpha_file); {close a text file}
begin close(f);
end;
@#
procedure b_close(var f:byte_file); {close a binary file}
begin close(f);
end;
@#
procedure w_close(var f:word_file); {close a word file}
begin close(f);
end;
@y
@ And all the file closing routines as well.
@z

@x [3.30] l.888 - Array size of input buffer is determined at runtime.
@!buffer:array[0..buf_size] of ASCII_code; {lines of characters being read}
@y
@!buffer:^ASCII_code; {lines of characters being read}
@z

@x [3.31] l.933 - Do `input_ln' in C.
@p function input_ln(var f:alpha_file;@!bypass_eoln:boolean):boolean;
  {inputs the next line or returns |false|}
var last_nonblank:0..buf_size; {|last| with trailing blanks removed}
begin if bypass_eoln then if not eof(f) then get(f);
  {input the first character of the line into |f^|}
last:=first; {cf.\ Matthew 19\thinspace:\thinspace30}
if eof(f) then input_ln:=false
else  begin last_nonblank:=first;
  while not eoln(f) do
    begin if last>=max_buf_stack then
      begin max_buf_stack:=last+1;
      if max_buf_stack=buf_size then
        @<Report overflow of the input buffer, and abort@>;
      end;
    buffer[last]:=xord[f^]; get(f); incr(last);
    if buffer[last-1]<>" " then last_nonblank:=last;
    end;
  last:=last_nonblank; input_ln:=true;
  end;
end;
@y
We define |input_ln| in C, for efficiency.
@z

% [3.32] `term_in' and `term_out' are standard input and output.
% Declare the variables that used to be constants.
@x [3.32] l.961 - `term_in' and `term_out' are standard input and output.
@<Glob...@>=
@!term_in:alpha_file; {the terminal as an input file}
@!term_out:alpha_file; {the terminal as an output file}
@y
@d term_in==stdin {the terminal as an input file}
@d term_out==stdout {the terminal as an output file}

@<Glob...@>=
@!init
@!ini_version:boolean; {are we \.{INITEX}?}
@!dump_option:boolean; {was the dump name option used?}
@!dump_line:boolean; {was a \.{\%\AM format} line seen?}
tini@/
@#
@!dump_name:const_cstring; {format name for terminal display}
@#
@!bound_default:integer; {temporary for setup}
@!bound_name:const_cstring; {temporary for setup}
@#
@!mem_bot:integer;{smallest index in the |mem| array dumped by \.{INITEX};
  must not be less than |mem_min|}
@!main_memory:integer; {total memory words allocated in initex}
@!extra_mem_bot:integer; {|mem_min:=mem_bot-extra_mem_bot| except in \.{INITEX}}
@!mem_min:integer; {smallest index in \TeX's internal |mem| array;
  must be |min_halfword| or more;
  must be equal to |mem_bot| in \.{INITEX}, otherwise |<=mem_bot|}
@!mem_top:integer; {largest index in the |mem| array dumped by \.{INITEX};
  must be substantially larger than |mem_bot|,
  equal to |mem_max| in \.{INITEX}, else not greater than |mem_max|}
@!extra_mem_top:integer; {|mem_max:=mem_top+extra_mem_top| except in \.{INITEX}}
@!mem_max:integer; {greatest index in \TeX's internal |mem| array;
  must be strictly less than |max_halfword|;
  must be equal to |mem_top| in \.{INITEX}, otherwise |>=mem_top|}
@!error_line:integer; {width of context lines on terminal error messages}
@!half_error_line:integer; {width of first lines of contexts in terminal
  error messages; should be between 30 and |error_line-15|}
@!max_print_line:integer;
  {width of longest text lines output; should be at least 60}
@!max_strings:integer; {maximum number of strings; must not exceed |max_halfword|}
@!strings_free:integer; {strings available after format loaded}
@!string_vacancies:integer; {the minimum number of characters that should be
  available for the user's control sequences and font names,
  after \TeX's own error messages are stored}
@!pool_size:integer; {maximum number of characters in strings, including all
  error messages and help texts, and the names of all fonts and
  control sequences; must exceed |string_vacancies| by the total
  length of \TeX's own strings, which is currently about 23000}
@!pool_free:integer;{pool space free after format loaded}
@!font_mem_size:integer; {number of words of |font_info| for all fonts}
@!font_max:integer; {maximum internal font number; ok to exceed |max_quarterword|
  and must be at most |font_base|+|max_font_max|}
@!font_k:integer; {loop variable for initialization}
@!hyph_size:integer; {maximun number of hyphen exceptions}
@!trie_size:integer; {space for hyphenation patterns; should be larger for
  \.{INITEX} than it is in production versions of \TeX.  50000 is
  needed for English, German, and Portuguese.}
@!buf_size:integer; {maximum number of characters simultaneously present in
  current lines of open files and in control sequences between
  \.{\\csname} and \.{\\endcsname}; must not exceed |max_halfword|}
@!stack_size:integer; {maximum number of simultaneous input sources}
@!max_in_open:integer; {maximum number of input files and error insertions that
  can be going on simultaneously}
@!param_size:integer; {maximum number of simultaneous macro parameters}
@!nest_size:integer; {maximum number of semantic levels simultaneously active}
@!save_size:integer; {space for saving values outside of current group; must be
  at most |max_halfword|}
@!dvi_buf_size:integer; {size of the output buffer; must be a multiple of 8}
@!expand_depth:integer; {limits recursive calls to the |expand| procedure}
@!eight_bit_p:cinttype; {make all characters printable by default}
@!quoted_filename:boolean; {current filename is quoted}
@z

@x [3.33] l.964 - We don't need to open terminal files.
@ Here is how to open the terminal files
in \ph. The `\.{/I}' switch suppresses the first |get|.
@:PASCAL H}{\ph@>
@^system dependencies@>

@d t_open_in==reset(term_in,'TTY:','/O/I') {open the terminal for text input}
@d t_open_out==rewrite(term_out,'TTY:','/O') {open the terminal for text output}
@y
@ Here is how to open the terminal files.  |t_open_out| does nothing.
|t_open_in|, on the other hand, does the work of ``rescanning,'' or getting
any command line arguments the user has provided.  It's defined in C.

@d t_open_out == {output already open for text output}
@z

@x [3.34] l.982 - Flushing output to terminal files.
these operations can be specified in \ph:
@:PASCAL H}{\ph@>
@^system dependencies@>

@d update_terminal == break(term_out) {empty the terminal output buffer}
@d clear_terminal == break_in(term_in,true) {clear the terminal input buffer}
@y
these operations can be specified with {\mc UNIX}.  |update_terminal|
does an |fflush|. |clear_terminal| is redefined
to do nothing, since the user should control the terminal.
@^system dependencies@>

@d update_terminal == fflush (term_out)
@d clear_terminal == do_nothing
@z

@x used in input_ln, which is implemented in C for efficiency
@ We need a special routine to read the first line of \TeX\ input from
the user's terminal. This line is different because it is read before we
have opened the transcript file; there is sort of a ``chicken and
egg'' problem here. If the user types `\.{\\input paper}' on the first
line, or if some macro invoked by that line does such an \.{\\input},
the transcript file will be named `\.{paper.log}'; but if no \.{\\input}
commands are performed during the first line of terminal input, the transcript
file will acquire its default name `\.{texput.log}'. (The transcript file
will not contain error messages generated by the first line before the
first \.{\\input} command.)
@.texput@>

The first line is even more special if we are lucky enough to have an operating
system that treats \TeX\ differently from a run-of-the-mill \PASCAL\ object
program. It's nice to let the user start running a \TeX\ job by typing
a command line like `\.{tex paper}'; in such a case, \TeX\ will operate
as if the first line of input were `\.{paper}', i.e., the first line will
consist of the remainder of the command line, after the part that invoked
\TeX.

The first line is special also because it may be read before \TeX\ has
input a format file. In such cases, normal error messages cannot yet
be given. The following code uses concepts that will be explained later.
(If the \PASCAL\ compiler does not support non-local |@!goto|\unskip, the
@^system dependencies@>
statement `|goto final_end|' should be replaced by something that
quietly terminates the program.)

@<Report overflow of the input buffer, and abort@>=
if format_ident=0 then
  begin write_ln(term_out,'Buffer size exceeded!'); goto final_end;
@.Buffer size exceeded@>
  end
else begin cur_input.loc_field:=first; cur_input.limit_field:=last-1;
  overflow("buffer size",buf_size);
@:TeX capacity exceeded buffer size}{\quad buffer size@>
  end

@y
@z

@x [3.37] l.1055 - |init_terminal|, reading the command line.
@ The following program does the required initialization
without retrieving a possible command line.
It should be clear how to modify this routine to deal with command lines,
if the system permits them.
@^system dependencies@>

@p function init_terminal:boolean; {gets the terminal input started}
label exit;
begin t_open_in;
@y
@ The following program does the required initialization.
Iff anything has been specified on the command line, then |t_open_in|
will return with |last > first|.
@^system dependencies@>

@p function init_terminal:boolean; {gets the terminal input started}
label exit;
begin t_open_in;
if last > first then
  begin loc := first;
  while (loc < last) and (buffer[loc]=' ') do incr(loc);
  if loc < last then
    begin init_terminal := true; goto exit;
    end;
  end;
@z

@x [3.37] l.1068 - |init_terminal|, output missing newline.
    write(term_out,'! End of file on the terminal... why?');
@y
    write_ln(term_out,'! End of file on the terminal... why?');
@z

@x [4.39] l.1131 - Dynamically size pool arrays.
@!str_pool:packed array[pool_pointer] of packed_ASCII_code; {the characters}
@!str_start : array[str_number] of pool_pointer; {the starting pointers}
@y
@!str_pool: ^packed_ASCII_code; {the characters}
@!str_start : ^pool_pointer; {the starting pointers}
@z

@x [4.47] l.1237 - string recycling
@p @!init function get_strings_started:boolean; {initializes the string pool,
@y
@p @t\4@>@<Declare additional routines for string recycling@>@/

@!init function get_strings_started:boolean; {initializes the string pool,
@z

% [4.51] Open the pool file using a path, and can't do string
% assignments directly.  (`strcpy' and `strlen' work here because
% `pool_name' is a constant string, and thus ends in a null and doesn't
% start with a space.)
@x [4.51] l.1314 - Open the pool file.
name_of_file:=pool_name; {we needn't set |name_length|}
if a_open_in(pool_file) then
@y
name_length := strlen (pool_name);
name_of_file := xmalloc_array (ASCII_code, name_length + 1);
strcpy (stringcast(name_of_file+1), pool_name); {copy the string}
if a_open_in (pool_file, kpse_texpool_format) then
@z

@x [4.52] l.1326 - Make `TEX.POOL' lowercase, and change how it's read.
begin if eof(pool_file) then bad_pool('! TEX.POOL has no check sum.');
@.TEX.POOL has no check sum@>
read(pool_file,m,n); {read two digits of string length}
@y
begin if eof(pool_file) then bad_pool('! ', pool_name, ' has no check sum.');
@.TEX.POOL has no check sum@>
read(pool_file,m); read(pool_file,n); {read two digits of string length}
@z

@x [6.73] l.1732 - Add unspecified_mode.
@d error_stop_mode=3 {stops at every opportunity to interact}
@y
@d error_stop_mode=3 {stops at every opportunity to interact}
@d unspecified_mode=4 {extra value for command-line switch}
@z

% [6.81] Eliminate nonlocal goto, since C doesn't have them.
% Plus, it's nicer just to do an exit with the appropriate status code
% under Unix.  We call it `uexit' because there's a WEB symbol called
% `exit' already.  We use a C macro to change `uexit' back to `exit'.
@x [6.81] l.1852 - Eliminate nonlocal goto, since C doesn't have them.
@<Error hand...@>=
procedure jump_out;
begin goto end_of_TEX;
end;
@y
@d do_final_end==begin
   update_terminal;
   ready_already:=0;
   if (history <> spotless) and (history <> warning_issued) then
       uexit(1)
   else
       uexit(0);
   end

@<Error hand...@>=
noreturn procedure jump_out;
begin
close_files_and_terminate;
do_final_end;
end;
@z

@x [6.84] l.1888 - Implement the switch-to-editor option.
line ready to be edited. But such an extension requires some system
wizardry, so the present implementation simply types out the name of the
file that should be
edited and the relevant line number.
@^system dependencies@>

There is a secret `\.D' option available when the debugging routines haven't
been commented~out.
@^debugging@>
@y
line ready to be edited.
We do this by calling the external procedure |call_edit| with a pointer to
the filename, its length, and the line number.
However, here we just set up the variables that will be used as arguments,
since we don't want to do the switch-to-editor until after TeX has closed
its files.
@^system dependencies@>

There is a secret `\.D' option available when the debugging routines haven't
been commented~out.
@^debugging@>
@d edit_file==input_stack[base_ptr]
@z

@x [7.104] l.2227 - avoid name conflicts with lib routine remainder()
|remainder|, holds the remainder after a division.

@<Glob...@>=
@y
|remainder|, holds the remainder after a division.

@d remainder==tex_remainder

@<Glob...@>=
@z

@x [8.110] l.2422 - increase |max_halfword|
@d min_halfword==0 {smallest allowable value in a |halfword|}
@d max_halfword==65535 {largest allowable value in a |halfword|}
@y 2424
@d min_halfword==-@"FFFFFFF {smallest allowable value in a |halfword|}
@d max_halfword==@"FFFFFFF {largest allowable value in a |halfword|}
@z

@x [8.111] l.2437 - max_font_max
if (font_base<min_quarterword)or(font_max>max_quarterword) then bad:=15;
if font_max>font_base+256 then bad:=16;
@y
if (max_font_max<min_halfword)or(max_font_max>max_halfword) then bad:=15;
if font_max>font_base+max_font_max then bad:=16;
@z

@x [8.113] l.2453 - data structures for main memory
@!quarterword = min_quarterword..max_quarterword; {1/4 of a word}
@!halfword=min_halfword..max_halfword; {1/2 of a word}
@!two_choices = 1..2; {used when there are two variants in a record}
@!four_choices = 1..4; {used when there are four variants in a record}
@!two_halves = packed record@;@/
  @!rh:halfword;
  case two_choices of
  1: (@!lh:halfword);
  2: (@!b0:quarterword; @!b1:quarterword);
  end;
@!four_quarters = packed record@;@/
  @!b0:quarterword;
  @!b1:quarterword;
  @!b2:quarterword;
  @!b3:quarterword;
  end;
@!memory_word = record@;@/
  case four_choices of
  1: (@!int:integer);
  2: (@!gr:glue_ratio);
  3: (@!hh:two_halves);
  4: (@!qqqq:four_quarters);
  end;
@y
@!quarterword = min_quarterword..max_quarterword;
@!halfword = min_halfword..max_halfword;
@!two_choices = 1..2; {used when there are two variants in a record}
@!four_choices = 1..4; {used when there are four variants in a record}
@=#include "texmfmem.h";@>
@z

% [9.116] Change `mem' to `zmem', so we can define mem to be a register
% pointer to the memory array for speed.
@x [9.116] l.2545 - definition of main memory array
@!mem : array[mem_min..mem_max] of memory_word; {the big dynamic storage area}
@y
@!yzmem : ^memory_word; {the big dynamic storage area}
@!zmem : ^memory_word; {the big dynamic storage area}
@z

@x [16.211] l.4256
begin if m>0 then
  case m div (max_command+1) of
  0:print("vertical");
  1:print("horizontal");
  2:print("display math");
  end
else if m=0 then print("no")
else  case (-m) div (max_command+1) of
  0:print("internal vertical");
  1:print("restricted horizontal");
  2:print("math");
  end;
print(" mode");
end;
@y
begin if m>0 then
  case m div (max_command+1) of
  0:print("vertical mode");
  1:print("horizontal mode");
  2:print("display math mode");
  end
else if m=0 then print("no mode")
else  case (-m) div (max_command+1) of
  0:print("internal vertical mode");
  1:print("restricted horizontal mode");
  2:print("math mode");
  end;
end;

procedure print_in_mode(@!m:integer); {prints the mode represented by |m|}
begin if m>0 then
  case m div (max_command+1) of
  0:print("' in vertical mode");
  1:print("' in horizontal mode");
  2:print("' in display math mode");
  end
else if m=0 then print("' in no mode")
else  case (-m) div (max_command+1) of
  0:print("' in internal vertical mode");
  1:print("' in restricted horizontal mode");
  2:print("' in math mode");
  end;
end;
@z

@x [16.213] l.4321 - texarray
@!nest:array[0..nest_size] of list_state_record;
@y
@!nest:^list_state_record;
@z

@x [16.215] l.4344 - remove mem[] reference from initialize.
prev_graf:=0; shown_mode:=0;
@<Start a new current page@>;
@y
prev_graf:=0; shown_mode:=0;
@/{The following piece of code is a copy of module 991:}
page_contents:=empty; page_tail:=page_head; {|link(page_head):=null;|}@/
last_glue:=max_halfword; last_penalty:=0; last_kern:=0;
page_depth:=0; page_max_depth:=0;
@z

@x [17.253] l.5435 - Change eqtb to zeqtb.
@!eqtb:array[active_base..eqtb_size] of memory_word;
@y
@!zeqtb:^memory_word;
@z

@x [18.256] l.5483 - hash_extra
@!hash: array[hash_base..undefined_control_sequence-1] of two_halves;
  {the hash table}
@!hash_used:pointer; {allocation pointer for |hash|}
@y
@!hash: ^two_halves; {the hash table}
@!yhash: ^two_halves; {auxiliary pointer for freeing hash}
@!hash_used:pointer; {allocation pointer for |hash|}
@!hash_extra:pointer; {|hash_extra=hash| above |eqtb_size|}
@!hash_top:pointer; {maximum of the hash array}
@!eqtb_top:pointer; {maximum of the |eqtb|}
@!hash_high:pointer; {pointer to next high hash location}
@z

@x [18.257] l.5491 - hash_extra
next(hash_base):=0; text(hash_base):=0;
for k:=hash_base+1 to undefined_control_sequence-1 do hash[k]:=hash[hash_base];
@y
@z

@x [19.271] l.5872 - texarray
@!save_stack : array[0..save_size] of memory_word;
@y
@!save_stack : ^memory_word;
@z

@x [22.301] l.6432 - texarray
@!input_stack : array[0..stack_size] of in_state_record;
@y
@!input_stack : ^in_state_record;
@z

@x [22.304] l.6536 - texarray
@!input_file : array[1..max_in_open] of alpha_file;
@!line : integer; {current line number in the current source file}
@!line_stack : array[1..max_in_open] of integer;
@y
@!input_file : ^alpha_file;
@!line : integer; {current line number in the current source file}
@!line_stack : ^integer;
@z

@x [22.308] l.6701 - texarray
@!param_stack:array [0..param_size] of pointer;
  {token list pointers for parameters}
@y
@!param_stack: ^pointer;
  {token list pointers for parameters}
@z

@x [25.366] expansion depth check
The |expand| subroutine is used when |cur_cmd>max_command|. It removes a
@y
@ Sometimes, recursive calls to the following |expand| routine may
cause exhaustion of the run-time calling stack, resulting in
forced execution stops by the operating system. To diminish the chance
of this happening, a counter is used to keep track of the recursion
depth, in conjunction with a constant called |expand_depth|.

This does not catch all possible infinite recursion loops, just the ones
that exhaust the application calling stack. The actual maximum value of
|expand_depth| is outside of our control, but the initial setting of
|10000| should be enough to prevent problems.
@^system dependencies@>

@<Global...@>=
expand_depth_count:integer;

@ @<Set init...@>=
expand_depth_count:=0;

@ The |expand| subroutine is used when |cur_cmd>max_command|. It removes a
@z

@x [29.516] l.9994 - filenames: more_name
  if (c=">")or(c=":") then
@y
  if IS_DIR_SEP(c) then
@z

@x [29.517] l.10002 - end_name: string recycling
@ The third.
@^system dependencies@>

@p procedure end_name;
@y
@ The third.
@^system dependencies@>
If a string is already in the string pool, the function
|slow_make_string| does not create a new string but returns this string
number, thus saving string space.  Because of this new property of the
returned string number it is not possible to apply |flush_string| to
these strings.

@p procedure end_name;
var temp_str: str_number; {result of file name cache lookups}
@!j,@!s,@!t: pool_pointer; {running indices}
@!must_quote:boolean; {whether we need to quote a string}
@z

@x [29.518] l.10042 - print_file_name: quote if spaces in names.
some operating systems put the file area last instead of first.)
@^system dependencies@>
@y
some operating systems put the file area last instead of first.)
@^system dependencies@>

@d check_quoted(#) == {check if string |#| needs quoting}
if #<>0 then begin
  j:=str_start[#];
  while (not must_quote) and (j<str_start[#+1]) do begin
    must_quote:=str_pool[j]=" "; incr(j);
  end;
end
@#
@d print_quoted(#) == {print string |#|, omitting quotes}
if #<>0 then
  for j:=str_start[#] to str_start[#+1]-1 do
    if so(str_pool[j])<>"""" then
      print(so(str_pool[j]))
@z

@x [29.519] l.10051 - pack_file_name, append the extra null
for k:=name_length+1 to file_name_size do name_of_file[k]:=' ';
@y
name_of_file[name_length+1]:=0;
@z

@x [29.520] l.10060 - filenames: default format.
@d format_default_length=20 {length of the |TEX_format_default| string}
@d format_area_length=11 {length of its area part}
@d format_ext_length=4 {length of its `\.{.fmt}' part}
@y
Under {\mc UNIX} we don't give the area part, instead depending
on the path searching that will happen during file opening.  Also, the
length will be set in the main program.

@d format_area_length=0 {length of its area part}
@d format_ext_length=4 {length of its `\.{.fmt}' part}
@z

@x [29.521] l.10066 - filenames: default format, where `plain.fmt' is.
@!TEX_format_default:packed array[1..format_default_length] of char;

@ @<Set init...@>=
TEX_format_default:='TeXformats:plain.fmt';
@y
@!format_default_length: integer;
@!TEX_format_default: cstring;

@ We set the name of the default format file and the length of that name
in C, instead of Pascal, since we want them to depend on the name of the
program.
@z

@x [29.523] l.10095 - Change to pack_buffered_name as with pack_file_name.
for j:=1 to n do append_to_name(xord[TEX_format_default[j]]);
for j:=a to b do append_to_name(buffer[j]);
for j:=format_default_length-format_ext_length+1 to format_default_length do
  append_to_name(xord[TEX_format_default[j]]);
if k<=file_name_size then name_length:=k@+else name_length:=file_name_size;
for k:=name_length+1 to file_name_size do name_of_file[k]:=' ';
@y
if name_of_file then libc_free (name_of_file);
name_of_file := xmalloc_array (ASCII_code, n+(b-a+1)+format_ext_length+1);
for j:=1 to n do append_to_name(xord[ucharcast(TEX_format_default[j])]);
for j:=a to b do append_to_name(buffer[j]);
for j:=format_default_length-format_ext_length+1 to format_default_length do
  append_to_name(xord[ucharcast(TEX_format_default[j])]);
if k<=file_name_size then name_length:=k@+else name_length:=file_name_size;
name_of_file[name_length+1]:=0;
@z

@x [29.525] l.10170 - make_name_string
begin if (pool_ptr+name_length>pool_size)or(str_ptr=max_strings)or
@y
save_area_delimiter, save_ext_delimiter: pool_pointer;
save_name_in_progress, save_stop_at_space: boolean;
begin if (pool_ptr+name_length>pool_size)or(str_ptr=max_strings)or
@z

@x [29.530] l.10245 - prompt_file_name: prevent empty filenames.
var k:0..buf_size; {index into |buffer|}
@y
var k:0..buf_size; {index into |buffer|}
@!saved_cur_name:str_number; {to catch empty terminal input}
@!saved_cur_ext:str_number; {to catch empty terminal input}
@!saved_cur_area:str_number; {to catch empty terminal input}
@z

@x [29.534] l.10285 - Adjust for C string conventions.
@!months:packed array [1..36] of char; {abbreviations of month names}
@y
@!months:const_cstring;
@z

@x [29.537] l.10338 - start_input
begin scan_file_name; {set |cur_name| to desired file name}
if cur_ext="" then cur_ext:=".tex";
pack_cur_name;
loop@+  begin begin_file_reading; {set up |cur_file| and new level of input}
  if a_open_in(cur_file) then goto done;
  if cur_area="" then
    begin pack_file_name(cur_name,TEX_area,cur_ext);
    if a_open_in(cur_file) then goto done;
    end;
@y
var temp_str: str_number;
begin scan_file_name; {set |cur_name| to desired file name}
pack_cur_name;
loop@+begin
  begin_file_reading; {set up |cur_file| and new level of input}
  tex_input_type := 1; {Tell |open_input| we are \.{\\input}.}
  {Kpathsea tries all the various ways to get the file.}
  if kpse_in_name_ok(stringcast(name_of_file+1))
     and a_open_in(cur_file, kpse_tex_format) then
    goto done;
@z

@x [29.537] l.10350 - start_input: string recycling
done: name:=a_make_name_string(cur_file);
@y
done: name:=a_make_name_string(cur_file);
source_filename_stack[in_open]:=name;
full_source_filename_stack[in_open]:=make_full_name_string;
if name=str_ptr-1 then {we can try to conserve string pool space now}
  begin temp_str:=search_string(name);
  if temp_str>0 then
    begin name:=temp_str; flush_string;
    end;
  end;
@z

@x [30.548] l.10673 - texarray
@!internal_font_number=font_base..font_max; {|font| in a |char_node|}
@!font_index=0..font_mem_size; {index into |font_info|}
@y
@!internal_font_number=integer; {|font| in a |char_node|}
@!font_index=integer; {index into |font_info|}
@!nine_bits=min_quarterword..non_char;
@z

@x [30.549] l.10682 - texarray
@!font_info:array[font_index] of memory_word;
  {the big collection of font data}
@!fmem_ptr:font_index; {first unused word of |font_info|}
@!font_ptr:internal_font_number; {largest internal font number in use}
@!font_check:array[internal_font_number] of four_quarters; {check sum}
@!font_size:array[internal_font_number] of scaled; {``at'' size}
@!font_dsize:array[internal_font_number] of scaled; {``design'' size}
@!font_params:array[internal_font_number] of font_index; {how many font
  parameters are present}
@!font_name:array[internal_font_number] of str_number; {name of the font}
@!font_area:array[internal_font_number] of str_number; {area of the font}
@!font_bc:array[internal_font_number] of eight_bits;
  {beginning (smallest) character code}
@!font_ec:array[internal_font_number] of eight_bits;
  {ending (largest) character code}
@!font_glue:array[internal_font_number] of pointer;
  {glue specification for interword space, |null| if not allocated}
@!font_used:array[internal_font_number] of boolean;
  {has a character from this font actually appeared in the output?}
@!hyphen_char:array[internal_font_number] of integer;
  {current \.{\\hyphenchar} values}
@!skew_char:array[internal_font_number] of integer;
  {current \.{\\skewchar} values}
@!bchar_label:array[internal_font_number] of font_index;
  {start of |lig_kern| program for left boundary character,
  |non_address| if there is none}
@!font_bchar:array[internal_font_number] of min_quarterword..non_char;
  {right boundary character, |non_char| if there is none}
@!font_false_bchar:array[internal_font_number] of min_quarterword..non_char;
  {|font_bchar| if it doesn't exist in the font, otherwise |non_char|}
@y
@!font_info: ^fmemory_word;
  {the big collection of font data}
@!fmem_ptr:font_index; {first unused word of |font_info|}
@!font_ptr:internal_font_number; {largest internal font number in use}
@!font_check: ^four_quarters; {check sum}
@!font_size: ^scaled; {``at'' size}
@!font_dsize: ^scaled; {``design'' size}
@!font_params: ^font_index; {how many font
  parameters are present}
@!font_name: ^str_number; {name of the font}
@!font_area: ^str_number; {area of the font}
@!font_bc: ^eight_bits;
  {beginning (smallest) character code}
@!font_ec: ^eight_bits;
  {ending (largest) character code}
@!font_glue: ^pointer;
  {glue specification for interword space, |null| if not allocated}
@!font_used: ^boolean;
  {has a character from this font actually appeared in the output?}
@!hyphen_char: ^integer;
  {current \.{\\hyphenchar} values}
@!skew_char: ^integer;
  {current \.{\\skewchar} values}
@!bchar_label: ^font_index;
  {start of |lig_kern| program for left boundary character,
  |non_address| if there is none}
@!font_bchar: ^nine_bits;
  {right boundary character, |non_char| if there is none}
@!font_false_bchar: ^nine_bits;
  {|font_bchar| if it doesn't exist in the font, otherwise |non_char|}
@z

@x [30.550] l.10723 - texarray
@!char_base:array[internal_font_number] of integer;
  {base addresses for |char_info|}
@!width_base:array[internal_font_number] of integer;
  {base addresses for widths}
@!height_base:array[internal_font_number] of integer;
  {base addresses for heights}
@!depth_base:array[internal_font_number] of integer;
  {base addresses for depths}
@!italic_base:array[internal_font_number] of integer;
  {base addresses for italic corrections}
@!lig_kern_base:array[internal_font_number] of integer;
  {base addresses for ligature/kerning programs}
@!kern_base:array[internal_font_number] of integer;
  {base addresses for kerns}
@!exten_base:array[internal_font_number] of integer;
  {base addresses for extensible recipes}
@!param_base:array[internal_font_number] of integer;
  {base addresses for font parameters}
@y
@!char_base: ^integer;
  {base addresses for |char_info|}
@!width_base: ^integer;
  {base addresses for widths}
@!height_base: ^integer;
  {base addresses for heights}
@!depth_base: ^integer;
  {base addresses for depths}
@!italic_base: ^integer;
  {base addresses for italic corrections}
@!lig_kern_base: ^integer;
  {base addresses for ligature/kerning programs}
@!kern_base: ^integer;
  {base addresses for kerns}
@!exten_base: ^integer;
  {base addresses for extensible recipes}
@!param_base: ^integer;
  {base addresses for font parameters}
@z

@x [30.551] l.10743 - texarray
for k:=font_base to font_max do font_used[k]:=false;
@y
@z

@x [30.552] l.10749 - texarray
font_ptr:=null_font; fmem_ptr:=7;
font_name[null_font]:="nullfont"; font_area[null_font]:="";
hyphen_char[null_font]:="-"; skew_char[null_font]:=-1;
bchar_label[null_font]:=non_address;
font_bchar[null_font]:=non_char; font_false_bchar[null_font]:=non_char;
font_bc[null_font]:=1; font_ec[null_font]:=0;
font_size[null_font]:=0; font_dsize[null_font]:=0;
char_base[null_font]:=0; width_base[null_font]:=0;
height_base[null_font]:=0; depth_base[null_font]:=0;
italic_base[null_font]:=0; lig_kern_base[null_font]:=0;
kern_base[null_font]:=0; exten_base[null_font]:=0;
font_glue[null_font]:=null; font_params[null_font]:=7;
param_base[null_font]:=-1;
for k:=0 to 6 do font_info[k].sc:=0;
@y
@z

@x [30.560] l.10898 - Check lengths
@!file_opened:boolean; {was |tfm_file| successfully opened?}
@y
@!name_too_long:boolean; {|nom| or |aire| exceeds 255 bytes?}
@!file_opened:boolean; {was |tfm_file| successfully opened?}
@z

@x [30.563] l.10961 - Check lengths, don't use TEX_font_area.
if aire="" then pack_file_name(nom,TEX_font_area,".tfm")
else pack_file_name(nom,aire,".tfm");
@y
name_too_long:=(length(nom)>255)or(length(aire)>255);
if name_too_long then abort;
{|kpse_find_file| will append the |".tfm"|, and avoid searching the disk
 before the font alias files as well.}
pack_file_name(nom,aire,"");
@z

% [30.564] Reading the tfm file.  As a special case, whenever we open a
% tfm file, we read its first byte into `tfm_temp' right away.  TeX
% looks at `fbyte' before calling `fget', so it ends up seeing every
% byte.  This is Pascal-like I/O.
@x [30.564] l.10956 - reading the tfm file, define fget & fbyte
@d fget==get(tfm_file)
@d fbyte==tfm_file^
@y
@d fget==tfm_temp:=getc(tfm_file)
@d fbyte==tfm_temp
@z

% [30.575] We only want `eof' on the TFM file to be true if we
% previously had EOF, not if we're at EOF now.  This is like `feof', and
% unlike our implementation of `eof' elsewhere.
@x [30.575] l.11180 - Reading the tfm file, replace eof() by feof().
if eof(tfm_file) then abort;
@y
if feof(tfm_file) then abort;
@z

@x [32.595] l.11860 - texarray
@!dvi_buf:array[dvi_index] of eight_bits; {buffer for \.{DVI} output}
@!half_buf:dvi_index; {half of |dvi_buf_size|}
@!dvi_limit:dvi_index; {end of the current half buffer}
@!dvi_ptr:dvi_index; {the next available buffer address}
@y
@!dvi_buf:^eight_bits; {buffer for \.{DVI} output}
@!half_buf:integer; {half of |dvi_buf_size|}
@!dvi_limit:integer; {end of the current half buffer}
@!dvi_ptr:integer; {the next available buffer address}
@z

@x [32.597] l.11886 - write_dvi done in C.
@p procedure write_dvi(@!a,@!b:dvi_index);
var k:dvi_index;
begin for k:=a to b do write(dvi_file,dvi_buf[k]);
end;
@y
In C, we use a macro to call |fwrite| or |write| directly, writing all
the bytes in one shot.  Much better even than writing four
bytes at a time.
@z

@x [32.617] l.12280 - Use output_comment if the user set it. Assume it's short enough.
  old_setting:=selector; selector:=new_string;
@y
if output_comment then
  begin l:=strlen(output_comment); dvi_out(l);
  for s:=0 to l-1 do dvi_out(output_comment[s]);
  end
else begin {the default code is unchanged}
  old_setting:=selector; selector:=new_string;
@z

@x [32.617] l.12288 - Use output_comment if the user set it.
  end
@y
end;
  end
@z

@x [42.920] l.18068 - bigtrie: allow larger hyphenation tries.
@!trie_pointer=0..trie_size; {an index into |trie|}
@y
@!trie_pointer=0..ssup_trie_size; {an index into |trie|}
@!trie_opcode=0..ssup_trie_opcode;  {a trie opcode}
@z

@x [42.921] l.18070 - bigtrie: allow larger hyphenation tries.
@ @d trie_link(#)==trie[#].rh {``downward'' link in a trie}
@d trie_char(#)==trie[#].b1 {character matched at this trie location}
@d trie_op(#)==trie[#].b0 {program for hyphenation at this trie location}
@y
@ For more than 255 trie op codes, the three fields |trie_link|, |trie_char|,
and |trie_op| will no longer fit into one memory word; thus using web2c
we define |trie| as three array instead of an array of records.
The variant will be implented by reusing the opcode field later on with
another macro.

@d trie_link(#)==trie_trl[#] {``downward'' link in a trie}
@d trie_char(#)==trie_trc[#] {character matched at this trie location}
@d trie_op(#)==trie_tro[#] {program for hyphenation at this trie location}
@z

@x [42.921] l.18075 - bigtrie: allow larger hyphenation tries.
@!trie:array[trie_pointer] of two_halves; {|trie_link|, |trie_char|, |trie_op|}
@y
{We will dynamically allocate these arrays.}
@!trie_trl:^trie_pointer; {|trie_link|}
@!trie_tro:^trie_pointer; {|trie_op|}
@!trie_trc:^quarterword; {|trie_char|}
@z

@x 18137 m.926
@!hyph_word:array[hyph_pointer] of str_number; {exception words}
@!hyph_list:array[hyph_pointer] of pointer; {lists of hyphen positions}
@!hyph_count:hyph_pointer; {the number of words in the exception dictionary}
@y  18139
@!hyph_word: ^str_number; {exception words}
@!hyph_list: ^pointer; {lists of hyphen positions}
@!hyph_link: ^hyph_pointer; {link array for hyphen exceptions hash table}
@!hyph_count:integer; {the number of words in the exception dictionary}
@!hyph_next:integer; {next free slot in hyphen exceptions hash table}
@z

%%%%%%%% dynamic hyph_size
@x 18145 m.928
for z:=0 to hyph_size do
  begin hyph_word[z]:=0; hyph_list[z]:=null;
  end;
hyph_count:=0;
@y  18148
for z:=0 to hyph_size do
  begin hyph_word[z]:=0; hyph_list[z]:=null; hyph_link[z]:=0;
  end;
hyph_count:=0;
hyph_next:=hyph_prime+1; if hyph_next>hyph_size then hyph_next:=hyph_prime;
@z

%%%%%%%% dynamic hyph_size
@x 18281 m.940
@ @<Insert the \(p)pair |(s,p)|...@>=
if hyph_count=hyph_size then overflow("exception dictionary",hyph_size);
@:TeX capacity exceeded exception dictionary}{\quad exception dictionary@>
incr(hyph_count);
while hyph_word[h]<>0 do
  begin @<If the string |hyph_word[h]| is less than \(or)or equal to
  |s|, interchange |(hyph_word[h],hyph_list[h])| with |(s,p)|@>;
  if h>0 then decr(h)@+else h:=hyph_size;
  end;
hyph_word[h]:=s; hyph_list[h]:=p
@y  18290
@ @<Insert the \(p)pair |(s,p)|...@>=
  if hyph_next <= hyph_prime then
     while (hyph_next>0) and (hyph_word[hyph_next-1]>0) do decr(hyph_next);
if (hyph_count=hyph_size)or(hyph_next=0) then
   overflow("exception dictionary",hyph_size);
@:TeX capacity exceeded exception dictionary}{\quad exception dictionary@>
incr(hyph_count);
while hyph_word[h]<>0 do
  begin @<If the string |hyph_word[h]| is less than \(or)or equal to
  |s|, interchange |(hyph_word[h],hyph_list[h])| with |(s,p)|@>;
  if hyph_link[h]=0 then
  begin
    hyph_link[h]:=hyph_next;
    if hyph_next >= hyph_size then hyph_next:=hyph_prime;
    if hyph_next > hyph_prime then incr(hyph_next);
  end;
  h:=hyph_link[h]-1;
  end;

found: hyph_word[h]:=s; hyph_list[h]:=p
@z

@x [42.941] l.18335 - dynamic hyph_size
found:q:=hyph_list[h]; hyph_list[h]:=p; p:=q;@/
t:=hyph_word[h]; hyph_word[h]:=s; s:=t;
not_found:
@y
{repeat hyphenation exception; flushing old data}
flush_string; s:=hyph_word[h]; {avoid |slow_make_string|!}
decr(hyph_count);
{ We could also |flush_list(hyph_list[h]);|, but it interferes
  with \.{trip.log}. }
goto found;
not_found:
@z

@x [43.943] l.18346 - web2c can't parse negative lower bounds in arrays.  Sorry.
@!init@! trie_op_hash:array[-trie_op_size..trie_op_size] of 0..trie_op_size;
@y
@!init@! trie_op_hash:array[neg_trie_op_size..trie_op_size] of 0..trie_op_size;
@z

@x [43.943] l.18355 - Dynamic trie arrays
tini
@y
tini@;
@!max_op_used:trie_opcode; {largest opcode used for any language}
@!small_op:boolean; {flag used while dumping or undumping}
@z

@x [43.944] l.18365 - bigtrie: Larger hyphenation tries.
function new_trie_op(@!d,@!n:small_number;@!v:quarterword):quarterword;
label exit;
var h:-trie_op_size..trie_op_size; {trial hash location}
@!u:quarterword; {trial op code}
@y
function new_trie_op(@!d,@!n:small_number;@!v:trie_opcode):trie_opcode;
label exit;
var h:neg_trie_op_size..trie_op_size; {trial hash location}
@!u:trie_opcode; {trial op code}
@z

@x [43.947] l.18438 - Dynamically allocate arrays, and a casting problem.
@!init @!trie_c:packed array[trie_pointer] of packed_ASCII_code;
  {characters to match}
@t\hskip10pt@>@!trie_o:packed array[trie_pointer] of quarterword;
  {operations to perform}
@t\hskip10pt@>@!trie_l:packed array[trie_pointer] of trie_pointer;
  {left subtrie links}
@t\hskip10pt@>@!trie_r:packed array[trie_pointer] of trie_pointer;
  {right subtrie links}
@t\hskip10pt@>@!trie_ptr:trie_pointer; {the number of nodes in the trie}
@t\hskip10pt@>@!trie_hash:packed array[trie_pointer] of trie_pointer;
  {used to identify equivalent subtries}
tini
@y
@!init @!trie_c:^packed_ASCII_code;
  {characters to match}
@t\hskip10pt@>@!trie_o:^trie_opcode;
  {operations to perform}
@t\hskip10pt@>@!trie_l:^trie_pointer;
  {left subtrie links}
@t\hskip10pt@>@!trie_r:^trie_pointer;
  {right subtrie links}
@t\hskip10pt@>@!trie_ptr:trie_pointer; {the number of nodes in the trie}
@t\hskip10pt@>@!trie_hash:^trie_pointer;
  {used to identify equivalent subtries}
tini
@z

@x [43.950] l.18521 - Dynamically allocate & larger tries.
@d trie_back(#)==trie[#].lh {backward links in |trie| holes}
@y
@d trie_back(#)==trie_tro[#] {use the opcode field now for backward links}
@z

@x [43.590] l.18524 - Dynamically allocate & larger tries.
@!init@!trie_taken:packed array[1..trie_size] of boolean;
  {does a family start here?}
@t\hskip10pt@>@!trie_min:array[ASCII_code] of trie_pointer;
  {the first possible slot for each character}
@t\hskip10pt@>@!trie_max:trie_pointer; {largest location used in |trie|}
@t\hskip10pt@>@!trie_not_ready:boolean; {is the trie still in linked form?}
tini
@y
@!init@!trie_taken: ^boolean;
  {does a family start here?}
@t\hskip10pt@>@!trie_min:array[ASCII_code] of trie_pointer;
  {the first possible slot for each character}
@t\hskip10pt@>@!trie_max:trie_pointer; {largest location used in |trie|}
@t\hskip10pt@>@!trie_not_ready:boolean; {is the trie still in linked form?}
tini
@z

@x [43.951] l.18539 - Dynamically allocate.
trie_not_ready:=true; trie_root:=0; trie_c[0]:=si(0); trie_ptr:=0;
@y
trie_not_ready:=true;
@z

@x [43.958] l.18634 - bigtrie: Larger tries.
@<Move the data into |trie|@>=
h.rh:=0; h.b0:=min_quarterword; h.b1:=min_quarterword; {|trie_link:=0|,
  |trie_op:=min_quarterword|, |trie_char:=qi(0)|}
@y
@d clear_trie == {clear |trie[r]|}
  begin trie_link(r):=0;
  trie_op(r):=min_trie_op;
  trie_char(r):=min_quarterword; {|trie_char:=qi(0)|}
  end

@<Move the data into |trie|@>=
@z

@x [43.958] l.18638 - bigtrie: Larger tries.
  begin for r:=0 to 256 do trie[r]:=h;
@y
  begin for r:=0 to 256 do clear_trie;
@z

@x [43.958] l.18643 - bigtrie: Larger tries.
  repeat s:=trie_link(r); trie[r]:=h; r:=s;
@y
  repeat s:=trie_link(r); clear_trie; r:=s;
@z

@x [49.1275] l.23441 - Same stuff as for \input, this time for \openin.
  if cur_ext="" then cur_ext:=".tex";
  pack_cur_name;
  if a_open_in(read_file[n]) then read_open[n]:=just_open;
@y
  pack_cur_name;
  tex_input_type:=0; {Tell |open_input| we are \.{\\openin}.}
  if kpse_in_name_ok(stringcast(name_of_file+1))
     and a_open_in(read_file[n], kpse_tex_format) then
    read_open[n]:=just_open;
@z

@x [50.1302] l.23690 - store_fmt_file
@!w: four_quarters; {four ASCII codes}
@y
@!format_engine: ^text_char;
@z

% Eliminate now-unused variable `w' in `load_fmt_file'.
% Add format_engine.
% Add dummies for undumping |xord|, |xchr|, and |xprn| into the void.
@x [50.1303] l.23722 - load_fmt_file
@!w: four_quarters; {four ASCII codes}
@y
@!format_engine: ^text_char;
@!dummy_xord: ASCII_code;
@!dummy_xchr: text_char;
@!dummy_xprn: ASCII_code;
@z

@x [50.1305] l.23751 - Do dumping and undumping of fmt files in C.
@d dump_wd(#)==begin fmt_file^:=#; put(fmt_file);@+end
@d dump_int(#)==begin fmt_file^.int:=#; put(fmt_file);@+end
@d dump_hh(#)==begin fmt_file^.hh:=#; put(fmt_file);@+end
@d dump_qqqq(#)==begin fmt_file^.qqqq:=#; put(fmt_file);@+end
@y
@z
@x [1306]
@d undump_wd(#)==begin get(fmt_file); #:=fmt_file^;@+end
@d undump_int(#)==begin get(fmt_file); #:=fmt_file^.int;@+end
@d undump_hh(#)==begin get(fmt_file); #:=fmt_file^.hh;@+end
@d undump_qqqq(#)==begin get(fmt_file); #:=fmt_file^.qqqq;@+end
@y
@z
@x [still 1306] debug format file
@d undump_size_end_end(#)==too_small(#)@+else undump_end_end
@y
@d format_debug_end(#)==
    write_ln (stderr, ' = ', #);
  end;
@d format_debug(#)==
  if debug_format_file then begin
    write (stderr, 'fmtdebug:', #);
    format_debug_end
@d undump_size_end_end(#)==
  too_small(#)@+else format_debug (#)(x); undump_end_end
@z

@x [50,1307] l.23779 - texarray
dump_int(@$);@/
@y
dump_int(@"57325458);  {Web2C \TeX's magic constant: "W2TX"}
{Align engine to 4 bytes with one or more trailing NUL}
x:=strlen(engine_name);
format_engine:=xmalloc_array(text_char,x+4);
strcpy(stringcast(format_engine), engine_name);
for k:=x to x+3 do format_engine[k]:=0;
x:=x+4-(x mod 4);
dump_int(x);dump_things(format_engine[0], x);
libc_free(format_engine);@/
dump_int(@$);@/
@<Dump |xord|, |xchr|, and |xprn|@>;
dump_int(max_halfword);@/
dump_int(hash_high);
@z

%%%%%%%% dynamic hyph_size
@x 23784 m.1307
dump_int(hyph_size)
@y  23784
dump_int(hyph_prime)
@z

@x [50.1308] l.23793 - texarray
x:=fmt_file^.int;
if x<>@$ then goto bad_fmt; {check that strings are the same}
@y
@+Init
libc_free(font_info); libc_free(str_pool); libc_free(str_start);
libc_free(yhash); libc_free(zeqtb); libc_free(yzmem);
@+Tini
undump_int(x);
format_debug('format magic number')(x);
if x<>@"57325458 then goto bad_fmt; {not a format file}
undump_int(x);
format_debug('engine name size')(x);
if (x<0) or (x>256) then goto bad_fmt; {corrupted format file}
format_engine:=xmalloc_array(text_char, x);
undump_things(format_engine[0], x);
format_engine[x-1]:=0; {force string termination, just in case}
if strcmp(engine_name, stringcast(format_engine)) then
  begin wake_up_terminal;
  wterm_ln('---! ', stringcast(name_of_file+1), ' was written by ', format_engine);
  libc_free(format_engine);
  goto bad_fmt;
end;
libc_free(format_engine);
undump_int(x);
format_debug('string pool checksum')(x);
if x<>@$ then begin {check that strings are the same}
  wake_up_terminal;
  wterm_ln('---! ', stringcast(name_of_file+1),
           ' made by different executable version');
  goto bad_fmt;
end;
@<Undump |xord|, |xchr|, and |xprn|@>;
undump_int(x);
if x<>max_halfword then goto bad_fmt; {check |max_halfword|}
undump_int(hash_high);
  if (hash_high<0)or(hash_high>sup_hash_extra) then goto bad_fmt;
  if hash_extra<hash_high then hash_extra:=hash_high;
  eqtb_top:=eqtb_size+hash_extra;
  if hash_extra=0 then hash_top:=undefined_control_sequence else
        hash_top:=eqtb_top;
  yhash:=xmalloc_array(two_halves,1+hash_top-hash_offset);
  hash:=yhash - hash_offset;
  next(hash_base):=0; text(hash_base):=0;
  for x:=hash_base+1 to hash_top do hash[x]:=hash[hash_base];
  zeqtb:=xmalloc_array (memory_word,eqtb_top+1);
  eqtb:=zeqtb;

  eq_type(undefined_control_sequence):=undefined_cs;
  equiv(undefined_control_sequence):=null;
  eq_level(undefined_control_sequence):=level_zero;
  for x:=eqtb_size+1 to eqtb_top do
    eqtb[x]:=eqtb[undefined_control_sequence];
@z

@x [50.1308] l.23795 - texarray
undump_int(x);
if x<>mem_bot then goto bad_fmt;
undump_int(x);
if x<>mem_top then goto bad_fmt;
@y
undump_int(x); format_debug ('mem_bot')(x);
if x<>mem_bot then goto bad_fmt;
undump_int(mem_top); format_debug ('mem_top')(mem_top);
if mem_bot+1100>mem_top then goto bad_fmt;


head:=contrib_head; tail:=contrib_head;
     page_tail:=page_head;  {page initialization}

mem_min := mem_bot - extra_mem_bot;
mem_max := mem_top + extra_mem_top;

yzmem:=xmalloc_array (memory_word, mem_max - mem_min + 1);
zmem := yzmem - mem_min;   {this pointer arithmetic fails with some compilers}
mem := zmem;
@z

%%%%%%%% dynamic hyph_size
@x 23804 m.1308
if x<>hyph_size then goto bad_fmt
@y  23804
if x<>hyph_prime then goto bad_fmt
@z

% [1309] Make dumping/undumping more efficient by doing whole arrays at
% a time, via fread/fwrite in texmfmp.c.
@x [50.1309] l.23814 - Make dumping/undumping more efficient.
for k:=0 to str_ptr do dump_int(str_start[k]);
k:=0;
while k+4<pool_ptr do
  begin dump_four_ASCII; k:=k+4;
  end;
k:=pool_ptr-4; dump_four_ASCII;
@y
dump_things(str_start[0], str_ptr+1);
dump_things(str_pool[0], pool_ptr);
@z

@x [50.1310] l.23829 - Make dumping/undumping more efficient.
undump_size(0)(pool_size)('string pool size')(pool_ptr);
undump_size(0)(max_strings)('max strings')(str_ptr);
for k:=0 to str_ptr do undump(0)(pool_ptr)(str_start[k]);
k:=0;
while k+4<pool_ptr do
  begin undump_four_ASCII; k:=k+4;
  end;
k:=pool_ptr-4; undump_four_ASCII;
@y
undump_size(0)(sup_pool_size-pool_free)('string pool size')(pool_ptr);
if pool_size<pool_ptr+pool_free then
  pool_size:=pool_ptr+pool_free;
undump_size(0)(sup_max_strings-strings_free)('sup strings')(str_ptr);@/
if max_strings<str_ptr+strings_free then
  max_strings:=str_ptr+strings_free;
str_start:=xmalloc_array(pool_pointer, max_strings);
undump_checked_things(0, pool_ptr, str_start[0], str_ptr+1);@/
str_pool:=xmalloc_array(packed_ASCII_code, pool_size);
undump_things(str_pool[0], pool_ptr);
@z

@x [50.1315] l.23925 - Make dumping/undumping more efficient - eqtb
while k<l do
  begin dump_wd(eqtb[k]); incr(k);
  end;
@y
dump_things(eqtb[k], l-k);
@z

@x [50.1316] l.23944 - Make dumping/undumping more efficient - eqtb
while k<l do
  begin dump_wd(eqtb[k]); incr(k);
  end;
@y
dump_things(eqtb[k], l-k);
@z

@x [50.1321] l.23994 - texarray
undump_size(7)(font_mem_size)('font mem size')(fmem_ptr);
for k:=0 to fmem_ptr-1 do undump_wd(font_info[k]);
undump_size(font_base)(font_max)('font max')(font_ptr);
for k:=null_font to font_ptr do
  @<Undump the array info for internal font number |k|@>
@y
undump_size(7)(sup_font_mem_size)('font mem size')(fmem_ptr);
if fmem_ptr>font_mem_size then font_mem_size:=fmem_ptr;
font_info:=xmalloc_array(fmemory_word, font_mem_size);
undump_things(font_info[0], fmem_ptr);@/
undump_size(font_base)(font_base+max_font_max)('font max')(font_ptr);
{This undumps all of the font info, despite the name.}
@<Undump the array info for internal font number |k|@>;
@z

% [50.1322] Dumping font_info.
% Knuth's code writes all the information relevant to a single font
% in the same section of the fmt file.  But it's a lot faster to
% write the arrays of information out, one whole array at a time.
% So that's the way we handle dumping and undumping font info.
@x [50.1322] l.24000 - Make dumping/undumping more efficient - tfm
@ @<Dump the array info for internal font number |k|@>=
begin dump_qqqq(font_check[k]);
dump_int(font_size[k]);
dump_int(font_dsize[k]);
dump_int(font_params[k]);@/
dump_int(hyphen_char[k]);
dump_int(skew_char[k]);@/
dump_int(font_name[k]);
dump_int(font_area[k]);@/
dump_int(font_bc[k]);
dump_int(font_ec[k]);@/
dump_int(char_base[k]);
dump_int(width_base[k]);
dump_int(height_base[k]);@/
dump_int(depth_base[k]);
dump_int(italic_base[k]);
dump_int(lig_kern_base[k]);@/
dump_int(kern_base[k]);
dump_int(exten_base[k]);
dump_int(param_base[k]);@/
dump_int(font_glue[k]);@/
dump_int(bchar_label[k]);
dump_int(font_bchar[k]);
dump_int(font_false_bchar[k]);@/
print_nl("\font"); print_esc(font_id_text(k)); print_char("=");
print_file_name(font_name[k],font_area[k],"");
if font_size[k]<>font_dsize[k] then
  begin print(" at "); print_scaled(font_size[k]); print("pt");
  end;
end
@y
@ @<Dump the array info for internal font number |k|@>=
begin
dump_things(font_check[null_font], font_ptr+1-null_font);
dump_things(font_size[null_font], font_ptr+1-null_font);
dump_things(font_dsize[null_font], font_ptr+1-null_font);
dump_things(font_params[null_font], font_ptr+1-null_font);
dump_things(hyphen_char[null_font], font_ptr+1-null_font);
dump_things(skew_char[null_font], font_ptr+1-null_font);
dump_things(font_name[null_font], font_ptr+1-null_font);
dump_things(font_area[null_font], font_ptr+1-null_font);
dump_things(font_bc[null_font], font_ptr+1-null_font);
dump_things(font_ec[null_font], font_ptr+1-null_font);
dump_things(char_base[null_font], font_ptr+1-null_font);
dump_things(width_base[null_font], font_ptr+1-null_font);
dump_things(height_base[null_font], font_ptr+1-null_font);
dump_things(depth_base[null_font], font_ptr+1-null_font);
dump_things(italic_base[null_font], font_ptr+1-null_font);
dump_things(lig_kern_base[null_font], font_ptr+1-null_font);
dump_things(kern_base[null_font], font_ptr+1-null_font);
dump_things(exten_base[null_font], font_ptr+1-null_font);
dump_things(param_base[null_font], font_ptr+1-null_font);
dump_things(font_glue[null_font], font_ptr+1-null_font);
dump_things(bchar_label[null_font], font_ptr+1-null_font);
dump_things(font_bchar[null_font], font_ptr+1-null_font);
dump_things(font_false_bchar[null_font], font_ptr+1-null_font);
for k:=null_font to font_ptr do
  begin print_nl("\font"); print_esc(font_id_text(k)); print_char("=");
  print_file_name(font_name[k],font_area[k],"");
  if font_size[k]<>font_dsize[k] then
    begin print(" at "); print_scaled(font_size[k]); print("pt");
    end;
  end;
end
@z

@x [50.1322] l.24031 - Make dumping/undumping more efficient - tfm
@ @<Undump the array info for internal font number |k|@>=
begin undump_qqqq(font_check[k]);@/
undump_int(font_size[k]);
undump_int(font_dsize[k]);
undump(min_halfword)(max_halfword)(font_params[k]);@/
undump_int(hyphen_char[k]);
undump_int(skew_char[k]);@/
undump(0)(str_ptr)(font_name[k]);
undump(0)(str_ptr)(font_area[k]);@/
undump(0)(255)(font_bc[k]);
undump(0)(255)(font_ec[k]);@/
undump_int(char_base[k]);
undump_int(width_base[k]);
undump_int(height_base[k]);@/
undump_int(depth_base[k]);
undump_int(italic_base[k]);
undump_int(lig_kern_base[k]);@/
undump_int(kern_base[k]);
undump_int(exten_base[k]);
undump_int(param_base[k]);@/
undump(min_halfword)(lo_mem_max)(font_glue[k]);@/
undump(0)(fmem_ptr-1)(bchar_label[k]);
undump(min_quarterword)(non_char)(font_bchar[k]);
undump(min_quarterword)(non_char)(font_false_bchar[k]);
end
@y
@ This module should now be named `Undump all the font arrays'.

@<Undump the array info for internal font number |k|@>=
begin {Allocate the font arrays}
font_check:=xmalloc_array(four_quarters, font_max);
font_size:=xmalloc_array(scaled, font_max);
font_dsize:=xmalloc_array(scaled, font_max);
font_params:=xmalloc_array(font_index, font_max);
font_name:=xmalloc_array(str_number, font_max);
font_area:=xmalloc_array(str_number, font_max);
font_bc:=xmalloc_array(eight_bits, font_max);
font_ec:=xmalloc_array(eight_bits, font_max);
font_glue:=xmalloc_array(halfword, font_max);
hyphen_char:=xmalloc_array(integer, font_max);
skew_char:=xmalloc_array(integer, font_max);
bchar_label:=xmalloc_array(font_index, font_max);
font_bchar:=xmalloc_array(nine_bits, font_max);
font_false_bchar:=xmalloc_array(nine_bits, font_max);
char_base:=xmalloc_array(integer, font_max);
width_base:=xmalloc_array(integer, font_max);
height_base:=xmalloc_array(integer, font_max);
depth_base:=xmalloc_array(integer, font_max);
italic_base:=xmalloc_array(integer, font_max);
lig_kern_base:=xmalloc_array(integer, font_max);
kern_base:=xmalloc_array(integer, font_max);
exten_base:=xmalloc_array(integer, font_max);
param_base:=xmalloc_array(integer, font_max);

undump_things(font_check[null_font], font_ptr+1-null_font);
undump_things(font_size[null_font], font_ptr+1-null_font);
undump_things(font_dsize[null_font], font_ptr+1-null_font);
undump_checked_things(min_halfword, max_halfword,
                      font_params[null_font], font_ptr+1-null_font);
undump_things(hyphen_char[null_font], font_ptr+1-null_font);
undump_things(skew_char[null_font], font_ptr+1-null_font);
undump_upper_check_things(str_ptr, font_name[null_font], font_ptr+1-null_font);
undump_upper_check_things(str_ptr, font_area[null_font], font_ptr+1-null_font);
{There's no point in checking these values against the range $[0,255]$,
 since the data type is |unsigned char|, and all values of that type are
 in that range by definition.}
undump_things(font_bc[null_font], font_ptr+1-null_font);
undump_things(font_ec[null_font], font_ptr+1-null_font);
undump_things(char_base[null_font], font_ptr+1-null_font);
undump_things(width_base[null_font], font_ptr+1-null_font);
undump_things(height_base[null_font], font_ptr+1-null_font);
undump_things(depth_base[null_font], font_ptr+1-null_font);
undump_things(italic_base[null_font], font_ptr+1-null_font);
undump_things(lig_kern_base[null_font], font_ptr+1-null_font);
undump_things(kern_base[null_font], font_ptr+1-null_font);
undump_things(exten_base[null_font], font_ptr+1-null_font);
undump_things(param_base[null_font], font_ptr+1-null_font);
undump_checked_things(min_halfword, lo_mem_max,
                     font_glue[null_font], font_ptr+1-null_font);
undump_checked_things(0, fmem_ptr-1,
                     bchar_label[null_font], font_ptr+1-null_font);
undump_checked_things(min_quarterword, non_char,
                     font_bchar[null_font], font_ptr+1-null_font);
undump_checked_things(min_quarterword, non_char,
                     font_false_bchar[null_font], font_ptr+1-null_font);
end
@z

%%%%%%%% dynamic hyph_size
@x 24058 m.1324
dump_int(hyph_count);
for k:=0 to hyph_size do if hyph_word[k]<>0 then
  begin dump_int(k); dump_int(hyph_word[k]); dump_int(hyph_list[k]);
  end;
@y  24061
dump_int(hyph_count);
if hyph_next <= hyph_prime then hyph_next:=hyph_size;
dump_int(hyph_next);{minumum value of |hyphen_size| needed}
for k:=0 to hyph_size do if hyph_word[k]<>0 then
  begin dump_int(k+65536*hyph_link[k]);
        {assumes number of hyphen exceptions does not exceed 65535}
   dump_int(hyph_word[k]); dump_int(hyph_list[k]);
  end;
@z

@x [50.1324] l.24066 - Make dumping/undumping more efficient - trie
for k:=0 to trie_max do dump_hh(trie[k]);
@y
dump_things(trie_trl[0], trie_max+1);
dump_things(trie_tro[0], trie_max+1);
dump_things(trie_trc[0], trie_max+1);
@z

@x [50.1324] l.24068 - Make dumping/undumping more efficient - trie
for k:=1 to trie_op_ptr do
  begin dump_int(hyf_distance[k]);
  dump_int(hyf_num[k]);
  dump_int(hyf_next[k]);
  end;
@y
dump_things(hyf_distance[1], trie_op_ptr);
dump_things(hyf_num[1], trie_op_ptr);
dump_things(hyf_next[1], trie_op_ptr);
@z

@x 24087 m.1325
undump(0)(hyph_size)(hyph_count);
for k:=1 to hyph_count do
  begin undump(0)(hyph_size)(j);
  undump(0)(str_ptr)(hyph_word[j]);
  undump(min_halfword)(max_halfword)(hyph_list[j]);
  end;
@y  24092
undump_size(0)(hyph_size)('hyph_size')(hyph_count);
undump_size(hyph_prime)(hyph_size)('hyph_size')(hyph_next);
j:=0;
for k:=1 to hyph_count do
  begin undump_int(j); if j<0 then goto bad_fmt;
   if j>65535 then
   begin hyph_next:= j div 65536; j:=j - hyph_next * 65536; end
       else hyph_next:=0;
   if (j>=hyph_size)or(hyph_next>hyph_size) then goto bad_fmt;
   hyph_link[j]:=hyph_next;
  undump(0)(str_ptr)(hyph_word[j]);
  undump(min_halfword)(max_halfword)(hyph_list[j]);
  end;
  {|j| is now the largest occupied location in |hyph_word|}
  incr(j);
  if j<hyph_prime then j:=hyph_prime;
  hyph_next:=j;
  if hyph_next >= hyph_size then hyph_next:=hyph_prime else
  if hyph_next >= hyph_prime then incr(hyph_next);
@z

@x [50.1325] l.24094 - Make dumping/undumping more efficient - trie
for k:=0 to j do undump_hh(trie[k]);
@y
{These first three haven't been allocated yet unless we're \.{INITEX};
 we do that precisely so we don't allocate more space than necessary.}
if not trie_trl then trie_trl:=xmalloc_array(trie_pointer,j+1);
undump_things(trie_trl[0], j+1);
if not trie_tro then trie_tro:=xmalloc_array(trie_pointer,j+1);
undump_things(trie_tro[0], j+1);
if not trie_trc then trie_trc:=xmalloc_array(quarterword, j+1);
undump_things(trie_trc[0], j+1);
@z

@x [50.1325] l.24096 - Make dumping/undumping more efficient - trie
for k:=1 to j do
  begin undump(0)(63)(hyf_distance[k]); {a |small_number|}
  undump(0)(63)(hyf_num[k]);
  undump(min_quarterword)(max_quarterword)(hyf_next[k]);
  end;
@y
{I'm not sure we have such a strict limitation (64) on these values, so
 let's leave them unchecked.}
undump_things(hyf_distance[1], j);
undump_things(hyf_num[1], j);
undump_upper_check_things(max_trie_op, hyf_next[1], j);
@z

@x [50.1327] l.24172 - Test for end-of-file already done by undump.
if (x<>69069)or eof(fmt_file) then goto bad_fmt
@y
if x<>69069 then goto bad_fmt
@z

@x [51.1332] l.24203 - make the main program a procedure, for eqtb hack.
@p begin @!{|start_here|}
@y
@d const_chk(#)==begin if # < inf@&# then # := inf@&# else
                         if # > sup@&# then # := sup@&# end

{|setup_bound_var| stuff duplicated in \.{mf.ch}.}
@d setup_bound_var(#)==bound_default:=#; setup_bound_var_end
@d setup_bound_var_end(#)==bound_name:=#; setup_bound_var_end_end
@d setup_bound_var_end_end(#)==
  setup_bound_variable(addressof(#), bound_name, bound_default)

@p procedure main_body;
begin @!{|start_here|}

{Bounds that may be set from the configuration file. We want the user to
 be able to specify the names with underscores, but \.{TANGLE} removes
 underscores, so we're stuck giving the names twice, once as a string,
 once as the identifier. How ugly.}
  setup_bound_var (0)('mem_bot')(mem_bot);
  setup_bound_var (250000)('main_memory')(main_memory);
    {|memory_word|s for |mem| in \.{INITEX}}
  setup_bound_var (0)('extra_mem_top')(extra_mem_top);
    {increase high mem in \.{VIRTEX}}
  setup_bound_var (0)('extra_mem_bot')(extra_mem_bot);
    {increase low mem in \.{VIRTEX}}
  setup_bound_var (200000)('pool_size')(pool_size);
  setup_bound_var (75000)('string_vacancies')(string_vacancies);
  setup_bound_var (5000)('pool_free')(pool_free); {min pool avail after fmt}
  setup_bound_var (15000)('max_strings')(max_strings);
  setup_bound_var (100)('strings_free')(strings_free);
  setup_bound_var (100000)('font_mem_size')(font_mem_size);
  setup_bound_var (500)('font_max')(font_max);
  setup_bound_var (20000)('trie_size')(trie_size);
    {if |ssup_trie_size| increases, recompile}
  setup_bound_var (659)('hyph_size')(hyph_size);
  setup_bound_var (3000)('buf_size')(buf_size);
  setup_bound_var (50)('nest_size')(nest_size);
  setup_bound_var (15)('max_in_open')(max_in_open);
  setup_bound_var (60)('param_size')(param_size);
  setup_bound_var (4000)('save_size')(save_size);
  setup_bound_var (300)('stack_size')(stack_size);
  setup_bound_var (16384)('dvi_buf_size')(dvi_buf_size);
  setup_bound_var (79)('error_line')(error_line);
  setup_bound_var (50)('half_error_line')(half_error_line);
  setup_bound_var (79)('max_print_line')(max_print_line);
  setup_bound_var (0)('hash_extra')(hash_extra);
  setup_bound_var (10000)('expand_depth')(expand_depth);

  const_chk (mem_bot);
  const_chk (main_memory);
@+Init
  extra_mem_top := 0;
  extra_mem_bot := 0;
@+Tini
  if extra_mem_bot>sup_main_memory then extra_mem_bot:=sup_main_memory;
  if extra_mem_top>sup_main_memory then extra_mem_top:=sup_main_memory;
  {|mem_top| is an index, |main_memory| a size}
  mem_top := mem_bot + main_memory -1;
  mem_min := mem_bot;
  mem_max := mem_top;

  {Check other constants against their sup and inf.}
  const_chk (trie_size);
  const_chk (hyph_size);
  const_chk (buf_size);
  const_chk (nest_size);
  const_chk (max_in_open);
  const_chk (param_size);
  const_chk (save_size);
  const_chk (stack_size);
  const_chk (dvi_buf_size);
  const_chk (pool_size);
  const_chk (string_vacancies);
  const_chk (pool_free);
  const_chk (max_strings);
  const_chk (strings_free);
  const_chk (font_mem_size);
  const_chk (font_max);
  const_chk (hash_extra);
  if error_line > ssup_error_line then error_line := ssup_error_line;

  {array memory allocation}
  buffer:=xmalloc_array (ASCII_code, buf_size);
  nest:=xmalloc_array (list_state_record, nest_size);
  save_stack:=xmalloc_array (memory_word, save_size);
  input_stack:=xmalloc_array (in_state_record, stack_size);
  input_file:=xmalloc_array (alpha_file, max_in_open);
  line_stack:=xmalloc_array (integer, max_in_open);
  source_filename_stack:=xmalloc_array (str_number, max_in_open);
  full_source_filename_stack:=xmalloc_array (str_number, max_in_open);
  param_stack:=xmalloc_array (halfword, param_size);
  dvi_buf:=xmalloc_array (eight_bits, dvi_buf_size);
  hyph_word :=xmalloc_array (str_number, hyph_size);
  hyph_list :=xmalloc_array (halfword, hyph_size);
  hyph_link :=xmalloc_array (hyph_pointer, hyph_size);
@+Init
  yzmem:=xmalloc_array (memory_word, mem_top - mem_bot + 1);
  zmem := yzmem - mem_bot;   {Some compilers require |mem_bot=0|}
  eqtb_top := eqtb_size+hash_extra;
  if hash_extra=0 then hash_top:=undefined_control_sequence else
        hash_top:=eqtb_top;
  yhash:=xmalloc_array (two_halves,1+hash_top-hash_offset);
  hash:=yhash - hash_offset;   {Some compilers require |hash_offset=0|}
  next(hash_base):=0; text(hash_base):=0;
  for hash_used:=hash_base+1 to hash_top do hash[hash_used]:=hash[hash_base];
  zeqtb:=xmalloc_array (memory_word, eqtb_top);
  eqtb:=zeqtb;

  str_start:=xmalloc_array (pool_pointer, max_strings);
  str_pool:=xmalloc_array (packed_ASCII_code, pool_size);
  font_info:=xmalloc_array (fmemory_word, font_mem_size);
@+Tini
@z

@x [51.1332] l.24215 - INI = VIR, so pool init needs runtime test
@!init if not get_strings_started then goto final_end;
init_prim; {call |primitive| for each primitive}
init_str_ptr:=str_ptr; init_pool_ptr:=pool_ptr; fix_date_and_time;
tini@/
@y
@!Init if not get_strings_started then goto final_end;
init_prim; {call |primitive| for each primitive}
init_str_ptr:=str_ptr; init_pool_ptr:=pool_ptr; fix_date_and_time;
Tini@/
@z

@x [51.1332] l.24225 - main
end_of_TEX: close_files_and_terminate;
final_end: ready_already:=0;
end.
@y
close_files_and_terminate;
final_end: do_final_end;
end {|main_body|};
@z

@x [51.1335] l.24335 - Only do dump if ini.
  begin @!init for c:=top_mark_code to split_bot_mark_code do
@y
  begin @!Init for c:=top_mark_code to split_bot_mark_code do
@z

@x [51.1335] l.24337 - Only do dump if ini.
  store_fmt_file; return;@+tini@/
@y
  store_fmt_file; return;@+Tini@/
@z

@x [51.1337] l.24366 - Dynamic arrays size.
  w_close(fmt_file);
@y
  w_close(fmt_file);
  eqtb:=zeqtb;
@z

@x [51.1337] l.24371 - Allocate hyphenation tries, do char translation
fix_date_and_time;@/
@y
fix_date_and_time;@/

@!init
if trie_not_ready then begin {initex without format loaded}
  trie_trl:=xmalloc_array (trie_pointer, trie_size);
  trie_tro:=xmalloc_array (trie_pointer, trie_size);
  trie_trc:=xmalloc_array (quarterword, trie_size);

  trie_c:=xmalloc_array (packed_ASCII_code, trie_size);
  trie_o:=xmalloc_array (trie_opcode, trie_size);
  trie_l:=xmalloc_array (trie_pointer, trie_size);
  trie_r:=xmalloc_array (trie_pointer, trie_size);
  trie_hash:=xmalloc_array (trie_pointer, trie_size);
  trie_taken:=xmalloc_array (boolean, trie_size);

  trie_root:=0; trie_c[0]:=si(0); trie_ptr:=0;

  {Allocate and initialize font arrays}
  font_check:=xmalloc_array(four_quarters, font_max);
  font_size:=xmalloc_array(scaled, font_max);
  font_dsize:=xmalloc_array(scaled, font_max);
  font_params:=xmalloc_array(font_index, font_max);
  font_name:=xmalloc_array(str_number, font_max);
  font_area:=xmalloc_array(str_number, font_max);
  font_bc:=xmalloc_array(eight_bits, font_max);
  font_ec:=xmalloc_array(eight_bits, font_max);
  font_glue:=xmalloc_array(halfword, font_max);
  hyphen_char:=xmalloc_array(integer, font_max);
  skew_char:=xmalloc_array(integer, font_max);
  bchar_label:=xmalloc_array(font_index, font_max);
  font_bchar:=xmalloc_array(nine_bits, font_max);
  font_false_bchar:=xmalloc_array(nine_bits, font_max);
  char_base:=xmalloc_array(integer, font_max);
  width_base:=xmalloc_array(integer, font_max);
  height_base:=xmalloc_array(integer, font_max);
  depth_base:=xmalloc_array(integer, font_max);
  italic_base:=xmalloc_array(integer, font_max);
  lig_kern_base:=xmalloc_array(integer, font_max);
  kern_base:=xmalloc_array(integer, font_max);
  exten_base:=xmalloc_array(integer, font_max);
  param_base:=xmalloc_array(integer, font_max);

  font_ptr:=null_font; fmem_ptr:=7;
  font_name[null_font]:="nullfont"; font_area[null_font]:="";
  hyphen_char[null_font]:="-"; skew_char[null_font]:=-1;
  bchar_label[null_font]:=non_address;
  font_bchar[null_font]:=non_char; font_false_bchar[null_font]:=non_char;
  font_bc[null_font]:=1; font_ec[null_font]:=0;
  font_size[null_font]:=0; font_dsize[null_font]:=0;
  char_base[null_font]:=0; width_base[null_font]:=0;
  height_base[null_font]:=0; depth_base[null_font]:=0;
  italic_base[null_font]:=0; lig_kern_base[null_font]:=0;
  kern_base[null_font]:=0; exten_base[null_font]:=0;
  font_glue[null_font]:=null; font_params[null_font]:=7;
  param_base[null_font]:=-1;
  for font_k:=0 to 6 do font_info[font_k].sc:=0;
  end;
  tini@/

  font_used:=xmalloc_array (boolean, font_max);
  for font_k:=font_base to font_max do font_used[font_k]:=false;
@z

% [52.1338] Core-dump in debugging mode on 0 input.  Under Unix, it's
% not possible to portably switch into the debugger while a program is
% running.  The best approximation is to do a core dump, then run the
% debugger on it later.
@x [53.1370] l.24770 - \write18{foo}
begin @<Expand macros in the token list
@y
@!d:integer; {number of characters in incomplete current string}
@!clobbered:boolean; {system string is ok?}
@!runsystem_ret:integer; {return value from |runsystem|}
begin @<Expand macros in the token list
@z

@x [54.1376] l.24903 - Add editor-switch variables to globals.
@* \[54] System-dependent changes.
@y
@* \[54/web2c] System-dependent changes for Web2c.
Here are extra variables for Web2c.  (This numbering of the
system-dependent section allows easy integration of Web2c and e-\TeX, etc.)
@^<system dependencies@>

@<Glob...@>=
@!edit_name_start: pool_pointer; {where the filename to switch to starts}
@!edit_name_length,@!edit_line: integer; {what line to start editing at}
@!ipc_on: cinttype; {level of IPC action, 0 for none [default]}
@!stop_at_space: boolean; {whether |more_name| returns false for space}

@ The |edit_name_start| will be set to point into |str_pool| somewhere after
its beginning if \TeX\ is supposed to switch to an editor on exit.

@<Set init...@>=
edit_name_start:=0;
stop_at_space:=true;

@ These are used when we regenerate the representation of the first 256
strings.

@<Global...@> =
@!save_str_ptr: str_number;
@!save_pool_ptr: pool_pointer;
@!shellenabledp: cinttype;
@!restrictedshell: cinttype;
@!output_comment: ^char;
@!k,l: 0..255; {used by `Make the first 256 strings', etc.}

@ When debugging a macro package, it can be useful to see the exact
control sequence names in the format file.  For example, if ten new
csnames appear, it's nice to know what they are, to help pinpoint where
they came from.  (This isn't a truly ``basic'' printing procedure, but
that's a convenient module in which to put it.)

@<Basic printing procedures@> =
procedure print_csnames (hstart:integer; hfinish:integer);
var c,h:integer;
begin
  write_ln(stderr, 'fmtdebug:csnames from ', hstart, ' to ', hfinish, ':');
  for h := hstart to hfinish do begin
    if text(h) > 0 then begin {if have anything at this position}
      for c := str_start[text(h)] to str_start[text(h) + 1] - 1
      do begin
        put_byte(str_pool[c], stderr); {print the characters}
      end;
      write_ln(stderr, '|');
    end;
  end;
end;

@ Are we printing extra info as we read the format file?

@<Glob...@> =
@!debug_format_file: boolean;

@ To be able to determine whether \.{\\write18} is enabled from within
\TeX\ we also implement \.{\\eof18}.  We sort of cheat by having an
additional route |scan_four_bit_int_or_18| which is the same as
|scan_four_bit_int| except it also accepts the value 18.

@<Declare procedures that scan restricted classes of integers@>=
procedure scan_four_bit_int_or_18;
begin scan_int;
if (cur_val<0)or((cur_val>15)and(cur_val<>18)) then
  begin print_err("Bad number");
@.Bad number@>
  help2("Since I expected to read a number between 0 and 15,")@/
    ("I changed this one to zero."); int_error(cur_val); cur_val:=0;
  end;
end;

@ Dumping the |xord|, |xchr|, and |xprn| arrays.  We dump these always
in the format, so a TCX file loaded during format creation can set a
default for users of the format.

@<Dump |xord|, |xchr|, and |xprn|@>=
dump_things(xord[0], 256);
dump_things(xchr[0], 256);
dump_things(xprn[0], 256);

@ Undumping the |xord|, |xchr|, and |xprn| arrays.  This code is more
complicated, because we want to ensure that a TCX file specified on
the command line will override whatever is in the format.  Since the
tcx file has already been loaded, that implies throwing away the data
in the format.  Also, if no |translate_filename| is given, but
|eight_bit_p| is set we have to make all characters printable.

@<Undump |xord|, |xchr|, and |xprn|@>=
if translate_filename then begin
  for k:=0 to 255 do undump_things(dummy_xord, 1);
  for k:=0 to 255 do undump_things(dummy_xchr, 1);
  for k:=0 to 255 do undump_things(dummy_xprn, 1);
  end
else begin
  undump_things(xord[0], 256);
  undump_things(xchr[0], 256);
  undump_things(xprn[0], 256);
  if eight_bit_p then
    for k:=0 to 255 do
      xprn[k]:=1;
end;


@* \[54/web2c-string] The string recycling routines.
\TeX{} uses 2 upto 4 {\it new\/} strings when scanning a filename in an
\.{\\input}, \.{\\openin}, or \.{\\openout} operation.  These strings are
normally lost because the reference to them are not saved after finishing
the operation.  |search_string| searches through the string pool for the
given string and returns either 0 or the found string number.

@<Declare additional routines for string recycling@>=
function search_string(@!search:str_number):str_number;
label found;
var result: str_number;
@!s: str_number; {running index}
@!len: integer; {length of searched string}
begin result:=0; len:=length(search);
if len=0 then  {trivial case}
  begin result:=""; goto found;
  end
else  begin s:=search-1;  {start search with newest string below |s|; |search>1|!}
  while s>255 do  {first 256 strings depend on implementation!!}
    begin if length(s)=len then
      if str_eq_str(s,search) then
        begin result:=s; goto found;
        end;
    decr(s);
    end;
  end;
found:search_string:=result;
end;

@ The following routine is a variant of |make_string|.  It searches
the whole string pool for a string equal to the string currently built
and returns a found string.  Otherwise a new string is created and
returned.  Be cautious, you can not apply |flush_string| to a replaced
string!

@<Declare additional routines for string recycling@>=
function slow_make_string : str_number;
label exit;
var s: str_number; {result of |search_string|}
@!t: str_number; {new string}
begin t:=make_string; s:=search_string(t);
if s>0 then
  begin flush_string; slow_make_string:=s; return;
  end;
slow_make_string:=t;
exit:end;


@* \[54] System-dependent changes.
@z

@x [54.1379] l.24916 - extra routines
@* \[55] Index.
@y

@ @<Declare action procedures for use by |main_control|@>=

@ This function used to be in pdftex, but is useful in tex too.

@p function get_nullstr: str_number;
begin
    get_nullstr := "";
end;

@* \[55] Index.
@z
