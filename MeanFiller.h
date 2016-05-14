#pragma once
#include "SegImage.h"
#include <armadillo>
#include "Timer.h"
#include <deque>
#include <stack>
#include <set>

using namespace std;
using namespace arma;

struct triple
{
	int x, y, z;
	triple(int x, int y, int z);
	bool operator==(triple that) const;
	int hash() const;
};

inline bool operator<(const triple& lhs, const triple& rhs) {
	return lhs.hash() < rhs.hash();
}

class MeanFiller
{
public:
	MeanFiller();
	SegImage* fill(int startX, int startY, int startZ,int startRadius);
	SegImage* fillDynamic(int startX, int startY, int startZ, int startRadius);
	SegImage* fillAlt(int startX, int startY, int startZ, int startRadius);

	SegImage* get_image() const;
	void set_image(SegImage* image);
	double get_threshold() const;
	void set_threshold(double threshold);
	double get_quantile() const;
	void set_quantile(double quantile);
	SegImage* iterate_fw();
	SegImage* iterate_bw();
	void reset() const;
private:
	double derivate(cube input) const;
	bool iterate(double thres);
	void addNeighbors(int x, int y, int z);
	cube kernel;
	double wBright = 0.5;
	double wCurv = 0.5;
	Timer timer;
	SegImage* image;
	SegImage* res_image;
	double threshold;
	double quantile;
	deque<stack<triple>> history;
	const int h_size = 5;
	int minx, miny, minz, maxx, maxy, maxz;
	set<triple> candidates;
};
