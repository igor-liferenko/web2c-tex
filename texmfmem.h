/* texmfmem.h: the memory_word type, which is too hard to translate
   automatically from Pascal.  We have to make sure the byte-swapping
   that the (un)dumping routines do suffices to put things in the right
   place in memory.

   A memory_word can be broken up into a `twohalves' or a
   `fourquarters', and a `twohalves' can be further broken up.  Here is
   a picture.  ..._M = most significant byte, ..._L = least significant
   byte.
   
   The halfword fields are four bytes if we are building a big TeX or MF;
   this leads to further complications:
   
   twohalves.v:  LH_LL LH_LM LH_ML LH_MM RH_LL RH_LM RH_ML RH_MM
   twohalves.u:  B1          B0
   fourquarters: ---------JUNK----------  B3    B2    B1    B0

   I guess TeX never refers to the B1 and B0 in the
   fourquarters structure as the B1 and B0 in the twohalves.u structure.
   
   The B0 and B1 fields are declared short instead of quarterword,
   because they are used in character nodes to store a font number and a
   character.  If left as a quarterword (which is a single byte), we
   couldn't support more than 256 fonts. (If shorts aren't two bytes,
   this will lose.)
   
   In the old four-byte memory structure (something more needs to be
   done to handle >256 fonts):
   
   twohalves.v:  LH_L  LH_M  RH_L  RH_M
   twohalves.u:    B1    B0  JNK1  JNK2
   fourquarters:   B3    B2    B1    B0
   
   This file can't be part of texmf.h, because texmf.h gets included by
   texd.h before the `halfword' etc. types are defined.  So we
   include it from the change file instead.
*/

typedef union
{
  struct
  {
    halfword LH, RH;
  } v;
  struct
  { /* Make B0,B1 overlap the most significant bytes of LH.  */
    short B1, B0;
  } u;
} twohalves;

typedef struct
{
  struct
  {
    quarterword B3, B2, B1, B0;
  } u;
} fourquarters;

typedef union
{
  glueratio gr;
  twohalves hh;
  struct
  {
    halfword junk; /* big TeX */
    integer CINT;
  } u;
  struct
  {
    halfword junk; /* big TeX */
    fourquarters QQQQ;
  } v;
} memoryword;

/* fmemory_word for font_list; needs to be only four bytes.  This saves
   significant space in the .fmt files. (Not true in XeTeX, actually!) */
typedef union
{
  struct
  {
    integer CINT;
  } u;
  struct
  {
    fourquarters QQQQ;
  } v;
} fmemoryword;

/* To keep the original structure accesses working, we must go through
   the extra names C forced us to introduce.  */
#define	b0 u.B0
#define	b1 u.B1
#define	b2 u.B2
#define	b3 u.B3

#define rh v.RH
#define lhfield	v.LH
#define cint u.CINT
#define qqqq v.QQQQ

