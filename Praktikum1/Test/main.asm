;
; Test.asm
;
; Created: 23.10.2018 14:23:03
; Author : Tim
;
.def temp = r16

.ORG 0
rjmp start
.ORG INT0
rjmp gelb
; Replace with your application code
start:
; Init Stack
	ldi temp, LOW(RAMEND)
	out SPL, temp
	ldi temp, HIGH(RAMEND)
	out SPH, temp
	; Set B0 & B1 to out
    ldi temp, 3
	out DDRB, temp
	; Enable int0
	ldi temp, 64
	out GICR, temp

	sei
	ldi temp, 1
	out PORTB, temp
loop:
	rjmp loop

gelb:
	ldi temp, 2
	out PORTB, temp
	reti
