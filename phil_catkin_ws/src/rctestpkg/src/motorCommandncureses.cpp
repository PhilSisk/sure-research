/*
Phil Sisk
6/19/2018

motorCommand.cpp
basic code for reading in motor commands from the keyboard.
Based on teleop_turtle_key.cpp, which defines the "teleop_turtle" ROS node.
*/


#include "ros/ros.h"
#include <string>
#include <sstream>
#include <std_msgs/Float32.h>
#include <rctestpkg/Motor_data.h>
#include <stdio.h>
#include <unistd.h>
#include <curses.h>
#include <ncurses.h>
#include <iostream>
#include <termios.h>

// KEYCODE definitions
#define KEYCODE_R 0x43	// right arrow
#define KEYCODE_L 0x44	// left arrow
#define KEYCODE_U 0x41	// up arrow
#define KEYCODE_D 0x42	// down arrow
#define KEYCODE_Q 0x71	// 'Q' key

// GLOBAL CONSTANTS FOR NOW
//int kfd = 0;
//struct termios cooked, raw;

// TeleopCar class - defines functions for reading in from keyboard
class TeleopCar {
private:
	int kfd;
	struct termios oldt, newt;
public:
	TeleopCar() : kfd(0) {
		// Save old input mode
		/*
		TEMPORARILY DISABLED FOR NCURSES
		tcgetattr(STDIN_FILENO, &oldt);
		newt = oldt;
		newt.c_lflag &=~ (ICANON | ECHO);
		newt.c_cc[VMIN] = 0;
		//newt.c_cc[VTIME] = 2;
		tcsetattr(STDIN_FILENO, TCSANOW, &newt);

		//fcntl(kfd, F_SETFL, O_NONBLOCK); // Set to non-blocking
		*/
	
	}
	// Destructor
	~TeleopCar() {
		// Reset input mode (otherwise wonky terminal behavior occurs)
		//tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
	}
	void keyLoop();
	
};

// Loops and reads input from the keyboard at a rate of 10 Hz
void TeleopCar::keyLoop() {
	int c;
	ros::Rate loop_rate(60); // Loops at 90 Hz
	int count = 0;
	while (ros::ok()) {
		// Reads one character from the input
		/*
		if (!(read(kfd, &c, 1) > 0)) {
			std::cout << "No input\n";
			loop_rate.sleep();
			continue;
		}
		*/
		c = getch();
		printw("character: %c\n", c);
		/*
		if (c == 27) {
			if (getchar() == 91) {
				c = getchar();
				c = getchar();
				std::cout << c << std::endl;
			}
		}
		*/
		switch(c) {
		case KEYCODE_L:
			printw("LEFT\n");
			break;
		case KEYCODE_R:
			printw("RIGHT\n");
			break;
		case KEYCODE_U:
			printw("UP\n");
			break;
		case KEYCODE_D:
			printw("DOWN\n");
			break;
		//default:
			//std::cout << c << "\n";
		}
		ros::spinOnce();
		loop_rate.sleep();
	}
}
	


int main(int argc, char **argv) {
	initscr();
	cbreak();
	noecho();
	ros::init(argc, argv, "motorCommand");
	ros::NodeHandle n;
	ros::Publisher command_pub = n.advertise<std_msgs::Float32>("Motor_command2", 1);
	std_msgs::Float32 msg;

	//char c = getch();
	//std::cout << c << std::endl;

	TeleopCar tc;
	tc.keyLoop();
	endwin();
	return 0;
}