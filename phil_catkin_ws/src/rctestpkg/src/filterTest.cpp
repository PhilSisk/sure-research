#include <iostream>
#include <eigen3/Eigen/Dense>
#include <vector>


// A second-order butterworth filter for IMU only with a cornering frequency of 20 Hz and a sampling frequency of 100 Hz
class butterworth {
private:
	Eigen::Matrix2d A;
	Eigen::Matrix<double, 2, 1> B;
	Eigen::Matrix<double, 1, 2> C;
	double D;
	Eigen::Vector2d x;
public:
	butterworth() {
		x << 0, 0;
		A << -0.217328454996463, -0.568644162904732,
			 0.568644162904732,	  0.586855832347704;
		B << 0.804184287344167,
			 0.584274085109220;
		C << 0.201046071836042,	0.561038259909243;
		D = 0.206572083826148;
	}
	double filt(double input) {
		x = A * x + B * input;
		return C * x + D * input;
	}
};

int main() {
	butterworth yaw_rate_filter;
	std::vector<double> doubvec;
	double init = 0;
	for (int i = 0; i < 100; ++i) {
		doubvec.push_back(init);
		init += 0.1;
	}
	for (int i = 0; i < 100; ++i) {
		doubvec[i] = yaw_rate_filter.filt(doubvec[i]);
		std::cout << doubvec[i] << std::endl;
	}
	
	return 0;
}