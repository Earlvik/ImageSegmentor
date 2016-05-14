#include "MeanFiller.h"
#include "Utils.h"

MeanFiller::MeanFiller(): timer(), image(nullptr), res_image(nullptr), threshold(0), quantile(0), minx(0), miny(0), minz(0), maxx(0), maxy(0), maxz(0)
{
	kernel = Utils::sobelKernel(1, 2);
	history = deque<stack<triple>>();
	candidates = set<triple>();
}

SegImage* MeanFiller::fill(int startX, int startY, int startZ, int startRadius)
{
	timer.start("Fill");
	int cols, rows, slices;
	stack<triple> historyEntity;
	cube sample;
	image->getSize(cols, rows, slices);
	cube result = zeros(rows, cols, slices);
	cube sphere = Utils::sphere(startRadius);
	result(startY, startX, startZ, arma::size(sphere)) = sphere;
	timer.stage("Init");
	res_image = Utils::convert(result);
	timer.stage("Convert");
	Utils::bounds(result, minx, miny, minz, maxx, maxy, maxz);
	timer.stage("Bounds");
	result.reset();
	history.clear();

	if (minx < 3) minx = 3;
	if (maxx > cols - 2) maxx = cols - 2;
	if (miny < 3) miny = 3;
	if (maxy > rows - 2) maxy = rows - 2;
	if (minz < 3) minz = 3;
	if (maxz > slices - 2) maxz = slices - 2;
	bool flag = false;

	while(!flag)
	{
		historyEntity = stack<triple>();
		flag = true;
		for (int i = minx; i <= maxx; i++)
		{
			for (int j = miny; j <= maxy; j++)
			{
				for (int k = minz; k <= maxz; k++)
				{
					if (image->getVoxel(i,j,k) > 0 && res_image->getVoxel(i,j,k) == 0)
					{
						sample = wBright * Utils::convert_d(image->getRegion(i - 2, j - 2, i + 2, j + 2, k - 2, k + 2)) +
							wCurv * Utils::convert_d(res_image->getRegion(i - 2, j - 2, i + 2, j + 2, k - 2, k + 2));
						double der = derivate(sample);
						if (der > threshold)
						{
							res_image->setVoxel(i, j, k, 255);
							if (i <= minx && i >= 4 && minx > i - 1)
								minx = i - 1;
							if (i >= maxx && i <= cols - 4 && maxx < i + 1)
									maxx = i + 1;
							if (j <= miny && j >= 4 && miny > j - 1)
									miny = j - 1;
							if (j >= maxy && j <= rows - 4 && maxy < j + 1)
									maxy = j + 1;
							if (k <= minz && k >= 4 && minz > k - 1)
									minz = k - 1;
							if (k >= maxz && k <= slices - 4 && minz < k + 1)
									maxz = k + 1;
							historyEntity.push(triple(i, j, k));
							flag = false;
						}
					}
				}
			}
		}
		timer.stage("Full cycle");
		if (!flag) {
			if (history.size() >= h_size)
			{
				stack<triple> first = history.back();
				while (!first.empty())
				{
					first.pop();
				}
				history.pop_back();
			}
			history.push_front(historyEntity);
		}
	}
	timer.stop();
	return res_image;
}

