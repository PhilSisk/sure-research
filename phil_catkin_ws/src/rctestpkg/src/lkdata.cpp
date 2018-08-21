/*
lkdata.cpp
Processes rplidar signal to create lanekeeping data based on distance and angle to left wall
Gets yaw rate from IMU data and publishes all lanekeeping data on an LKdata message
*/

#include <iostream>
#include "ros/ros.h"
#include <string>
#include <sstream>
#include <cmath>
#include <sensor_msgs/LaserScan.h>	// rplidar node publishes this message
#include <rctestpkg/IMUdata.h>  // Yaw rate is grabbed from IMU
#include <rctestpkg/LKdata.h>	// lanekeeping data is published to this message
#include <vector>
#include <algorithm>		// For trig stuff 
#include <numeric>		// For std::inner_product
#include <deque>
#include <eigen3/Eigen/Dense>   // For butterworth yaw filter

#define RANGE_SIZE 40		// Number of scans from rplidar used in calculations
#define MID_SCAN 270		// scan used as center of calculation (can be calibrated)
#define NUM_Y 3			// Number of previous y measurements used to calculate lat vel



/* butterworth CLASS DEFINITION */
// A second-order low-pass butterworth filter used to smooth yaw reading
// State space matrices calculated using MATLAB [A,B,C,D] = butter(n, Wn) function
// with n = 2 and Wn = .2
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
		// Note: making the LPF even more extreme, using n = 0.1:
		A << 0.601184806929141, -0.253602759501623,
			0.253602759501623, 0.959833268871577;
		B << 0.358648461942437,
			0.056804335818009;
		C << 0.089662115485609, 0.692905697207045;
		D = 0.020083365564211; 
	/*
		A << 0.277891050318045, -0.415211971888089,
			0.415211971888089, 0.865089452221856;
		B << 0.587198401903811,
			0.190792326375034;
		C << 0.146799600475953, 0.659408699592789;
		D = 0.067455273889072;
	*/
	}
	float filt(float input) {
		x = A * x + B * double(input);
		return float(C * x + D * double(input));
	}
};

/* END butterworth CLASS DEFINITION */




/* lkdata CLASS DEFINITION */

class lkdata {
private:
	unsigned int	range_size,		// Number of scans used in range
		     	middle_of_scan,		// Reference point used to mark middle of scan
		     	range_beg,		// index where scan starts
		     	range_end,		// index where scan ends
			y_index;		// current position in array of y's

	float		theta,
			distance,
			yaw_angle,
			y,			// lateral displacement
			lat_velocity,
			yaw_rate,
			road_disturbance;
	std::deque<float> y_deque;
	butterworth yaw_angle_filt, road_disturb_filt;
	
	// Private helper function
	float calculate_angle(const std::vector<float> & x_vec, const std::vector<float> & y_vec);
public:
	lkdata() : range_size(RANGE_SIZE), middle_of_scan(MID_SCAN), distance(0),
			yaw_angle(0), y(0), lat_velocity(0), yaw_rate(0) {
		range_beg = middle_of_scan - range_size/2;
		range_end = middle_of_scan + range_size/2;
		theta = 0.0174533 * range_size/2;
		y_index = 0;
		road_disturbance = 0;
	}
	float calculate_yaw_angle(const sensor_msgs::LaserScan::ConstPtr& msg);
	void calculate_distance(const sensor_msgs::LaserScan::ConstPtr& msg);
	void calculate_lat_vel();
	void set_yaw_rate(float y_r) { yaw_rate = y_r; }
	void calculate_disturbance(const sensor_msgs::LaserScan::ConstPtr& msg);
	void create_lk_msg(rctestpkg::LKdata& msg);
	void print();
};

// This function calculates the vehicle's yaw in radians based on the distance to the wall to
// its left. It then uses the yaw reading and the distance to calculate the lateral displacement
// y. Also calculates the disturbance.
float lkdata::calculate_yaw_angle(const sensor_msgs::LaserScan::ConstPtr& msg) {
	yaw_angle = 0;
	theta = msg->angle_increment * range_size/2;	
	calculate_distance(msg);
	std::cout << "mid range scan distance: " << msg->ranges[middle_of_scan] << std::endl;

	// Convert lidar data to Cartesian coordinates
	float current_angle = -theta;
	unsigned int count = 0;	
	std::vector<float> cart_x, cart_y,	// Ranges in cartesian coordinates
			cart_x_back, cart_y_back,
			cart_x_front, cart_y_front;	// Front part of ranges
	for (unsigned int i = range_beg; i < range_end; ++i) {
		if (msg->ranges[i] >= msg->range_min
		    && msg->ranges[i] <= msg->range_max) {
			cart_x.push_back(msg->ranges[i]*sin(current_angle));
			cart_y.push_back(msg->ranges[i]*cos(current_angle));
			if (i - range_beg > range_size/2) {
				cart_x_back.push_back(cart_x.back());
				cart_y_back.push_back(cart_y.back());
			}
			else {
				cart_x_front.push_back(cart_x.back());
				cart_y_front.push_back(cart_y.back());
			}		
		}
		current_angle += msg->angle_increment;
	}

	// Calculate yaw angle
	if (cart_x.size() >= 5) { // Don't make calculation if too few good readings
		yaw_angle = yaw_angle_filt.filt(calculate_angle(cart_x, cart_y));
		y = distance * cos(yaw_angle);	
	}
	
	// Calculate road disturbance
	if (cart_x_front.size() >= 5 && cart_y_back.size() >= 5) {
		float back_angle = calculate_angle(cart_x_back, cart_y_back);
		float front_angle = calculate_angle(cart_x_front, cart_y_front);
		std::cout << "back_angle: " << back_angle / 3.1415 * 180 << std::endl;
		std::cout << "front_angle: " << front_angle / 3.1415 * 180 << std::endl;
		road_disturbance = road_disturb_filt.filt(back_angle- front_angle);
			
	}
	return yaw_angle;
}

