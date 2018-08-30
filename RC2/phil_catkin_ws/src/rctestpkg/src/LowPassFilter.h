#ifndef LOWPASSFILTER_H
#define LOWPASSFILTER_H

#include <eigen3/Eigen/Dense>   // Matrix math

/* LowPassFilter CLASS DEFINITION */
// A second-order low-pass butterworth filter used to smooth yaw reading
// State space matrices calculated using MATLAB [A,B,C,D] = butter(n, Wn) function
// with n = 2s
class LowPassFilter {
private:
	Eigen::Matrix2d A;
	Eigen::Matrix<double, 2, 1> B;
	Eigen::Matrix<double, 1, 2> C;
	double D;
	Eigen::Vector2d x;
public:
	// Constructor
	LowPassFilter(float Wn = 0.2) {
		x << 0, 0;
		if (Wn == 0.1) {
			A << 0.601184806929141, -0.253602759501623,
				0.253602759501623, 0.959833268871577;
			B << 0.358648461942437,
				0.056804335818009;
			C << 0.089662115485609, 0.692905697207045;
			D = 0.020083365564211;
		}
		else if (Wn == 0.2) {
			A << 0.277891050318045, -0.415211971888089,
				0.415211971888089, 0.865089452221856;
			B << 0.587198401903811,
				0.190792326375034;
			C << 0.146799600475953, 0.659408699592789;
			D = 0.067455273889072;
		}
		else {	// Wn = 0.4
			A << -0.217328454996463, -0.568644162904732,
				 0.568644162904732,	  0.586855832347704;
			B << 0.804184287344167,
				 0.584274085109220;
			C << 0.201046071836042,	0.561038259909243;
			D = 0.206572083826148;
		}
	}
	float filt(float input) {
		x = A * x + B * double(input);
		return float(C * x + D * double(input));
	}
	double filt(double input) {
		x = A * x + B * input;
		return (C * x + D * input);
	}
};

/* END LowPassFilter CLASS DEFINITION */

#endif
