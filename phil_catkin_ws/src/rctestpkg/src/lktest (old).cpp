#include <iostream>
#include "ros/ros.h"
#include <string>
#include <sstream>
#include <cmath>
#include <sensor_msgs/LaserScan.h>
#include <vector>

class lanekeeping {
private:
	unsigned int range_size,	// Number of scans used in range
		     middle_of_scan,	// Reference point used to mark middle of scan section
		     range_beg,		// index where scan starts
		     range_end;		// index where scan ends
	float theta;
public:
	lanekeeping() : range_size(40), middle_of_scan(270) {
		range_beg = middle_of_scan - range_size/2;
		range_end = middle_of_scan + range_size/2;
		theta = 0.0174533 * range_size/2;
	}
	float calculate_delta_psi(sensor_msgs::LaserScan::ConstPtr& msg);
};

float lanekeeping::calculate_delta_psi(sensor_msgs::LaserScan::ConstPtr& msg) {
	float total = 0;
	float count = 0;
	float current_angle = -theta;
	bool good_read[range_size];
	for (unsigned int i = range_beg; i < range_end; ++i) {
		if (msg->ranges[i - range_beg] >= msg->range_min
		    && msg->ranges[i] <= msg->range_max) {
			total += msg->ranges[i]*cos(current_angle);
			++count;
			good_read[i - range_beg] = true;
		}
		else good_read[i - range_beg] = false;
		current_angle += msg->angle_increment;
	}
	float avg = total/count;
	float h = avg/cos(theta);
	float delta_psi = 0;
	count = 0;
	current_angle = msg->angle_increment;
	for (unsigned int i = range_beg + range_size/2 + 1; i < range_end; ++i) {
		if (good_read[i - range_beg]) {
			float c = sqrt(msg->ranges[i] * msg->ranges[i] + avg * avg
				- 2 * msg->ranges[i] * avg * cos(current_angle));
			if (c > 0) {
				float arg = sin(current_angle) * msg->ranges[i] / c;
				if (abs(arg) < 1) {
					float psi = asin(arg) - 1.57;
					if (msg->ranges[i] < avg/cos(current_angle)) psi = -psi;
					delta_psi += psi;
				}
			}
			count++;
		}
		current_angle += msg->angle_increment;
	}
	if (count > 0) {
		delta_psi /= count;
	}
	std::cout << "delta psi: " << delta_psi/3.14 * 180 << " degrees" << std::endl;
	return delta_psi;
}

lanekeeping lk; // Globally defined, easier to deal with due to ROS's wonky callback functions

void lk_callback(const sensor_msgs::LaserScan::ConstPtr& msg) {
	unsigned int range_size = 40; // Number of scans used in range
	unsigned int middle_of_scan = 270; // Reference point used to mark middle of scan section
	unsigned int range_beg = middle_of_scan - range_size/2,
		     range_end = middle_of_scan + range_size/2;
	float theta = msg->angle_increment * range_size/2;
	float total = 0;
	float count = 0;
	float current_angle = -theta;
	bool good_read[range_size];
	for (unsigned int i = range_beg; i < range_end; ++i) {
		if (msg->ranges[i - range_beg] >= msg->range_min
		    && msg->ranges[i] <= msg->range_max) {
			total += msg->ranges[i]*cos(current_angle);
			++count;
			good_read[i - range_beg] = true;
		}
		else good_read[i - range_beg] = false;
		current_angle += msg->angle_increment;
	}
	float avg = total/count;
	float h = avg/cos(theta);
	float delta_psi = 0;
	count = 0;
	current_angle = msg->angle_increment;
	for (unsigned int i = range_beg + range_size/2 + 1; i < range_end; ++i) {
		if (good_read[i - range_beg]) {
			float c = sqrt(msg->ranges[i] * msg->ranges[i] + avg * avg
				- 2 * msg->ranges[i] * avg * cos(current_angle));
			if (c > 0) {
				float arg = sin(current_angle) * msg->ranges[i] / c;
				if (abs(arg) < 1) {
					float psi = asin(arg) - 1.57;
					if (msg->ranges[i] < avg/cos(current_angle)) psi = -psi;
					delta_psi += psi;
				}
			}
			count++;
		}
		current_angle += msg->angle_increment;
	}
	if (count > 0) {
		delta_psi /= count;
	}
	std::cout << "delta psi: " << delta_psi/3.14 * 180 << " degrees" << std::endl;
}

int main(int argc, char **argv) {
  ros::init(argc, argv, "lk_test");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("scan", 1000, lk_callback);
  ros::spin();
  return 0;
}
