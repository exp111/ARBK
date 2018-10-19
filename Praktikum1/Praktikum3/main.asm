;
; Praktikum3.asm
;

; Assembler Directives
.def temp = r16 ; r16 is our temp var
.def led = r17
.def switch = r21

.ORG 0x000 ; Reset Interrupt Vector
rjmp INIT
.ORG INT0
rjmp blinkGelb
.ORG INT1
rjmp blinkRot
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
	rjmp loop

blinkGelb:
	clr led
	rcall wait ; sleep
	ldi led, 1
	rcall wait ; sleep
	rjmp blinkGelb

blinkRot:
	clr led
	rcall wait ; sleep
	ldi led, 2
	rcall wait ; sleep
	rjmp blinkRot

wait: ; delay for 1/5s -> 200000 cycles (200ms * 1 MHz)
	out PORTB, led
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
