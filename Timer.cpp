#include "Timer.h"
#include <iostream>

using namespace std;

void Timer::start(char* name)
{
	std::cout << "Start " << name << endl;
	_start = double(clock());
}

void Timer::stage(char* name)
{
	double finish = double(clock());
	double time = finish - _start;
	_total += time;
	cout << name << " Time: " << time << " Total: " << _total << endl;
	_start = finish;
}

void Timer::total() const
{
	cout << _total << endl;
}

void Timer::stop()
{
	cout << "Finish " << "Total: " << _total + double(clock()) - _start << endl;
	_total = 0;
	_start = 0;
}
