#include <iostream>
#include <thread>
#include <mutex>
using namespace std;

mutex mutexLock;

void printLowercase()
{
	mutexLock.lock();
	for (char i = 'a'; i <= 'z'; i++)
	{
		cout << i << endl;
	}
	mutexLock.unlock();
}

void printUppercase()
{
	mutexLock.lock();
	for (char i = 'A'; i <= 'Z'; i++)
	{
		cout << i << endl;
	}
	mutexLock.unlock();
}

void printFourBit()
{
	mutexLock.lock();
	for (int i = 0; i < 32; i++)
	{
		cout << i << endl;
	}
	mutexLock.unlock();
}
int main()
{
	thread t1(printLowercase);
	thread t2(printFourBit);
	thread t3(printUppercase);

	t1.join();
	t2.join();
	t3.join();
	system("PAUSE");
	return 0;
}