// This function calculates the distance to the wall on the left of the car in meters
// based on readings from the LIDAR. Note that this number is based on a laser scan
// parallel to the left side of the car, so this distance should not be used for the
// y-position measurement (that distance is this distance * cos(yaw_angle))
void lkdata::calculate_distance(const sensor_msgs::LaserScan::ConstPtr& msg) {
	theta = msg->angle_increment * range_size/2;
	float	running_sum = 0,
		count = 0,
		current_angle = -theta;
	bool good_read[range_size];
	for (unsigned int i = range_beg; i < range_end; ++i) {
		if (msg->ranges[i] >= msg->range_min
		    && msg->ranges[i] <= msg->range_max) {
			running_sum += msg->ranges[i]*cos(current_angle);
			++count;
			good_read[i - range_beg] = true;
		}
		else good_read[i - range_beg] = false;
		current_angle += msg->angle_increment;
	}
	distance = running_sum/count;
}

void lkdata::calculate_lat_vel() {
	y_deque.push_back(y);
	if (y_deque.size() >= NUM_Y) {
		y_deque.pop_front();
	}	
	std::vector<float> t(y_deque.size());
	float x = 0.0;
	for (unsigned int i = 0; i < t.size(); ++i) {
		t[i] = x;
		x += 0.1;
	}
	float n = float(t.size());
	float s_x = std::accumulate(t.begin(), t.end(), 0.0);
	float s_y = std::accumulate(y_deque.begin(), y_deque.end(), 0.0);
	float s_xx = std::inner_product(t.begin(), t.end(), t.begin(), 0.0);
	float s_xy = std::inner_product(t.begin(), t.end(), y_deque.begin(), 0.0);
	float slope = (n * s_xy - s_x * s_y) / (n * s_xx - s_x * s_x);
	lat_velocity = slope;
	
}

// Packs lk data into an LKdata message
void lkdata::create_lk_msg(rctestpkg::LKdata & msg) {
	msg.y = y;
	msg.vl = lat_velocity;
	msg.psi = yaw_angle;
	msg.r = yaw_rate;
	msg.rd = road_disturbance;
}

// Prints lk data to the screen
void lkdata::print() {
	std::cout << "distance to wall: " << y << " meters" << std::endl;
	std::cout << "yaw_angle:        " << yaw_angle / 3.1415 * 180 << " degrees" << std::endl;
	std::cout << "lateral velocity: " << lat_velocity << " m/s" << std::endl;
	std::cout << "yaw_rate:         " << yaw_rate << " rad/s" << std::endl;
	std::cout << "road_disturbance: " << road_disturbance / 3.1415 * 180 << " degrees";

	std::cout << std::endl << std::endl;
}

// Uses linear regression to calculate an angle given a set of laser scan points in cartesian
// coordinates
float lkdata::calculate_angle(const std::vector<float> & x_vec, const std::vector<float> & y_vec) {
	float n = float(x_vec.size());
	float s_x = std::accumulate(x_vec.begin(), x_vec.end(), 0.0);
	float s_y = std::accumulate(y_vec.begin(), y_vec.end(), 0.0);
	float s_xx = std::inner_product(x_vec.begin(), x_vec.end(), x_vec.begin(), 0.0);
	float s_xy = std::inner_product(x_vec.begin(), x_vec.end(), y_vec.begin(), 0.0);
	float slope = (n * s_xy - s_x * s_y) / (n * s_xx - s_x * s_x);
	return -atan(slope);
}


/* END lkdata CLASS DEFINITION */



// The lkdata object is globally defined due to ROS's wonky callback functions
lkdata lk;




/* CALLBACK FUNCTIONS */

void lk_callback(const sensor_msgs::LaserScan::ConstPtr& msg) {
	lk.calculate_yaw_angle(msg);
	lk.print();
}

void IMU_callback(const rctestpkg::IMUdata::ConstPtr &msg) {
	float y_r = (float)msg->gz;
	lk.set_yaw_rate(y_r);
}

// A timed callback is used to ensure accuracy in calculating the lateral velocity
void timed_callback(const ros::TimerEvent &) {
	lk.calculate_lat_vel();
}

/* END CALLBACK FUNCTIONS */


// Main function
int main(int argc, char **argv) {
	ros::init(argc, argv, "lkdata");
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("IMUchatter", 1000, IMU_callback);
	ros::Subscriber IMU_sub = n.subscribe("scan", 1000, lk_callback);
	ros::Timer timer1 = n.createTimer(ros::Duration(0.1), timed_callback);
	ros::Publisher pub = n.advertise<rctestpkg::LKdata>("lk_data", 1000);
	ros::Rate loop_rate(50);
	while(ros::ok()) {
		rctestpkg::LKdata msg;
		lk.create_lk_msg(msg);
		pub.publish(msg);
		ros::spinOnce();
		loop_rate.sleep();
	}
	return 0;
}