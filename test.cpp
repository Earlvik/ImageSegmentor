#include <iostream>
#include<vector>
#include<time.h>
#include <armadillo>
#include "SegImage.h"
#include "Utils.h"
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <windows.h>
#include "Timer.h"
#include "MeanFiller.h"
#include "DicomImage.h"

using namespace std;
using namespace arma;
using namespace cv;

#define SIZE 300

void cube_arma(int size)
{
	cube Q(size, size, size);
	Q.fill(1.0);
	cube slice = Q(20, 20, 20, SizeCube(5, 5, 5));
	//slice.print("Slice: ");
	Q.reset();
}

void cube_vector(int size)
{
	vector<vector<vector<double>>> mat;
	mat.resize(size);
	for (int i = 0; i < size; i++)
	{
		mat[i].resize(size);
		for (int j = 0; j < size; j++)
		{
			mat[i][j].resize(size);
			for (int k = 0; k < size; k++)
			{
				mat[i][j][k] = 1.0;
			}
		}
	}

	vector<vector<vector<double>>> slice;
	slice.resize(5);
	for (int i = 0; i < 5; i++)
	{
		mat[i].resize(5);
		for (int j = 0; j < 5; j++)
		{
			mat[i][j].resize(5);
			for (int k = 0; k < 5; k++)
			{
				mat[i][j][k] = mat[20 + i][20 + j][20 + k];
			}
		}
	}

	/*for (int i = 0; i < 5; i++)
	{
		cout << endl << "Slice " << i << endl;
		for (int j = 0; j < 5; j++)
		{
			cout << endl;
			for (int k = 0; k < 5; k++)
			{
				cout << mat[i][j][k] << ", ";
			}
		}
	}*/

	cout << endl;
}

void cube_pointer(int size)
{
	double ***mat;
	mat = new double**[size];

	for (int i = 0; i < size; i++)
	{
		mat[i] = new double*[size];
		for (int j = 0; j < size; j++)
		{
			mat[i][j] = new double[size];
			for (int k = 0; k < size; k++)
			{
				mat[i][j][k] = 2.0;
			}
		}
	}

	double ***slice;
	slice = new double**[5];
	for (int i = 0; i < 5; i++)
	{
		slice[i] = new double*[5];
		for (int j = 0; j < 5; j++)
		{
			slice[i][j] = new double[5];
			for (int k = 0; k < 5; k++)
			{
				slice[i][j][k] = mat[20 + i][20 + j][20 + k];
			}
		}
	}

	/*for (int i = 0; i < 5; i++)
	{
		cout << endl << "Slice " << i << endl;
		for (int j = 0; j < 5; j++)
		{
			cout << endl;
			for (int k = 0; k < 5; k++)
			{
				cout << mat[i][j][k] << ", ";
			}
		}
	}*/

	//cout << endl;

	for (int i = 0; i < size; i++)
	{
		for (int j = 0; j < size; j++)
		{
			delete[] mat[i][j];
		}
		delete[] mat[i];
	}
	delete[] mat;

	for (int i = 0; i < 5; i++)
	{
		for (int j = 0; j < 5; j++)
		{
			delete[] slice[i][j];
		}
		delete[] slice[i];
	}
	delete[] slice;
}

double convolve_arma(int size, int times)
{
	cube Q(size, size, size);
	Q.randu();
	vec3 v;
	v << 1 << 2 << 1;
	double result = 0.0;
	for (int i = 0; i < times; i++) {
		double start = double(clock());
		cube cube = Q(20, 20, 20, SizeCube(20, 20, 20));
		mat33 kernel = v * v.t();
		double con = 0.0;
		con += sum(sum(conv2(cube.slice(0), kernel, "same")));
		con += sum(sum(conv2(cube.slice(1), 2*kernel, "same")));
		con += sum(sum(conv2(cube.slice(2), kernel, "same")));
		double finish = double(clock());
		result += finish - start;
		cout << i << endl;
	}
	return result;
}

