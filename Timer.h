#pragma once
#include<time.h>

class Timer
{
public:
	void start(char* name);
	void stage(char* name);
	void total() const;
	void stop();
private:
	double _start=0;
	double _total=0;
};
