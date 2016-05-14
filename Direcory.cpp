#include "Direcory.h"
#include <windows.h>
#include <strsafe.h>
#pragma comment(lib, "User32.lib")

Direcory::Direcory(char* dirpath)
{
	path = dirpath;
	filenames = vector<char*>();
	char* filename;
	WIN32_FIND_DATA ffd;
	TCHAR szDir[MAX_PATH];
	HANDLE hFind = INVALID_HANDLE_VALUE;
	size_t lengthArg;
	DWORD dwError = 0;

	StringCchLength(path, MAX_PATH, &lengthArg);

	if (lengthArg > (MAX_PATH - 1))
	{
		throw invalid_argument("Path too long");
	}

	StringCchCopy(szDir, MAX_PATH, path);
	StringCchCat(szDir, MAX_PATH, TEXT("\\*"));

	hFind = FindFirstFile(szDir, &ffd);

	if (INVALID_HANDLE_VALUE == hFind)
	{
		throw invalid_argument("Directory not found");
	}

	BOOL flag = true;

	do
	{
		if (!(ffd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)) {
			filename = new char[strlen(ffd.cFileName) + 1];
			strcpy(filename, ffd.cFileName);
			filenames.push_back(filename);
		}
		flag = FindNextFile(hFind, &ffd);
	} while (flag);

	dwError = GetLastError();
	if (dwError != ERROR_NO_MORE_FILES)
	{
		throw invalid_argument("Error reading files");
	}
}
