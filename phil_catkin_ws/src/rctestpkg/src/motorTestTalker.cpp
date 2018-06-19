#include "ros/ros.h"
#include <stdlib.h>
#include <std_msgs/Float32.h>

int main(int argc, char ** argv) {
	ros::init(argc, argv, "motorTestTalker");
	ros::NodeHandle n;
	ros::Publisher motor_pub = n.advertise<std_msgs::Float32>("Motor_command2", 1000);
	ros::Rate loop_rate(1); // Publish at 1 Hz
	std_msgs::Float32 msg;
	float values[10] = { 0.0, 0.0, 0.0, 0.05, 0.1, 0.15, 0.2, 0.15, 0.1, 0.05 };
	int index = 0;

	while (ros::ok()) {
		msg.data = values[index];
		ROS_INFO("Current: %f", msg.data);
		motor_pub.publish(msg);
		loop_rate.sleep();
		index = (index + 1) % 10;
	}
	return 0;
}
