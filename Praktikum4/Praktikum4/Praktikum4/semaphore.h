#pragma once
#include <Windows.h>

class Semaphore
{
public:
	Semaphore(int n = 1) : value{n} {};
private:
	int value = 1; //max threads running at the same time
public:
	void P()
	{
		value--;
		int startValue = value;
		while (value <= startValue && value < 0)
		{
			Sleep(1);
		}
	}

	void V()
	{
		value++;
	}
};