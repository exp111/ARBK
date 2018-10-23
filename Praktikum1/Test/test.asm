/*
 * test.asm
 *
 *  Created: 23.10.2018 15:15:09
 *   Author: Tim
 */ 
.def temp = r16

 init:
	ldi temp, 255
	out PORTC, temp
	ldi temp, 255
	out DDRB, temp
	nop

	loop:
	in temp, PINC
	out PORTB, temp
	rjmp loop