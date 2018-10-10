;
; Praktikum1.asm
;
; Created: 10.10.2018 15:44:21
; Author : theex
;

.def temp = r16 ; r16 is our temp var

ldi temp, LOW(RAMEND) ; initialize low stack
out SPL, temp
ldi temp, HIGH(RAMEND) ; initialize high stack
out SPH, temp
ldi temp, 7 ; 00000111
out DDRB, temp

ldi temp, 1

mainloop:
out PORTB, temp ; load temp into led port
lsl temp ; left shift temp
sbrc temp, 3 ; is 4th bit set? -> reset temp
ldi temp, 1

rcall wait ; sleep
rjmp mainloop

wait:

ret
