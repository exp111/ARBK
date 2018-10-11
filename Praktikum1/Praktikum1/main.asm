;
; Praktikum1.asm
;
; Created: 10.10.2018 15:44:21
; Author : theex
;

; Assembler Directives
.def temp = r16 ; r16 is our temp var
.def led = r17

; INIT
	ldi temp, LOW(RAMEND) ; initialize low stack
	out SPL, temp
	ldi temp, HIGH(RAMEND) ; initialize high stack
	out SPH, temp
	ldi temp, 7 ; 0b00000111
	out DDRB, temp ; activate output of the first 3 b pins

	ldi led, 1

mainloop:
	out PORTB, led ; load temp into led port
	lsl led ; left shift temp
	sbrc led, 3 ; is 4th bit set? -> reset temp
	ldi led, 1

	rcall wait ; sleep
	rjmp mainloop

wait: ; delay for 1/5s -> ~25000 cycles (200ms * 0.125 MHz)
    ldi  r18, 33
    ldi  r19, 119
L1: dec  r19
    brne L1
    dec  r18
    brne L1
ret
