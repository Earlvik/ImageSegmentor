#pragma once
#include "SegImage.h"
#include "library/imebra/include/imebra.h"
#include "Direcory.h"

using namespace std;
using namespace puntoexe;

class DicomImage
{

public:
	void read(char* filename);
	void present(ptr<imebra::image>& presentationImage) const;
	void convert(SegImage* result, int z) const;
	void getSize(unsigned int& cols, unsigned int& rows) const;
	unsigned long getMax() const;
	static SegImage* readDir(Direcory * dir);
private:
	ptr<imebra::dataSet> dataSet;
	static unsigned long max;
};
