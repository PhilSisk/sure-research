/*
Phil Sisk
6/19/2018

motorCommand.cpp
basic code for reading in motor commands from the keyboard.
Based roughly on teleop_turtle_key.cpp, which defines the "teleop_turtle" ROS node:
http://docs.ros.org/groovy/api/turtlesim/html/teleop__turtle__key_8cpp_source.html
*/

#include "ros/ros.h"
#include <string>
#include <sstream>
#include <std_msgs/Float32.h>
#include <rctestpkg/Motor_data.h>
#include <stdio.h>
#include <unistd.h>
#include <iostream>
#include <termios.h>

// KEYCODE definitions
#define KEYCODE_R 0x43	// right arrow
#define KEYCODE_L 0x44	// left arrow
#define KEYCODE_U 0x41	// up arrow
#define KEYCODE_D 0x42	// down arrow
#define KEYCODE_Q 0x71	// 'Q' key

#define CURRENT 3.0	// Current constant (3.0 AMPS)

// class TeleopCar - defines functions for controlling car via keyboard
class TeleopCar {
private:
	// Private member variables+
	int kfd; // File descriptor for keyboard input, is equal to stdin = 0
	const float FWD_CURRENT, RVS_CURRENT;
	struct termios oldt, newt;
	ros::NodeHandle n;
	ros::Publisher command_pub;
	std_msgs::Float32 motor_cmd_msg;
	ros::Rate loop_rate; // Loops at 10 Hz (this isn't currently used)


	// Private member functions
	void send_forward_cmd();
	void send_reverse_cmd();
	void send_stop_cmd();

	
public:
	// Constructor
	TeleopCar() :	kfd(STDIN_FILENO),		// fd for the keyboard (STDIN_FILENO = 0)
			FWD_CURRENT(CURRENT),		// 3.0 AMPS
			RVS_CURRENT(-CURRENT),		// -3.0 AMPS
			loop_rate(10)			// loop at 10 Hz (not currently used)
	{
		// Update keyboard input settings
		tcgetattr(kfd, &oldt);			// Save old input mode for resetting input
		newt = oldt;				// Begin with old input settings
		newt.c_lflag &=~ (ICANON | ECHO);	// Turn off canonical buffering/echoing
		newt.c_cc[VMIN] = 0;			// No min number of read bytes needed
		newt.c_cc[VTIME] = 1;			// 1/10 second before returning from read
		tcsetattr(kfd, TCSANOW, &newt);		// Apply new attributes

		// ROS setup
		command_pub = n.advertise<std_msgs::Float32>("Motor_command2", 1);

	}
	// Destructor
	~TeleopCar() {
		// Stop the car if it is still going
		send_stop_cmd();
		// Reset input mode (otherwise wonky terminal behavior occurs)
		tcsetattr(kfd, TCSANOW, &oldt);
	}
	void keyLoop();
	
}; // class TeleopCar

// Keyboard input loop
void TeleopCar::keyLoop() {
	char c;
	int count = 0;	// Keeps track of successive inputs to avoid jerky control
	bool forward = 0, reverse = 0;
	while (ros::ok()) {
		// Reads one character from the input
		if (!(read(kfd, &c, 1) > 0)) { 
			send_stop_cmd();
			forward = reverse = false;
			count = 0;
			//loop_rate.sleep();
			continue;
		}
		
		/* A single press of an arrow key sends three characters
		to the buffer - '\027', '\091', and one of the keycodes defined
		at the beginning of this file. These if statements detect that
		pattern
		*/
		// Looking for an arrow key
		if (c == 27) { // esc character
			if (getchar() == 91) { // '[' character
				c = getchar();
			}
		}

		// Parse keyboard input
		switch(c) {

		/*
		case KEYCODE_L:
			break;
		case KEYCODE_R:
			break;
		*/
		case KEYCODE_U:	// Up arrow pressed
			if (reverse) {
				std::cout << "Change to forward\n";
				reverse = false;
				count = 0;
			}
			forward = true;
			if (count > 2) send_forward_cmd();
			else { 
				++count;
				send_stop_cmd();
			}
			break;
		case KEYCODE_D: // Down arrow pressed
			if (forward) {
				std::cout << "Change to reverse\n";
				forward = false;
				count = 0;
			}
			reverse = true;
			if (count > 2) send_reverse_cmd();
			else { 
				++count;
				send_stop_cmd();
			}
			break;
		default: // send stop command if anything else is pressed
			send_stop_cmd();
			forward = reverse = false;
		} // switch(c)

		// Spin for callback functions
		ros::spinOnce();
	} // while(ros::ok())
}

// Publish forward command to Motor command ROS topic
void TeleopCar::send_forward_cmd() {
	motor_cmd_msg.data = FWD_CURRENT;
	command_pub.publish(motor_cmd_msg);
	std::cout << "Forward command sent" << std::endl;
}

// Publish reverse command to Motor command ROS topic
void TeleopCar::send_reverse_cmd() {
	motor_cmd_msg.data = RVS_CURRENT;
	command_pub.publish(motor_cmd_msg);
	std::cout << "Reverse command sent" << std::endl;
}

// Publish stop command to Motor command ROS topic
void TeleopCar::send_stop_cmd() {
	motor_cmd_msg.data = 0.0;
	command_pub.publish(motor_cmd_msg);
	std::cout << "Stop command sent" << std::endl;
}


int main(int argc, char **argv) {
	ros::init(argc, argv, "motorCommand");
	TeleopCar tc;
	tc.keyLoop();
	return 0;
}
