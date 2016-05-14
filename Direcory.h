#pragma once
#include <vector>

using namespace std;

class Direcory
{
public:
	Direcory(char* dirpath);
	vector<char*> filenames;
	char* path;
};
