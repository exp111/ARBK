;
; Praktikum3.asm
;

; Assembler Directives
.def temp = r16 ; r16 is our temp var
.def led = r17

.ORG 0x000 ; Reset Interrupt Vector
rjmp INIT
; Every other Interupt is unused here

INIT:
	ldi temp, LOW(RAMEND) ; initialize low stack
	out SPL, temp
	ldi temp, HIGH(RAMEND) ; initialize high stack
	out SPH, temp
	ldi temp, 3 ; 0b00000011
	out DDRB, temp ; set b0 & b1 to out

	ldi led, 0
	
loop:
	mov temp, led
	out PORTB, temp
	rcall wait
	clr temp
	out PORTB, temp
	rjmp check

check:
	in temp, PORTB
	sbrc temp, 2
	ldi led, 1
	sbrc temp, 3
	ldi led, 3
	rjmp loop

wait: ; delay for 1/5s -> 200000 cycles (200ms * 1 MHz)
    ldi r18, 6
    ldi r19, 0
    ldi r20, 0
L1: 
    dec  r20
    brne L1
    dec  r19
    brne L1
    dec  r18
    brne L1
ret
