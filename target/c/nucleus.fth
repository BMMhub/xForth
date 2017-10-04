0 org

code cold
   warm();
end-code

code drop
   sp++;
end-code

code !
   int *a = (int *)*sp++;
   *a = *sp++;
end-code

code c!
   char *a = (int *)*sp++;
   *a = *sp++;
end-code

code @
   int *a = (int *)*sp;
   *sp = *a;
end-code

code c@
   unsigned char *a = (unsigned char *)*sp;
   *sp = *a;
end-code

code dup
   int x = *sp;
   *--sp = x;
end-code

code nip
end-code

code 2*
   *sp <<= 1;
end-code

code 2/
   *sp >>= 1;
end-code

code xor
   int x = *sp++;
   *sp ^= x;
end-code

code or
   int x = *sp++;
   *sp |= x;
end-code

code and
   int x = *sp++;
   *sp &= x;
end-code

code ?dup
end-code

code swap
end-code

code over
end-code

code >r
end-code

code r>
end-code

code 0=
end-code

code =
end-code

code 0<
end-code

code +
   int x = *sp++;
   *sp += x;
end-code

code 1+
   *sp += 1;
end-code

code cell+
   *sp += sizeof (int);
end-code

code +!
   int *a = (int *)*sp++;
   *a += *sp++;
end-code

code r@
end-code

code negate
   *sp = -*sp;
end-code

: 0<>   0= 0= ;
: -   negate + ;
: <>   - 0<> ;

code bye
   exit(0);
end-code

code panic
   exit(1);
end-code