SegImage* MeanFiller::fillDynamic(int startX, int startY, int startZ, int startRadius)
{
	int cols, rows, slices;
	int minx, miny, minz, maxx, maxy, maxz;
	cube sample, xes;
	vec values;
	stack<triple> historyEntity;
	image->getSize(cols, rows, slices);
	cube result = zeros(rows, cols, slices);
	cube sphere = Utils::sphere(startRadius);
	result(startY, startX, startZ, arma::size(sphere)) = sphere;
	res_image = Utils::convert(result);
	Utils::bounds(result, minx, miny, minz, maxx, maxy, maxz);
	double thres;
	history.clear();
	result.reset();

	if (minx < 3) minx = 3;
	if (maxx > cols - 2) maxx = cols - 2;
	if (miny < 3) miny = 3;
	if (maxy > rows - 2) maxy = rows - 2;
	if (minz < 3) minz = 3;
	if (maxz > slices - 2) maxz = slices - 2;
	bool flag = false;

	while (!flag)
	{
		flag = true;

		xes = Utils::convert_d(image->getRegion(minx, miny, maxx, maxy, minz, maxz));
		sample = wBright * Utils::convert_d(res_image->getRegion(minx, miny, maxx, maxy, minz, maxz)) + 
			wCurv * xes;
		sample = Utils::conv3(Utils::conv3(sample, kernel), kernel);
		sample %= -xes + 1;
		values = sort(nonzeros(vectorise(sample)));
		thres = values(quantile * values.size());

		for (int i = minx; i < maxx; i++)
		{
			for (int j = miny; j < maxy; j++)
			{
				for (int k = minz; k < maxz; k++)
				{
					if (image->getVoxel(i, j, k) > 0 && res_image->getVoxel(i, j, k) == 0)
					{
						if (sample(j-miny, i - minx, k - minz) > thres)
						{
							res_image->setVoxel(i, j, k, 255);
							if (i <= minx && i >= 4)
								minx = i - 1;
							if (i >= maxx && i <= cols - 4 && maxx < i + 1)
								maxx = i + 1;
							if (j <= miny && j >= 4)
								miny = j - 1;
							if (j >= maxy && j <= rows - 4 && maxy < j + 1)
								maxy = j + 1;
							if (k <= minz && k >= 4)
								minz = k - 1;
							if (k >= maxz && k <= slices - 4 && maxz < k + 1)
								maxz = k + 1;
							historyEntity.push(triple(i, j, k));
							flag = false;
						}
					}
				}
			}
		}
		if (!flag) {
			if (history.size() >= h_size)
			{
				stack<triple> first = history.back();
				while (!first.empty())
				{
					first.pop();
				}
				history.pop_back();
			}
			history.push_front(historyEntity);
		}
	}
	return res_image;
}

SegImage* MeanFiller::fillAlt(int startX, int startY, int startZ, int startRadius)
{
	timer.start("Fill Alt");
	int cols, rows, slices;
	cube sample;
	image->getSize(cols, rows, slices);
	cube result = zeros(rows, cols, slices);
	cube sphere = Utils::sphere(startRadius);
	result(startY, startX, startZ, arma::size(sphere)) = sphere;
	timer.stage("Init");
	res_image = Utils::convert(result);
	timer.stage("Convert");
	Utils::bounds(result, minx, miny, minz, maxx, maxy, maxz);
	timer.stage("Bounds");
	result.reset();
	history.clear();

	if (minx < 3) minx = 3;
	if (maxx > cols - 2) maxx = cols - 2;
	if (miny < 3) miny = 3;
	if (maxy > rows - 2) maxy = rows - 2;
	if (minz < 3) minz = 3;
	if (maxz > slices - 2) maxz = slices - 2;
	for (int i = minx; i <= maxx; i++)
	{
		for (int j = miny; j <= maxy; j++)
		{
			for (int k = minz; k <= maxz; k++)
			{
				addNeighbors(i, j, k);
			}
		}
	}
	timer.stage("First candidates");
	while (!candidates.empty()) {
		set<triple>::iterator last = --candidates.end();
		triple c = *last;
		candidates.erase(last);
		sample = wBright * Utils::convert_d(image->getRegion(c.x - 2, c.y - 2, c.x + 2, c.y + 2, c.z - 2, c.z + 2)) +
			wCurv * Utils::convert_d(res_image->getRegion(c.x - 2, c.y - 2, c.x + 2, c.y + 2, c.z - 2, c.z + 2));
		double der = derivate(sample);
		if (der > threshold)
		{
			res_image->setVoxel(c.x, c.y, c.z, 255);
			addNeighbors(c.x, c.y, c.z);
		}
	}
	timer.stop();
	return res_image;
}

