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
#include "rctestpkg/MPC_CC.h"
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
#define KEYCODE_C 0x63  // 'C' key

#define CURRENT 4.0	// Current constant (in amps)
#define SRV_REQ_VEL 0.2 // cruise control velocity (in m/s)
#define CPS2V 0.004653	//countPerSecond to velocity

// class TeleopCar - defines functions for controlling car via keyboard
class TeleopCar {
private:
	// Private member variables+
	int kfd; // File descriptor for keyboard input, is equal to stdin = 0
	const float FWD_CURRENT, RVS_CURRENT;
	double velocity, cruise_vel;
	struct termios oldt, newt;
	ros::NodeHandle n;
	ros::Publisher command_pub;
	std_msgs::Float32 motor_cmd_msg;
	ros::Rate loop_rate; // Loops at 10 Hz
	rctestpkg::Motor_data motor_data_msg;
	
	ros::ServiceClient cc_client;	// Cruise control service client
	rctestpkg::MPC_CC cc_srv;	// Cruise control service message

	ros::Subscriber motor_msg_sub;



	// Private member functions
	void send_forward_cmd();
	void send_reverse_cmd();
	void send_stop_cmd();
	void call_cc_service();
	void motor_callback(const rctestpkg::Motor_data::ConstPtr& msg);

	
public:
	// Constructor
	TeleopCar() :	kfd(STDIN_FILENO),		// fd for the keyboard (STDIN_FILENO = 0)
			FWD_CURRENT(CURRENT),		// 3.0 AMPS
			RVS_CURRENT(-CURRENT),		// -3.0 AMPS
			velocity(0.0),
			cruise_vel(0.0),
			loop_rate(20)			// loop at 10 Hz (not currently used)
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
		cc_client = n.serviceClient<rctestpkg::MPC_CC>("MPC_CC2");
		motor_msg_sub = n.subscribe("Motor_data2", 10, &TeleopCar::motor_callback, this);

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
	bool cruise_control = false;
	while (ros::ok()) {
		// Spin for callback functions
		ros::spinOnce();
		std::cout << "Velocity: " << velocity << std::endl;
		if (cruise_control) {
			call_cc_service();
		}
		// Reads one character from the input
		if (!(read(kfd, &c, 1) > 0)) { 
			if (!cruise_control) {
				send_stop_cmd();
				forward = reverse = false;
				count = 0;
				loop_rate.sleep();
			}
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

		case KEYCODE_C:
			if (cruise_control)
				std::cout << "cruise control off\n";
			else {
				std::cout << "cruise control on\n";
				cruise_vel = velocity;
			}
			cruise_control = !cruise_control;
			break;
		case KEYCODE_U:	// Up arrow pressed
			if (!cruise_control) {
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
			}
			break;
		case KEYCODE_D: // Down arrow pressed
			if (!cruise_control) {
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
			}
			break;
		default: // send stop command if anything else is pressed
			if (!cruise_control) {
				send_stop_cmd();
				forward = reverse = false;
			}
		} // switch(c)
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

void TeleopCar::call_cc_service() {
	std::cout << "requesting cruise at " << SRV_REQ_VEL << std::endl;

	cc_srv.request.vr = SRV_REQ_VEL;
	cc_srv.request.u0 = motor_data_msg.countPerSecond * CPS2V ;
	cc_srv.request.i0 = motor_data_msg.current;
	cc_srv.request.wv = 10000;
	cc_srv.request.wi = 400,
	cc_srv.request.i_max = 4.5;
	cc_srv.request.i_min = -3;
	if (cc_client.call(cc_srv)) {
		std::cout << "called service; response = " << cc_srv.response.i << std::endl;
		motor_cmd_msg.data = (float)cc_srv.response.i;
		command_pub.publish(motor_cmd_msg);
	}

	else {
		ROS_ERROR("Failed to call service MPC_CC");
	}
}

void TeleopCar::motor_callback(const rctestpkg::Motor_data::ConstPtr& msg) {
	velocity = msg->countPerSecond * CPS2V;
	motor_data_msg = *msg;
}


int main(int argc, char **argv) {
	ros::init(argc, argv, "motorCommand");
	TeleopCar tc;
	tc.keyLoop();
	return 0;
}