double convolve_vector(int size, int times)
{
	vector<vector<vector<double>>> mat;
	mat.resize(size);
	for (int i = 0; i < size; i++)
	{
		mat[i].resize(size);
		for (int j = 0; j < size; j++)
		{
			mat[i][j].resize(size);
			for (int k = 0; k < size; k++)
			{
				mat[i][j][k] = 1.0;
			}
		}
	}
	double result = 0.0;
	for (int t = 0; t < times; t++) {
		double start = double(clock());
		vector<vector<vector<double>>> con;
		con.resize(20);
		for (int i = 0; i < 20; i++)
		{
			con[i].resize(20);
			for (int j = 0; j < 20; j++)
			{
				con[i][j].resize(20);
				for (int k = 0; k < 20; k++)
				{
					if (i > 1 && j > 1 && k > 1 && i < 19 && j < 19 && k < 19)
					{
						con[i][j][k] = 8 * mat[i][j][k] +
							4 * (mat[i][j][k + 1] + mat[i][j][k - 1] + mat[i][j + 1][k] + mat[i][j - 1][k] + mat[i + 1][j][k] + mat[i -1 ][j][k]) +
							2 * (mat[i][j -1][k + 1] + mat[i][j + 1][k + 1] + mat[i - 1][j][k + 1] + mat[i + 1][j][k + 1] +
								mat[i][j - 1][k - 1] + mat[i][j + 1][k - 1] + mat[i - 1][j][k - 1] + mat[i + 1][j][k - 1] +
								mat[i + 1][j + 1][k] + mat[i - 1][j - 1][k] + mat[i + 1][j - 1][k] + mat[i - 1][j + 1][k]) +
							mat[i + 1][j + 1][k + 1] + mat[i - 1][j - 1][k + 1] + mat[i + 1][j - 1][k + 1] + mat[i - 1][j + 1][k + 1] +
							mat[i + 1][j + 1][k - 1] + mat[i - 1][j - 1][k - 1] + mat[i + 1][j - 1][k - 1] + mat[i - 1][j + 1][k - 1];
					}
				}
			}
		}
		double finish = double(clock());
		result += finish - start;
		cout << t << endl;
	}
	return result;
}

double time(void (*function)(int), int param, int times)
{
	double result = 0.0;
	for (int i = 0; i < times; i++) {
		double start = double(clock());
		function(param);
		double finish = double(clock());
		result += finish - start;
		cout << i << endl;
	}
	return result;
}

void measure_init()
{
	int times = 100;
	double arma_clock = time(&cube_arma, SIZE, times);
	double vector_clock = time(&cube_vector, SIZE, times);
	double pointer_clock = time(&cube_pointer, SIZE, times);
	cout << endl << endl << endl;
	cout << "Arma Sum: " << arma_clock << " Avg: " << arma_clock / double(times);
	cout << endl << endl;
	cout << "Vector Sum: " << vector_clock << " Avg: " << vector_clock / double(times);
	cout << endl << endl;
	cout << "Pointer Sum: " << pointer_clock << " Avg: " << pointer_clock / double(times);
	cout << endl;
}

void measure_conv()
{
	int times = 1000;
	double arma_clock = convolve_arma(SIZE, times);
	double vector_clock = convolve_vector(SIZE, times);
	cout << endl << endl << endl;
	cout << "Arma Sum: " << arma_clock << " Avg: " << arma_clock / double(times);
	cout << endl << endl;
	cout << "Vector Sum: " << vector_clock << " Avg: " << vector_clock / double(times);
	cout << endl << endl;
}

void test_img()
{
	SegImage* image = new SegImage(200, 200, 10, true);
	image->setVoxel(2, 3, 5, 255);
	image->setVoxel(7, 3, 5, 255);
	image->setVoxel(1, 6, 5, 255);
	image->setVoxel(2, 7, 5, 255);
	image->setVoxel(3, 8, 5, 255);
	image->setVoxel(4, 8, 5, 255);
	image->setVoxel(5, 8, 5, 255);
	image->setVoxel(6, 8, 5, 255);
	image->setVoxel(7, 7, 5, 255);
	image->setVoxel(8, 6, 5, 255);
	image->serialize("image.mtx");
	image->saveSlice(5, "slice1.bmp");
	image = SegImage::deserialize("image.mtx");
	image->saveSlice(5, "slice2.bmp");
}

void println(cv::Mat img, string text, int line)
{
	int strX = 20;
	int strY = 30;
	putText(img, text, Point(strX, strY + 20 * line), FONT_HERSHEY_COMPLEX_SMALL, 1, Scalar(255, 255, 255));
}

