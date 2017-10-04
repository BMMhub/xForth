also assembler
h: exit   ." }" cr ;

h: if   ;
h: ahead   ;
h: then   ;
h: else   ;

h: begin   ;
h: again   ;
h: until   ;
h: while   ;
h: repeat   ;
previous

only forth definitions

: more?   refill 0= abort" End of file inside CODE."
   source s" end-code" compare ;
: code-lines   begin more? while source type cr repeat ." }" cr ;

also meta definitions

h: code    code code-lines ;

only forth also meta also compiler definitions previous
