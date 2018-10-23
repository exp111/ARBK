#pragma once
#include <mutex>
#include <condition_variable>

class Semaphore
{
public:
	Semaphore(int n = 1) : value{n} {}

private:
	int value = 1; //max threads running at the same time
	std::condition_variable cvar;
	std::mutex mtx;

public:

	void P()
	{
		std::unique_lock<std::mutex> lock(mtx);

		value--;
		int startValue = value;
		if (value < 0)
			cvar.wait(lock);
		/*while (value <= startValue && value < 0)
		{
			Sleep(1);
		}*/
	}

	void V()
	{
		value++;
	}
};