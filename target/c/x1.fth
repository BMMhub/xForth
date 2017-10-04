\ C backend.


only forth

hex 0200 ram-dp ! decimal

also meta definitions also assembler

: name,   dup , ", ;
: .header   ." static void " 2dup type ." (void) {" cr ;
: header,   .header 2dup header, name, ;

: t-type   0 ?do c@+ emit loop drop ;

: comp,   ."   " @+ t-type ." ();" cr ;

: branch?,   ;

: t-num   ."   *--sp = " (.) ." ;" cr ;

: prologue, ;
: end-target   ." int main (void) { cold(); return 0; }" cr ;

.( static int dstack[32], rstack[32]; ) cr
.( static int *sp = dstack + sizeof dstack; ) cr
.( static int *rp = rstack + sizeof rstack; ) cr
.( static void warm (void) char ) emit .( ; ) cr