void showSeries(int slices, SegImage* image, SegImage* filled, MeanFiller filler)
{
	cv::Mat slice;
	int z = 0, k;
	

	Utils::combine(image, filled,  z, slice);
	cube sphere = Utils::sphere(3);
	string message = "Slice " + to_string(z + 1) + " of " + to_string(slices);
	println(slice, message, 0);
	message = "Volume: " + to_string(filled->getVolume()) + " voxels";
	println(slice, message, 1);
	namedWindow("Image", WINDOW_AUTOSIZE);
	imshow("Image", slice);
	while(true)
	{
		k = waitKey(30);
		switch(k)
		{
		case 27: {
				destroyWindow("Image");
				return;
			}
		case -1: {
				break;
			}
		case 2424832: {
				if (z > 0) {
					z--;
					Utils::combine(image, filled, z, slice);
					message = "Slice " + to_string(z + 1) + " of " + to_string(slices);
					println(slice, message, 0);
					message = "Volume: " + to_string(filled->getVolume()) + " voxels";
					println(slice, message, 1);
					imshow("Image", slice);
				}
				break;
			}
		case 2555904: {
				if (z < slices-1) {
					z++;
					Utils::combine(image, filled, z, slice);
					message = "Slice " + to_string(z + 1) + " of " + to_string(slices);
					println(slice, message, 0);
					message = "Volume: " + to_string(filled->getVolume()) + " voxels";
					println(slice, message, 1);
					imshow("Image", slice);
				}
				break;
			}
		case 2490368: {
			filled = filler.iterate_fw();
			Utils::combine(image, filled, z, slice);
			message = "Slice " + to_string(z + 1) + " of " + to_string(slices);
			println(slice, message, 0);
			message = "Volume: " + to_string(filled->getVolume()) + " voxels";
			println(slice, message, 1);
			imshow("Image", slice);
			break;
		}
		case 2621440: {
			filled = filler.iterate_bw();
			Utils::combine(image, filled, z, slice);
			message = "Slice " + to_string(z + 1) + " of " + to_string(slices);
			println(slice, message, 0);
			message = "Volume: " + to_string(filled->getVolume()) + " voxels";
			println(slice, message, 1);
			imshow("Image", slice);
			break;
		}
		case 13: {
			filled = Utils::convert(Utils::dilate(Utils::convert_d(filled), sphere));
			Utils::combine(image, filled, z, slice);
			message = "Slice " + to_string(z + 1) + " of " + to_string(slices);
			println(slice, message, 0);
			message = "Volume: " + to_string(filled->getVolume()) + " voxels";
			println(slice, message, 1);
			imshow("Image", slice);
			break;
		}
		case 43: {
			filled = Utils::convert(Utils::erode(Utils::convert_d(filled), sphere));
			Utils::combine(image, filled, z, slice);
			message = "Slice " + to_string(z + 1) + " of " + to_string(slices);
			println(slice, message, 0);
			message = "Volume: " + to_string(filled->getVolume()) + " voxels";
			println(slice, message, 1);
			imshow("Image", slice);
			break;
		}
		case 61: {
			Utils::combine(image, filled, z, slice);
			message = "Slice " + to_string(z + 1) + " of " + to_string(slices);
			println(slice, message, 0);
			message = "Volume: " + to_string(filled->getVolume()) + " voxels";
			println(slice, message, 1);
			imshow("Image", slice);
			break;
		}
		case 45:
		{
			Utils::convert_cv(image, z, slice);
			message = "Slice " + to_string(z + 1) + " of " + to_string(slices);
			println(slice, message, 0);
			message = "Volume: " + to_string(filled->getVolume()) + " voxels";
			println(slice, message, 1);
			imshow("Image", slice);
			break;
		}
		default: {
				cout << k <<  endl;
			}
		}
	}
}

void showSeries(int slices, SegImage* image, Direcory* dir)
{
	cv::Mat slice;
	int z = 0, k;


	Utils::convert_cv(image, z, slice);
	string message = dir->filenames.at(z);
	println(slice, message, 0);
	namedWindow("Image", WINDOW_AUTOSIZE);
	imshow("Image", slice);
	while (true)
	{
		k = waitKey(30);
		switch (k)
		{
		case 27: {
			destroyWindow("Image");
			return;
		}
		case -1: {
			break;
		}
		case 2424832: {
			if (z > 0) {
				z--;
				Utils::convert_cv(image, z, slice);
				message = dir->filenames.at(z);
				println(slice, message, 0);
				imshow("Image", slice);
			}
			break;
		}
		case 2555904: {
			if (z < slices - 1) {
				z++;
				Utils::convert_cv(image, z, slice);
				message = dir->filenames.at(z);
				println(slice, message, 0);
				imshow("Image", slice);
			}
			break;
		}
		default: {
			cout << k << endl;
		}
		}
	}
}

void measure_fill(int startRadius, int startX, int startY, int times, double total, double min, double max, double start, double finish, int startZ, MeanFiller filler, SegImage* filled)
{
	total = 0.0;
	min = 100000.0;
	max = 0.0;
	cout << "Fill" << endl;
	for (int i = 0; i < times; i++) {
		start = double(clock());
		filled = filler.fill(startX, startY, startZ, startRadius);
		finish = double(clock()) - start;
		total += finish;
		if (finish < min) min = finish;
		if (finish > max) max = finish;
		delete filled;
		cout << i << " ";
	}
	cout << endl << "Finish. Total: " << total << " Avg: " << total / double(times) << " Min: " << min << " Max: " << max << endl;
	

	total = 0.0;
	min = 100000.0;
	max = 0.0;
	cout << "Fill Alternative" << endl;
	for (int i = 0; i < times; i++) {
		start = double(clock());
		filled = filler.fillAlt(startX, startY, startZ, startRadius);
		finish = double(clock()) - start;
		total += finish;
		if (finish < min) min = finish;
		if (finish > max) max = finish;
		delete filled;
		cout << i << " ";
	}
	cout << endl << "Finish. Total: " << total << " Avg: " << total / double(times) << " Min: " << min << " Max: " << max << endl;
}

