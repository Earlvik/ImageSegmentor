#include "DicomImage.h"
#include <iostream>

using namespace puntoexe;

unsigned long DicomImage::max;

void DicomImage::read(char* filename)
{
	ptr<stream> readStream(new stream);
	readStream->openFile(filename, std::ios::in);
	ptr<streamReader> reader(new streamReader(readStream));
	dataSet = imebra::codecs::codecFactory::getCodecFactory()->load(reader);
}

void DicomImage::present(ptr<imebra::image>& presentationImage) const
{
	ptr<imebra::image> firstImage = dataSet->getImage(0);

	ptr<imebra::transforms::transform> modVOILUT(
		new imebra::transforms::modalityVOILUT(dataSet));
	imbxUint32 width, height;
	firstImage->getSize(&width, &height);
	ptr<imebra::image> convertedImage(modVOILUT->allocateOutputImage(firstImage, width, height));
	modVOILUT->runTransform(firstImage, 0, 0, width, height, convertedImage, 0, 0);

	ptr<imebra::transforms::VOILUT> myVoiLut(new imebra::transforms::VOILUT(dataSet));

	// Apply the first VOI or LUT
	imbxUint32 lutId = myVoiLut->getVOILUTId(0);
	myVoiLut->setVOILUT(lutId);

	presentationImage = myVoiLut->allocateOutputImage(convertedImage, width, height);
	myVoiLut->runTransform(convertedImage, 0, 0, width, height, presentationImage, 0, 0);
}

void DicomImage::convert(SegImage* result, int z) const
{
	ptr<imebra::image> presentationImage;
	present(presentationImage);
	// Retrieve the image's size in pixels
	imbxUint32 sizeX, sizeY;
	presentationImage->getSize(&sizeX, &sizeY);

	imbxUint32 rowSize, channelPixelSize, channelsNumber;
	ptr<imebra::handlers::dataHandlerNumericBase> myHandler = presentationImage->getDataHandler(false, &rowSize, &channelPixelSize, &channelsNumber);

	int index = 0;
	for (imbxUint32 scanY = 0; scanY < sizeY; ++scanY)
	{
		// Scan all the columns
		for (imbxUint32 scanX = 0; scanX < sizeX; ++scanX)
		{

			result->setVoxel(scanX, scanY, z, 255 * (double(myHandler->getUnsignedLong(index++))/double(max)));
		}
	}
}

void DicomImage::getSize(unsigned int& cols, unsigned int& rows) const
{
	ptr<imebra::image> presentationImage;
	present(presentationImage);
	// Retrieve the image's size in pixels
	presentationImage->getSize(&cols, &rows);
}

unsigned long DicomImage::getMax() const
{
	ptr<imebra::image> presentationImage;
	present(presentationImage);
	// Retrieve the image's size in pixels
	imbxUint32 sizeX, sizeY;
	presentationImage->getSize(&sizeX, &sizeY);

	imbxUint32 rowSize, channelPixelSize, channelsNumber;
	ptr<imebra::handlers::dataHandlerNumericBase> myHandler = presentationImage->getDataHandler(false, &rowSize, &channelPixelSize, &channelsNumber);
	unsigned long maxL = 0;
	unsigned long cur;

	int index = 0;
	for (imbxUint32 scanY = 0; scanY < sizeY; ++scanY)
	{
		// Scan all the columns
		for (imbxUint32 scanX = 0; scanX < sizeX; ++scanX)
		{

			cur = myHandler->getUnsignedLong(index++);
			if (cur > maxL) maxL = cur;
		}
	}
	return maxL;
}

SegImage* DicomImage::readDir(Direcory* dir)
{
	DicomImage storage;
	char* firstFile = dir->filenames.front();
	storage.read(const_cast<char*>((string(dir->path) + "\\" + string(firstFile)).c_str()));
	unsigned int cols, rows;
	storage.getSize(cols, rows);
	SegImage* result = new SegImage(rows, cols, dir->filenames.size(), true);
	max = 0;
	unsigned long cur;
	for (int i = 0; i < dir->filenames.size(); i++)
	{
		storage.read(const_cast<char*>((string(dir->path) + "\\" + string(dir->filenames.at(i))).c_str()));
		cur = storage.getMax();
		if (cur > max) max = cur;
	}
	for (int i = 0; i < dir->filenames.size(); i++)
	{
		storage.read(const_cast<char*>((string(dir->path) + "\\" + string(dir->filenames.at(i))).c_str()));
		storage.convert(result, i);
	}
	return result;
}
