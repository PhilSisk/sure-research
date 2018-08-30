/*
calculate_headway.cpp
This node uses rplidar scan data to calculate the distance between this scaled
car and the other one (the lead car). Used in ACC/takeover calculations.
Note that this node is able to calculate headway even when the "lead" car is to
the right of or behind this scaled car. However, since the laser scan data to its
left is used for lanekeeping, it can not calculate the headway to the lead car
if the lead car is to its left.

		Type				Name
Subscriptions:	sensor_msgs/LaserScan.h		scan

Publications:	rctestpkg::Headway		Headway

Services:	(none)


Phil Sisk
*/

#include <iostream>
#include <ros/ros.h>
#include <sensor_msgs/LaserScan.h>	// rplidar node publishes this message
#include <rctestpkg/Headway.h>		// Headway data message
#include <vector>
#include <utility>			// for std::pair
#include <algorithm>			// For trig stuff
#include <numeric>
#include "LowPassFilter.h"		// Smooth headway data

class calculate_headway {
private:
	LowPassFilter h_filt;		// For smoothing headway data
	double	headway,
		headway_dist,		// Radial distance of lead car
		headway_angle,		// Angle of lead car
		min_scan_angle,		// minimum angle of scan
		max_scan_angle;		// max angle of scan
	rctestpkg::Headway h_msg;	// Headway message to be published
public:
	// Constructor
	calculate_headway() : 	h_filt(0.4),
				headway(0.0),
				headway_dist(0),
				headway_angle(0.0),
				min_scan_angle(-30),
				max_scan_angle(5) {}
	void calculate(const sensor_msgs::LaserScan::ConstPtr & msg);
	rctestpkg::Headway get_headway() { return h_msg; }
	
	void lk_callback(const sensor_msgs::LaserScan::ConstPtr & msg) {
		calculate(msg);
	}
};

// Calculates the distance to the lead car
void calculate_headway::calculate(const sensor_msgs::LaserScan::ConstPtr & msg) {
	// Only using set of points in front of car for now
	std::vector<std::pair<float, float> > front_scans;
	std::cout << "Max angle: " << msg->angle_max << std::endl
		<< "Min angle: " << msg->angle_min /3.1415 * 180 << std::endl
		<< "Angle increment: " << msg->angle_increment / 3.1415 * 180 << std::endl;
	float start_angle = msg->angle_min + 149 * msg->angle_increment;
	std::cout << "Start_angle: " << start_angle / 3.1415 * 180 << std::endl;
	float current_angle = start_angle;

	// Load valid scans at angles -30 to 20 degrees into the front_scans vector
	for (unsigned int i = 149; i < 199; ++i) {
		if (msg->ranges[i] <= msg->range_max && msg->ranges[i] >= msg->range_min) {
			front_scans.push_back(
				std::pair<float, float>(msg->ranges[i], current_angle));
		}
		current_angle += msg->angle_increment;
	}
	std::cout << "Number of successful scans: " << front_scans.size() << std::endl;
	
	if (front_scans.size() < 4) {
		ROS_ERROR("Cannot calculate headway due to bad scan data.");
		return;
	}
	// Debug output
	std::vector<float> ranges(front_scans.size());
	for (int i = 0; i < front_scans.size(); ++i) {
		ranges[i] = front_scans[i].first * cos(front_scans[i].second);
	}
	for (float distance = 1.0; distance > 0.0; distance -= 0.1) {
		for (int i = ranges.size() - 1; i >= 0; i--) {
			if (fabs(ranges[i] - distance) < 0.05) {
				std::cout << "_";
			}
			else std::cout << " ";
		}
		std::cout << std::endl;
	}

	// Find three closest points in scan
	int min_dist_index = 0;
	float min_dist = front_scans[0].first + front_scans[1].first + front_scans[2].first;
	for (int i = 1; i < front_scans.size() - 3; ++i) {
		float dist =	front_scans[i].first +
				front_scans[i + 1].first +
				front_scans[i + 2].first;
		if (dist < min_dist) {
			min_dist = dist;
			min_dist_index = i;
		}
	}
	headway_dist = min_dist / 3;
	headway_angle = (front_scans[min_dist_index].second +
			front_scans[min_dist_index + 1].second +
			front_scans[min_dist_index + 2].second) / 3;
	std::cout << "min_dist: " << headway_dist << " at "
		<< headway_angle / 3.15415 * 180 << " degrees\n";
	float h = headway_dist * cos(headway_angle);

	headway = h_filt.filt(h);
	std::cout << "Headway: " << headway << std::endl << std::endl;

	h_msg.h = headway;
	h_msg.angle = headway_angle;
	h_msg.h_radial = headway_dist;

}


int main(int argc, char ** argv) {
	ros::init(argc, argv, "calculate_headway");
	ros::NodeHandle n;
	calculate_headway c_h;
	ros::Publisher headway_pub = n.advertise<rctestpkg::Headway>("headway", 10);
	ros::Subscriber lidar_sub =
		n.subscribe<sensor_msgs::LaserScan>("scan", 1, &calculate_headway::lk_callback, &c_h);
	ros::Rate loop_rate(10);	
	while (ros::ok()) {
		loop_rate.sleep();
		ros::spinOnce();
		rctestpkg::Headway headway_msg;
		headway_msg = c_h.get_headway();
		headway_pub.publish(headway_msg);
	}
	return 0;
}
