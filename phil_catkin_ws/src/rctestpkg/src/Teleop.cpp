/*
Phil Sisk
6/19/2018

Teleop.cpp
Reads in motor and servo commands from the keyboard and publishes controls to
the centralSignal message. This message is used by the central_controller node
to publish control commands to the motors.

Subscriptions:	(none)
Publications:	rctestpkg::CentralSignal centralSignal

USAGE:
ARROW KEYS: UP = forward, DOWN = reverse, LEFT = forward left, RIGHT = forward right
OTHER KEYS: C = toggle cruise control, V = toggle auto lanekeeping, S = stop

Teleop control based on teleop_turtle_key.cpp, which defines the "teleop_turtle" ROS node:
http://docs.ros.org/groovy/api/turtlesim/html/teleop__turtle__key_8cpp_source.html
*/

#include "ros/ros.h"
#include <string>
#include <sstream>
#include <rctestpkg/CentralSignal.h>	// Publication
#include <stdio.h>
#include <unistd.h>
#include <iostream>
#include <termios.h>


// KEYCODE definitions
#define KEYCODE_R 0x43	// right arrow
#define KEYCODE_L 0x44	// left arrow
#define KEYCODE_U 0x41	// up arrow
#define KEYCODE_D 0x42	// down arrow
#define KEYCODE_C 0x63 	// 'C' key
#define KEYCODE_V 0x76 	// 'V' key
#define KEYCODE_S 0x73	// 'S' key

// Constants
#define SERVO_MID	1537 	// Number of microseconds per pulse for straight wheels
#define MAX_PWM 	1837
#define MIN_PWM		1237
#define MIN_V		-1.0	// Min velocity (m/s)
#define MAX_V		1.0	// Max velocity (m/s)
#define FWD_VEL		0.5	// Nominal forward speed for teleop

// class TeleopCar - defines functions for controlling car via keyboard
class TeleopCar {
private:
	// Private member variables+
	int kfd; // File descriptor for keyboard input, is equal to stdin = 0
	double velocity, cruise_vel;
	struct termios oldt, newt;
	ros::NodeHandle n;
	
	ros::Publisher signal_pub;	// CentralSignal publisher
	rctestpkg::CentralSignal signal_msg;	// CentralSignal message

	ros::Rate loop_rate;
	ros::Subscriber motor_msg_sub;	// Motor data message

	// Private member functions
	void turn_left(int &);
	void turn_straight(int &);
	void turn_right(int &);
	
public:
	// Constructor
	TeleopCar() :	kfd(STDIN_FILENO),		// fd for the keyboard (STDIN_FILENO = 0)
			velocity(0.0),
			cruise_vel(0.0),
			loop_rate(20)			// loop at 20 Hz
	{
		// Update keyboard input settings
		tcgetattr(kfd, &oldt);			// Save old input mode for resetting input
		newt = oldt;				// Begin with old input settings
		newt.c_lflag &=~ (ICANON | ECHO);	// Turn off canonical buffering/echoing
		newt.c_cc[VMIN] = 0;			// No min number of read bytes needed
		newt.c_cc[VTIME] = 0;			// don't wait before returning from read
		tcsetattr(kfd, TCSANOW, &newt);		// Apply new attributes

		// ROS setup
		signal_pub = n.advertise<rctestpkg::CentralSignal>("centralSignal", 1);
		signal_msg.lanekeeping = false;
		signal_msg.right_lane = true;
		signal_msg.cruise_control = false;
		signal_msg.stop = false;
		signal_msg.command_v = 0.0;
		signal_msg.servo_pwm = SERVO_MID;
	}

	// Destructor
	~TeleopCar() {
		std::cout << "Killing Teleop...";
		// Stop the car if it is still going
		signal_msg.lanekeeping = false;
		signal_msg.cruise_control = false;
		signal_msg.stop = true;
		signal_msg.command_v = 0.0;
		signal_msg.servo_pwm = 0.0;
		for (int i = 0; i < 3; ++i)
			signal_pub.publish(signal_msg);
		// Reset input mode (otherwise wonky terminal behavior occurs)
		tcsetattr(kfd, TCSANOW, &oldt);
	}

	// Public member functions
	void keyLoop();
	
}; // class TeleopCar

