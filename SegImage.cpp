#include <iostream>
#include "SegImage.h"
#include <string>
#include <fstream>
#include <windows.h>

using namespace std;



SegImage::SegImage(int numRows, int numCols, int numSlices, bool init): volume(-1)
{
	values = new unsigned char**[numCols];
	slices = numSlices;
	rows = numRows;
	cols = numCols;
	for (int i = 0; i < cols; i++)
	{
		values[i] = new unsigned char*[rows];
		for (int j = 0; j < rows; j++)
		{
			values[i][j] = new unsigned char[slices];
			if (init) {
				for (int k = 0; k < slices; k++)
				{
					values[i][j][k] = 0;
				}
			}
		}
	}
}

SegImage::~SegImage()
{
	for (int i = 0; i < cols; i++)
	{
		for (int j = 0; j < rows; j++)
		{
			delete[] values[i][j];
		}
		delete[] values[i];
	}
	delete[] values;
}

void SegImage::setVoxel(int x, int y, int z, unsigned char value) const
{
	if (inBounds(x, y, z))
	{
		values[x][y][z] = value;
	} else
	{
		throw invalid_argument("indices out of bounds: " + to_string(x) + " " +to_string(y) + " " + to_string(z));
	}
}

unsigned char SegImage::getVoxel(int x, int y, int z) const
{
	if (inBounds(x, y, z))
	{
		return values[x][y][z];
	}
	throw invalid_argument("indices out of bounds: " + to_string(x) + " " + to_string(y) + " " + to_string(z));
}

void SegImage::getSize(int& x, int& y, int& z) const
{
	x = cols;
	y = rows;
	z = slices;
}

SegImage* SegImage::getRegion(int ulcx, int ulcy, int lrfx, int lrfy, int ulcz, int lrfz) const
{
	if (!inBounds(ulcx, ulcy, ulcz) || !inBounds(lrfx, lrfy, lrfz))
	{
		throw invalid_argument("indices out of bounds");
	}
	int numCols = lrfx - ulcx + 1;
	int numRows = lrfy - ulcy + 1;
	int numSlices = lrfz - ulcz + 1;
	SegImage* result = new SegImage(numRows, numCols, numSlices, false);
	for (int i = 0; i < numCols; i++)
	{
		for (int j = 0; j < numRows; j++)
		{
			for (int k = 0; k < numSlices; k++)
			{
				result->setVoxel(i, j, k, getVoxel(ulcx + i, ulcy + j, ulcz + k));
			}
		}
	}
	return result;
}

SegImage* SegImage::deserialize(char* filename)
{
	unsigned char *charImage;
	ifstream ifs;
	char line[100], *ptr;
	int cols, rows, slices, val;

	ifs.open(filename, ios::in | ios::binary);

	if (!ifs)
	{
		throw invalid_argument("cannot open file");
	}
	ifs.getline(line, 100, '\n');
	cols = strtol(line, &ptr, 0);
	ifs.getline(line, 100, '\n');
	rows = strtol(line, &ptr, 0);
	ifs.getline(line, 100, '\n');
	slices = strtol(line, &ptr, 0);
	charImage = static_cast<unsigned char *>(new unsigned char[rows * cols * slices]);
	ifs.read(reinterpret_cast<char *>(charImage), (rows*cols*slices)*sizeof(unsigned char));
	if (ifs.fail())
	{
		throw invalid_argument("cannot read image");
	}

	SegImage* result = new SegImage(rows, cols, slices, false);
	for (int i = 0; i < cols; i++)
	{
		for (int j = 0; j < rows; j++)
		{
			for (int k = 0; k < slices; k++)
			{
				val = charImage[i*slices*rows + j*slices + k];
				result->setVoxel(i, j, k, val);
			}
		}
	}
	delete[] charImage;
	ifs.close();
	return result;
}

void SegImage::serialize(char* filename) const
{
	ofstream ofs;
	unsigned char *charImage = new unsigned char [cols*rows*slices];
	for (int i = 0; i < cols; i++)
	{
		for (int j = 0; j < rows; j++)
		{
			for (int k = 0; k < slices; k++)
			{
				charImage[i*slices*rows + j*slices + k] = static_cast<unsigned char>(getVoxel(i, j, k));
			}
		}
	}

	ofs.open(filename, ios::out | ios::binary);
	if (!ofs)
	{
		throw invalid_argument("cannot open file");
	}

	ofs << cols << endl << rows << endl << slices << endl;
	ofs.write(reinterpret_cast<char *>(charImage), (rows*cols*slices)*sizeof(unsigned char));
	if (ofs.fail())
	{
		throw invalid_argument("cannot write image");
	}

	ofs.close();
	delete[] charImage;
}