SegImage* MeanFiller::get_image() const
{
	return image;
}

void MeanFiller::set_image(SegImage* image)
{
	this->image = image;
}

double MeanFiller::get_threshold() const
{
	return threshold;
}

void MeanFiller::set_threshold(double threshold)
{
	this->threshold = threshold;
}

double MeanFiller::get_quantile() const
{
	return quantile;
}

void MeanFiller::set_quantile(double quantile)
{
	this->quantile = quantile;
}

SegImage* MeanFiller::iterate_fw()
{
	if (!iterate(threshold))
	{
		threshold *= 0.9;
		iterate(threshold);
	}
	return res_image;
}

SegImage* MeanFiller::iterate_bw()
{
	if (!history.empty()) {
		stack<triple> last = history.front();
		history.pop_front();
		while (!last.empty())
		{
			triple coords = last.top();
			last.pop();
			res_image->setVoxel(coords.x, coords.y, coords.z, 0);
		}
	}
	return res_image;
}

void MeanFiller::reset() const
{
	delete image;
	delete res_image;
}

double MeanFiller::derivate(cube input) const
{
	if (input.n_rows != 5 || input.n_cols != 5 || input.n_slices != 5)
	{
		throw invalid_argument("The derivative is calculated over strictly 5x5x5 matrices");
	}

	return Utils::conv3(Utils::conv3(input, kernel).subcube(1, 1, 1, 3, 3, 3), kernel)(1, 1, 1);
}

bool MeanFiller::iterate(double thres)
{
	stack<triple> historyEntity = stack<triple>();
	cube sample;
	int cols, rows, slices;
	image->getSize(cols, rows, slices);
	bool flag = false;
	for (int i = minx; i <= maxx; i++)
	{
		for (int j = miny; j <= maxy; j++)
		{
			for (int k = minz; k <= maxz; k++)
			{
				if (image->getVoxel(i, j, k) > 0 && res_image->getVoxel(i, j, k) == 0)
				{
					sample = wBright * Utils::convert_d(image->getRegion(i - 2, j - 2, i + 2, j + 2, k - 2, k + 2)) +
						wCurv * Utils::convert_d(res_image->getRegion(i - 2, j - 2, i + 2, j + 2, k - 2, k + 2));
					double der = derivate(sample);
					if (der > thres)
					{
						res_image->setVoxel(i, j, k, 255);
						if (i <= minx && i >= 4 && minx > i - 1)
							minx = i - 1;
						if (i >= maxx && i <= cols - 4 && maxx < i + 1)
							maxx = i + 1;
						if (j <= miny && j >= 4 && miny > j - 1)
							miny = j - 1;
						if (j >= maxy && j <= rows - 4 && maxy < j + 1)
							maxy = j + 1;
						if (k <= minz && k >= 4 && minz > k - 1)
							minz = k - 1;
						if (k >= maxz && k <= slices - 4 && maxz < k + 1)
							maxz = k + 1;
						historyEntity.push(triple(i, j, k));
						flag = true;
					}
				}
			}
		}
	}
	if (flag)
	{
		if (history.size() >= h_size)
		{
			history.pop_back();
		}
		history.push_front(historyEntity);
	}
	return flag;
}

void MeanFiller::addNeighbors(int x, int y, int z)
{
	for (int i = x - 1; i <= x + 1; i++)
	{
		for (int j = y - 1; j <= y + 1; j++)
		{
			for (int k = z - 1; k <= z + 1; k++)
			{
				if (image->inNarrowBounds(i, j, k) && image->getVoxel(i, j, k) > 0 && res_image->getVoxel(i, j, k) == 0)
				{
					candidates.insert(triple(i, j, k));
				}
			}
		}
	}
}

triple::triple(int x, int y, int z) 
{
	this->x = x;
	this->y = y;
	this->z = z;
}

bool triple::operator==(triple that) const
{
	return this->x == that.x && this->y == that.y && this->z == that.z;
}

int triple::hash() const
{
	return (701 * x + y) * 877 + z;
}