// keyloop: Keyboard input loop function
void TeleopCar::keyLoop() {
	char c, dummy;
	int count = 0;	// Keeps track of successive inputs to avoid jerky control
	bool forward = 0, reverse = 0, left = 0, right = 0;
	std::cout << "Use the arrow keys to control the car or use Ctrl-C to quit.\n";
	std::cout << "Press 'c' for cruise control and 's' for manual steering.\n";
	bool	cruise_control = false,
		lanekeeping = false,
		stop = false;
	double 	command_v = 0.0,
		cruise_v = 0.0;
	int servo_pwm = SERVO_MID;
	while (ros::ok()) {
		loop_rate.sleep();

		// Populate and publish lanekeeping message
		signal_msg.lanekeeping = lanekeeping;
		signal_msg.cruise_control = cruise_control;
		signal_msg.stop = stop;
		signal_msg.command_v = command_v;
		signal_msg.servo_pwm = servo_pwm;
		signal_pub.publish(signal_msg);
		
		// Reads one character from the input
		if (!(read(kfd, &c, 1) > 0)) {
			if (!cruise_control) {
				command_v = 0.0;
				std::cout << "\33[2K\rStop" << std::flush;
				forward = reverse = false;
				count = 0;
			}
			if (!lanekeeping) {
				turn_straight(servo_pwm);
				left = right = false;
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
			read(kfd, &c, 1);
			if (c == 91) { // '[' character
				read(kfd, &c, 1);
			}
		}	


		// Parse keyboard input
		switch(c) {
		case KEYCODE_S:		// Stop command
			if (!stop)	{
				std::cout << "\nStopping car\n";
				command_v = 0.0;
			}
			else	{
				std::cout << "\nStarting car\n";
				command_v = cruise_v;
			}
			stop = !stop;
			break;
		case KEYCODE_C:		// Toggle cruise control
			if (cruise_control) {
				std::cout << "\ncruise control off\n";
				command_v = cruise_v = 0.0;
			}
			else {
				std::cout << "\ncruise control on\n";
				command_v = cruise_v = 0.3;	// Initial cruise velocity
			}
			cruise_control = !cruise_control;
			break;
		case KEYCODE_V:		// Toggle lanekeeping
			if (lanekeeping)
				std::cout << "\nlanekeeping off\n";
			else {
				std::cout << "\nlanekeeping on\n";
				cruise_vel = velocity;
			}
			lanekeeping = !lanekeeping;
			break;
		case KEYCODE_L:		// Left arrow pressed
			left = true;
			if (!lanekeeping) turn_left(servo_pwm);
			if (!cruise_control) {
				if (reverse) {
					reverse = false;
					count = 0;
				}
				forward = true;
				if (count > 0) {
					command_v = FWD_VEL;
				}
				else ++count;
			}
			break;
		case KEYCODE_R:		// Right arrow pressed
			right = true;
			if (!lanekeeping) turn_right(servo_pwm);
			if (!cruise_control) {
				if (reverse) {
					reverse = false;
					count = 0;
				}
				forward = true;
				if (count > 0) {
					command_v = FWD_VEL;
				}
				else ++count;
			}
			break;
		case KEYCODE_U:	// Up arrow pressed
			if (!cruise_control) {
				if (reverse) {
					reverse = false;
					count = 0;
				}
				forward = true;
				if (count > 0) {
					command_v = FWD_VEL;
					if (!lanekeeping) turn_straight(servo_pwm);
					std::cout << "\33[2K\rForward" << std::flush;

				}
				else { 
					++count;
				}
			}
			else {
				if (!stop) {
					command_v += 0.1;
					if (command_v > MAX_V) command_v = MAX_V;
					cruise_v = command_v;
					std::cout << "\33[2K\rCruise velocity: "
						<< cruise_v << std::flush;
				}
			}
			break;
		case KEYCODE_D: // Down arrow pressed
			if (!cruise_control) {
				if (forward) {
					forward = false;
					count = 0;
				}
				reverse = true;
				if (count > 0) {
					command_v = -FWD_VEL;
					if (!lanekeeping) turn_straight(servo_pwm);
					std::cout << "\33[2K\rReverse" << std::flush;

				}
				else { 
					++count;
				}
			}
			else {
				if (!stop) {
					command_v -= 0.1;
					if (command_v < MIN_V) command_v = MIN_V;
					cruise_v = command_v;
					std::cout << "\33[2K\rCruise velocity: "
						<< cruise_v << std::flush;
				}
			}
			break;
		default: // send stop command if anything else is pressed
			if (!cruise_control) {
				command_v = 0.0;
				std::cout << "\33[2K\rStop" << std::flush;
			}
			turn_straight(servo_pwm);
			forward = reverse = false;
			left = right = false;
		} // switch(c)

		tcflush(kfd, TCIFLUSH);
	} // while(ros::ok())
}


void TeleopCar::turn_left(int & servo_pwm) {
	if (servo_pwm > MIN_PWM) {
		servo_pwm -= 20;
	}
	std::cout << "\33[2K\rLeft" << std::flush;
}

void TeleopCar::turn_right(int & servo_pwm) {
	if (servo_pwm < MAX_PWM) {
		servo_pwm += 20;
	}
	std::cout << "\33[2K\rRight" << std::flush;
}

void TeleopCar::turn_straight(int & servo_pwm) {
	if (servo_pwm > SERVO_MID) {
		servo_pwm -= 20;
	}
	else if (servo_pwm < SERVO_MID) {
		servo_pwm += 20;
	}
}

int main(int argc, char **argv) {
	ros::init(argc, argv, "motorCommand");
	TeleopCar tc;
	tc.keyLoop();
	return 0;
}
