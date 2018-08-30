#include "ros/ros.h"
#include "std_msgs/UInt16.h"

int main(int argc, char ** argv) {
	ros::init(argc, argv, "servo_command_test");
	ros::NodeHandle n;
	ros::Publisher servo_pub = n.advertise<std_msgs::UInt16>("servo", 1);
	ros::Rate loop_rate(100); // in Hz
	std_msgs::UInt16 msg;
	
	msg.data = 1537;  // Initially set the wheels pointing forward
	bool increment = true;

	while(ros::ok()) {
		servo_pub.publish(msg);
		if (increment) {
			if (msg.data < 1937) {
				msg.data += 4;
			}
			else increment = false;
		}
		if (!increment) {
			if (msg.data > 1137) {
				msg.data -= 4;
			}
			else increment = true;
		}
		loop_rate.sleep();
		ros::spinOnce();
	}
	return 0;
}
