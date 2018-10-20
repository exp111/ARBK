#pragma once

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

		}
	}

	void V()
	{
		value++;
	}
};