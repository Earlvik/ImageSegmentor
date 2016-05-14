#pragma once

class SegImage
{
public:
	SegImage(int numRows, int numCols, int numSlices, bool init);
	~SegImage();
	void setVoxel(int x, int y, int z, unsigned char value) const;
	unsigned char getVoxel(int x, int y, int z) const;
	void getSize(int &x, int &y, int &z) const;
	// Get a sub-image
	// ulc - upper left closest voxel, ltf - lower right farthest voxel of an image region
	SegImage* getRegion(int ulcx, int ulcy, int lrfx, int lrfy, int ulcz, int lrfz) const;
	static SegImage* deserialize(char* filename);
	void serialize(char* filename) const;
	void saveSlice(int slice, const char* filename) const;
	void saveSeries(const char* name) const;
	void threshold(unsigned char level);
	bool inNarrowBounds(int x, int y, int z) const;
	int getVolume();
	SegImage* copy() const;
private:
	bool inBounds(int x, int y, int z) const;
	int rows, cols, slices, volume;
	unsigned char ***values;
};

//#pragma pack( push, 2 ) 
//
//struct BITMAPFILEHEADER
//{
//	unsigned short  bfType;
//	unsigned int    bfSize;
//	unsigned short  bfReserved1;
//	unsigned short  bfReserved2;
//	unsigned int    bfOffBits;
//};
//
//struct BITMAPINFOHEADER
//{
//	unsigned int    biSize;
//	int             biWidth;
//	int             biHeight;
//	unsigned short  biPlanes;
//	unsigned short  biBitCount;
//	unsigned int    biCompression;
//	unsigned int    biSizeImage;
//	int             biXPelsPerMeter;
//	int             biYPelsPerMeter;
//	unsigned int    biClrUsed;
//	unsigned int    biClrImportant;
//};
//
//#pragma pack() 
