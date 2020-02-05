#!/usr/bin/perl -n
BEGIN { open F,">texd.h" }
if (!$flag) {
  print F "EXTERN " unless (/^#/ || /^$/ || /^}/ || /^ / || /^typedef/)
}
print F;
if (/coerce.h/) {
  open F,">tex.c";
  print F qq(#define EXTERN extern\n);
  print F qq(#include "texd.h"\n);
  $flag=1
}
