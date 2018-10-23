#include <iostream>
#include <thread>
#include <mutex>
#include "semaphore.h"
using namespace std;

mutex mutexLock;
Semaphore sem(1);

void printLowercase()
{
	//mutexLock.lock();
	sem.P();
	for (char i = 'a'; i <= 'z'; i++)
	{
		cout << i << endl;
	}
	sem.V();
	//mutexLock.unlock();
}

void printFourBit()
{
	//mutexLock.lock();
	sem.P();
	for (int i = 0; i <= 32; i++)
	{
		cout << i << endl;
	}
	sem.V();
	//mutexLock.unlock();
}

void printUppercase()
{
	//mutexLock.lock();
	sem.P();
	for (char i = 'A'; i <= 'Z'; i++)
	{
		cout << i << endl;
	}
	sem.V();
	//mutexLock.unlock();
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