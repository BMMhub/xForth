include target/nucleus.fth

hex
\ In bank 0.		Bank 1	Bank 2	Bank 3	Bank 4
00C constant porta	\ trisa	lata	ansela	wpua
00E constant portc	\ trisc	latc	anselc	wpuc

code set-output
   5 status bsf,
   00 movlw,
   00C movwf, \ TRISA
   00E movwf, \ TRISB
   5 status bcf,
end-code

   \ lata = 0
   \ trisa = 0
   \ ansela = 0
   \ latc = 0
   \ trisc = 0
   \ anselc = 0
   \ wpuc = 0
   \ option_reg.wpuen = 1

: !porta   porta c! ;
: !portc   portc c! ;

variable n
variable x

: setup  set-output  6000 n !  2000 x ! ;
: delay   begin 1- dup 0= until drop ;
: led-on   FF !porta  x @ delay ;
: led-off   00 !porta  n @ x @ - delay ;
\ Jump here from COLD.
: warm   then setup begin led-off led-on again ;
