#include "Utils.h"

cube Utils::conv3(cube body, cube kernel)
{
	if (body.max() <= 0)
	{
		return zeros(body.n_rows, body.n_cols, body.n_slices);
	}
	cube Q(body);
	for (int i = 1; i < body.n_slices - 1; i++)
	{
		Q.slice(i) = conv2(body.slice(i), kernel.slice(1), "same") +
			conv2(body.slice(i - 1), kernel.slice(0), "same") +
			conv2(body.slice(i + 1), kernel.slice(2), "same");
	}
	return Q;
}

cube Utils::sobelKernel(int smallValue, int bigValue)
{
	cube Q(3, 3, 3);
	vec3 v;
	v << smallValue << bigValue << smallValue;
	mat33 kernel = v * v.t();
	Q.slice(0) = kernel;
	Q.slice(2) = kernel;
	Q.slice(1) = 2 * kernel;
	return Q;
}

cube Utils::sphere(int radius)
{
	int size = 2 * radius + 2;
	cube Q = zeros(size, size, size);
	int center = radius + 1;
	for (int i = 0; i < size; i++)
	{
		for (int j = 0; j < size; j++)
		{
			for (int k = 0; k < size; k++)
			{
				if (pow(i - center,2) + pow(j - center,2) + pow(k - center,2) < pow(radius, 2))
				{
					Q(i, j, k) = 1.0;
				}
			}
		}
	}
	return Q;
}

cube Utils::convert(SegImage* image)
{
	int cols, rows, slices;
	image->getSize(cols, rows, slices);
	cube Q(rows, cols, slices);
	for (int i = 0; i < cols; i++)
	{
		for (int j = 0; j < rows; j++)
		{
			for (int k = 0; k < slices; k++)
			{
				Q(j, i, k) = double(image->getVoxel(i, j, k)) / 255.0;
			}
		}
	}
	return Q;
}

cube Utils::convert_d(SegImage* image)
{
	cube result = convert(image);
	delete image;
	return result;
}

SegImage* Utils::convert(cube cube)
{
	SegImage* image = new SegImage(cube.n_rows, cube.n_cols, cube.n_slices, false);
	for (int i = 0; i < cube.n_cols; i++)
	{
		for (int j = 0; j < cube.n_rows; j++)
		{
			for (int k = 0; k < cube.n_slices; k++)
			{
				image->setVoxel(i, j, k, cube(j, i, k) * 255);
			}
		}
	}
	return image;
}

cube Utils::open(cube body, cube kernel)
{
	return dilate(erode(body, kernel), kernel);
}

cube Utils::close(cube body, cube kernel)
{
	return erode(dilate(body, kernel), kernel);
}

cube Utils::dilate(cube body, cube kernel)
{
	int minx, miny, minz, maxx, maxy, maxz;
	Utils::bounds(body, minx, miny, minz, maxx, maxy, maxz);
	cube result = cube(body);
	int size_x = kernel.n_cols / 2;
	int size_y = kernel.n_rows / 2;
	int size_z = kernel.n_slices / 2;
	maxx -= kernel.n_cols;
	maxy -= kernel.n_rows;
	maxz -= kernel.n_slices;   
	for (int i = minx; i <= maxx; i++)
	{
		for (int j = miny; j <= maxy; j++)
		{
			for (int k = minz; k <= maxz; k++)
			{
				cube subcube = body.subcube(j, i, k, size(kernel));
				subcube += kernel;
				result(j + size_y, i + size_x, k + size_z) = subcube.max() > 1 ? 1 : 0;
			}
		}
	}
	return result;
}

cube Utils::erode(cube body, cube kernel)
{
	int minx, miny, minz, maxx, maxy, maxz;
	Utils::bounds(body, minx, miny, minz, maxx, maxy, maxz);
	cube result = cube(body);
	int size_x = kernel.n_cols / 2;
	int size_y = kernel.n_rows / 2;
	int size_z = kernel.n_slices / 2;
	maxx -= kernel.n_cols;
	maxy -= kernel.n_rows;
	maxz -= kernel.n_slices;
	for (int i = minx; i <= maxx; i++)
	{
		for (int j = miny; j <= maxy; j++)
		{
			for (int k = minz; k <= maxz; k++)
			{
				cube subcube = body.subcube(j, i, k, size(kernel));
				subcube -= kernel;
				result(j + size_y, i + size_x, k + size_z) = subcube.min() < 0 ? 0 : 1;
			}
		}
	}
	return result;
}

void Utils::bounds(cube body, int& minx, int& miny, int& minz, int& maxx, int& maxy, int& maxz)
{
	miny = find(sum(sum(body, 2), 1), 1)(0,0) - 1;
	maxy = find(sum(sum(body, 2), 1), 1, "last")(0, 0) + 1;
	minx = find(sum(sum(body, 0), 2), 1)(0, 0) - 1;
	maxx = find(sum(sum(body, 0), 2), 1, "last")(0, 0) + 1;
	minz = find(sum(sum(body, 1)), 1)(0, 0) - 1;
	maxz = find(sum(sum(body, 1)), 1, "last")(0, 0) + 1;

	if (minx < 0) minx = 0;
	if (maxx < 0) maxx = 0;
	if (miny < 0) miny = 0;
	if (maxy < 0) maxy = 0;
	if (minz < 0) minz = 0;
	if (maxz < 0) maxz = 0;
}

void Utils::convert_cv(SegImage* image, int z, cv::Mat &result)
{
	int cols, rows, slices;
	image->getSize(cols, rows, slices);
	result = cv::Mat(rows, cols, CV_8UC1);
	for (int i = 0; i < cols; i++)
	{
		for (int j = 0; j < rows; j++)
		{
			result.at<unsigned char>(rows-j-1, i) = image->getVoxel(i, j, z);
		}
	}
}

void Utils::combine(SegImage* base, SegImage* mask, int z, cv::Mat& result)
{
	int cols, rows, slices;
	base->getSize(cols, rows, slices);
	result = cv::Mat(rows, cols, CV_8UC3);
	unsigned char b, m;
	for (int i = 0; i < cols; i++)
	{
		for (int j = 0; j < rows; j++)
		{
			b = base->getVoxel(i, j, z);
			m = mask->getVoxel(i, j, z);
			result.at<cv::Vec3b>(rows - j - 1, i) = m > 0 ? cv::Vec3b(255, 0, 0) : cv::Vec3b(b, b, b);
		}
	}
}
