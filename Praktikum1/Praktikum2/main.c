/*
 * Praktikum2.c
 *
 * Created: 17.10.2018 09:29:32
 * Author : Tim
 */ 

#include <avr/io.h>
#define F_CPU 1000000UL
#include <util/delay.h>

int main(void)
{
	DDRB = 7;
	unsigned char value = 1;
	int toggle = 0;
	while (1) 
	{
		PORTB = value;
		if (value >= 4 || (value == 1 && toggle == 1))
		{
			toggle = toggle == 0 ? 1: 0;
		}
		if (toggle == 0)
		{
			value = (value << 1);
		}
		else
		{
			value = (value >> 1);
		}
		
		_delay_ms(800);
	}
	return 0;
}
