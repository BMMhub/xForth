\ Copyright 2017 Lars Brinkhoff.

\ Forth cross compiler.


: h: : ;

variable ram-dp
: ram-here   ram-dp @ ;
: ram-allot   ram-dp +! ;

0 value latest

include target/params.fth
include lib/meta.fth

only forth also meta definitions

include target/asm.fth

: header, ( a u -- ) here t-word  here to latest ;

include target/x1.fth

also forth
' comp, is t-compile,
' t-num is t-literal

host also meta definitions

h: :   parse-name header, prologue, ] ;
h: constant   t-constant ;
h: variable   ram-here t-constant  t-cell ram-allot ;

h: code   parse-name header,  also assembler ;
h: end-code   previous ;

only forth also meta also compiler definitions previous
include target/x2.fth

h: ;   [compile] exit [compile] [ ;
h: [']   ' t-literal ;
h: [char]   char t-literal ;
h: literal   t-literal ;

t-cell t-constant cell

target

include src/kernel.fth

end-target

only forth also meta also t-words resolve-all-forward-refs

only forth also meta save-target
