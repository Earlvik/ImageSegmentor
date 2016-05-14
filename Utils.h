#pragma once
#include <armadillo>
#include "SegImage.h"
#include <opencv2/core/core.hpp>

using namespace arma;

class Utils
{
public:
	static cube conv3(cube body, cube kernel);
	static cube sobelKernel(int smallValue, int bigValue);
	static cube sphere(int radius);
	static cube convert(SegImage* image);
	static cube convert_d(SegImage* image);
	static SegImage* convert(cube cube);
	static cube open(cube body, cube kernel);
	static cube close(cube body, cube kernel);
	static cube dilate(cube body, cube kernel);
	static cube erode(cube body, cube kernel);
	static void bounds(cube body, int& minx, int& miny, int& minz, int& maxx, int& maxy, int& maxz);
	static void convert_cv(SegImage* image, int z, cv::Mat &result);
	static void combine(SegImage* base, SegImage* mask, int z, cv::Mat &result);
};
