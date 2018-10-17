;
; Praktikum1.asm
;

; Assembler Directives
.def temp = r16 ; r16 is our temp var
.def led = r17
.def switch = r21

.ORG 0x000 ; Reset Interrupt Vector
rjmp INIT
; Every other Interupt is unused here

INIT:
	ldi temp, LOW(RAMEND) ; initialize low stack
	out SPL, temp
	ldi temp, HIGH(RAMEND) ; initialize high stack
	out SPH, temp
	ldi temp, 7 ; 0b00000111
	out DDRB, temp ; activate output of the first 3 b pins

	ldi led, 1
	ldi switch, 0
	ldi temp, 1

mainloop:
	out PORTB, led ; load temp into led port
	sbrs switch, 0 ;  if switch == 0
	lsl led ; left shift led
	sbrc switch, 0 ; if switch == 1
	lsr led ; right shift led

	sbrc led, 3 ; is 4th bit set? -> change direction
	rjmp changeDir
	cpi led, 0 ; if led == 0 -> change dir
	brne notequalz
	rjmp changeDir
notequalz:

	rcall wait ; sleep
	rjmp mainloop

changeDir:
	sbrs switch, 0 ; if switch == 0 -> right shift as we're at last led + 1
	lsr led
	sbrc switch, 0 ; if switch == 1 -> set led to 1 as we're at 0
	ldi led, 1
	sbrc switch, 0 ; toggle switch
	rjmp change2
	ldi switch, 1
	rjmp mainloop
change2:
	ldi switch, 0
	rjmp mainloop

wait: ; delay for 1/5s -> 200000 cycles (200ms * 1 MHz)
    ldi r18, 6
    ldi r19,0
    ldi r20,0
L1: 
    dec  r20
    brne L1
    dec  r19
    brne L1
    dec  r18
    brne L1
ret