void SegImage::saveSlice(int slice, const char* filename) const
{
	BITMAPFILEHEADER bitmapFileHeader;
	memset(&bitmapFileHeader, 0xff, sizeof(BITMAPFILEHEADER));
	bitmapFileHeader.bfType = ('B' | 'M' << 8);
	bitmapFileHeader.bfOffBits = sizeof(BITMAPFILEHEADER) + sizeof(BITMAPINFOHEADER);
	bitmapFileHeader.bfSize = bitmapFileHeader.bfOffBits + (cols + (cols % 4 ? (4 - cols % 4) : 0)) * rows; // multiply by 3 if you wanna switch to RGB

	BITMAPINFOHEADER bitmapInfoHeader;
	memset(&bitmapInfoHeader, 0, sizeof(BITMAPINFOHEADER));
	bitmapInfoHeader.biSize = sizeof(BITMAPINFOHEADER);
	bitmapInfoHeader.biWidth = cols;
	bitmapInfoHeader.biHeight = rows;
	bitmapInfoHeader.biPlanes = 1;
	bitmapInfoHeader.biBitCount = 8; // this means grayscale, change to 24 if you wanna switch to RGB

	ofstream file(filename, ios::binary);

	file.write(reinterpret_cast< char * >(&bitmapFileHeader), sizeof(bitmapFileHeader));
	file.write(reinterpret_cast< char * >(&bitmapInfoHeader), sizeof(bitmapInfoHeader));

	// bitmaps grayscale must have a table of colors... don't write this table if you want RGB
	unsigned char grayscale[4];

	for (int i(0); i < 256; ++i)
	{
		memset(grayscale, i, sizeof(grayscale));
		file.write(reinterpret_cast< char * >(grayscale), sizeof(grayscale));
	}

	unsigned char pixel[1]; // do pixel[ 3 ] if you want RGB

	for (int y = 0; y < rows; ++y)
	{
		for (int x = 0; x < cols + (cols % 4 ? (4 - cols % 4) : 0); ++x) // + ( p_width % 4 ? ( 4 - p_width % 4 ) : 0 ) because BMP has a padding of 4 bytes per line
		{
			if (x >= cols)
			{
				pixel[0] = 0; // this is just padding
				file.write(reinterpret_cast< char * >(pixel), sizeof(pixel));
			}
			else
			{
				pixel[0] = values[x][y][slice];
				file.write(reinterpret_cast< char * >(pixel), sizeof(pixel));
			}
		}
	}

	file.close();
}

void SegImage::saveSeries(const char* name) const
{
	if (CreateDirectory(name, NULL) || ERROR_ALREADY_EXISTS == GetLastError())
	{
		for (int i = 0; i < slices; i++)
		{
			saveSlice(i, (string(name) + "\\" + to_string(i) + ".bmp").c_str());
		}
	} else
	{
		throw "Unable to write files";
	}
}

void SegImage::threshold(unsigned char level)
{
	for (int i = 0; i < cols; i++)
	{
		for (int j = 0; j < rows; j++)
		{
			for (int k = 0; k < slices; k++)
			{
				values[i][j][k] = values[i][j][k] > level ? 255 : 0;
			}
		}
	}

}

bool SegImage::inNarrowBounds(int x, int y, int z) const
{
	if (x > 4 && y > 4 && z > 4 && x < cols - 4 && y < rows - 4 && z < slices - 4)
	{
		return true;
	}
	return false;
}

int SegImage::getVolume()
{
		volume = 0;
		for (int i = 0; i < cols; i++)
		{
			for (int j = 0; j < rows; j++)
			{
				for (int k = 0; k < slices; k++)
				{
					if (values[i][j][k] > 0)
					{
						volume++;
					}
				}
			}
		}
	return volume;
}

SegImage* SegImage::copy() const
{
	SegImage* result = new SegImage(rows, cols, slices, false);
	for (int i = 0; i < cols; i++)
	{
		for (int j = 0; j < rows; j++)
		{
			for (int k = 0; k < slices; k++)
			{
				result->values[i][j][k] = values[i][j][k];
			}
		}
	}
	return result;
}

bool SegImage::inBounds(int x, int y, int z) const
{
	if (x > 0 && y > 0 && z > 0 && x < cols && y < rows, z < slices)
	{
		return true;
	}
	return false;
} 