void demo()
{
	int rows = 500;
	int cols = 500;
	int slices = 50;
	int startRadius = 5;
	int startX = 100;
	int startY = 100;
	int times = 10;
	double total, min, max, start, finish, threshold;
	string line;
	int k = -1;
	int startZ = 30;
	Timer timer = Timer();
	MeanFiller filler = MeanFiller();
	SegImage* filled;
	timer.start("Sphere");
	cube Q = zeros(rows, cols, slices);
	cube filled_q;
	timer.stage("Init");
	cube sphere = Utils::sphere(20);
	Q(90, 90, 3, arma::size(sphere)) = sphere;
	Q(150, 90, 3, arma::size(sphere)) = sphere;
	Q(span(0, 399), span(100, 101), span(25, 26)) = ones(400, 2, 2);
	Q(span(110, 112), span(105, 106), span(20, 25)) = zeros(3, 2, 6);
	timer.stage("Add objects");
	SegImage* image = Utils::convert(Q);
	Q.clear();
	timer.stage("Convert");
	timer.stop();
	sphere = Utils::sphere(startRadius);
	filler.set_image(image);
	filled = NULL;
	while (true) {
		filled_q = zeros(rows, cols, slices);
		filled_q(startY, startX, startZ, arma::size(sphere)) = sphere;
		SegImage* start1 = Utils::convert(filled_q);
		filled_q.reset();
		showSeries(slices, image, start1, filler);
		cout << "Enter curvature threshold: ";
		cin >> line;
		if (line == "quit")
		{
			break;
		}
		else {
			try
			{
				threshold = stod(line);
			}
			catch (invalid_argument& e)
			{
				cout << "Invalid argument!" << endl;
				continue;
			}
			catch (out_of_range& e)
			{
				cout << "Out of range!" << endl;
				continue;
			}
			filler.set_threshold(threshold);
			filled = filler.fill(startX, startY, startZ, startRadius);
		}
		showSeries(slices, image, filled, filler);
	}
	filled->saveSeries("result");
	delete image;
}

int main(int argc, char** argv)
{
	int startRadius = 3;
	int startX = 183;
	int startY = 143;
	int startZ = 4;
	cube filled_q;
	int cols, rows, slices;
	char* dirname = "DICOM\\test3\\";
	string line;
	double threshold;
	SegImage* filled;

	MeanFiller filler = MeanFiller();
	Direcory* dir = new Direcory(dirname);
	SegImage* image = DicomImage::readDir(dir);
	image->getSize(cols, rows, slices);
	cube sphere = Utils::sphere(startRadius);
	cube Q = zeros(rows, cols, slices);
	filled_q = zeros(rows, cols, slices);
	filled_q(startY, startX, startZ, arma::size(sphere)) = sphere;
	SegImage* start1 = Utils::convert(filled_q);
	filled_q.reset();
	showSeries(slices, image, start1, filler);
	SegImage* copy;
	while (true) {
		cout << "Enter brightness threshold: ";
		cin >> line;
		if (line == "fill")
		{
			break;
		}
		else {
			try
			{
				threshold = stod(line);
			}
			catch (invalid_argument& e)
			{
				cout << "Invalid argument!" << endl;
				continue;
			}
			catch (out_of_range& e)
			{
				cout << "Out of range!" << endl;
				continue;
			}
			copy = image->copy();
			copy->threshold(threshold);
		}
		showSeries(slices, copy, start1, filler);
		delete copy;
	}
	copy = image->copy();
	copy->threshold(threshold);
	filler.set_image(copy);
	while (true) {
		cout << "Enter curvature threshold: ";
		cin >> line;
		if (line == "quit")
		{
			break;
		}
		else {
			try
			{
				threshold = stod(line);
			}
			catch (invalid_argument& e)
			{
				cout << "Invalid argument!" << endl;
				continue;
			}
			catch (out_of_range& e)
			{
				cout << "Out of range!" << endl;
				continue;
			}
			filler.set_threshold(threshold);
			filled = filler.fillAlt(startX, startY, startZ, startRadius);
		}
		showSeries(slices, image, filled, filler);
	}
	system("pause");
}
