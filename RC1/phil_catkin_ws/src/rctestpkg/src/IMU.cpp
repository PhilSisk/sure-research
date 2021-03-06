/*IMU.cpp
Phil Sisk
6/14/2018
Reads data from the IMU and publishes it to an IMUdata message

		Type				Name
Subscriptions:	(none)

Publications:	IMUdata				IMUdata

Services:	(none)

*/


#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>		// What is this used for?
#include <errno.h>		// Error number definitions
#include <termios.h>		// Port communication
#include <sstream>
#include <eigen3/Eigen/Dense>   // Used by yaw rate filter
#include <vector>		// Used in calculating mean
#include "ros/ros.h"		// ROS functionality
#include "rctestpkg/IMUdata.h"  // Message definition
#include <iostream>
#include "LowPassFilter.h"	// Yaw rate filter

// Function prototypes
void tty_setup(termios & tty, int USB);
int read_IMU_response(char * response, int USB);


int main (int argc, char ** argv) {
	// Open USB port for reading and writing
	int USB = open( "/dev/IMU", O_RDWR|O_NONBLOCK|O_NDELAY);
	if (USB < 0) {
		std::cout << "Error " << errno << " opening /dev/ttyACM1" << ": "
			<< strerror (errno) << std::endl;
	}
	
	// Create and set up tty
	struct termios tty;
	tty_setup(tty, USB);
	
	// Initialize ROS node and handle, create publisher object
	ros::init(argc, argv, "IMUtest");
	ros::NodeHandle n;
	ros::Publisher IMU_pub = n.advertise<rctestpkg::IMUdata>("IMUdata", 1000);
	rctestpkg::IMUdata msg;  // IMUdata message object;

	char response[1024];	
	std::stringstream ss;
	bool init = false;
	std::vector<double> initVec;
	const int SIZE = 1024;
	initVec.reserve(SIZE);
	double mean = 0;
	LowPassFilter yaw_rate_filter(0.2);

	// ROS Loop
	while (ros::ok()) {
		// Read in response from IMU (don't publish invalid messages)
		if (!(read_IMU_response(response, USB) > 0)) continue;

		// Shove response into ROS message and publish to topic IMUdata
		ss.clear();
		ss.str("");
		ss << response;
		std::cout << "Mean: " << mean << std::endl;
		ss >> msg.time >> msg.ax >> msg.ay >> msg.az >> msg.gx >> msg.gy >> msg.gz
			>> msg.mx >> msg.my >> msg.mz;

		// Filter the yaw rate signal		
		msg.gz = yaw_rate_filter.filt(msg.gz) - mean;
		// Gather a mean to eliminate an apparent bias in the yaw rate signal
		// After reading 1024 inputs, it continually subtracts this mean from
		// the raw data
		if (!init) {
			initVec.push_back(msg.gz);
			if (initVec.size() > SIZE - 1) {
				mean = 0;
				for (int i = 0; i < SIZE; ++i) {
					mean += initVec[i];
				}
				mean = mean/double(initVec.size());
				init = true;
			}
			msg.gz = 0.0;
		}
		
		
		ROS_INFO("Response: %s", response);
		std::cout << "msg.gz: " << msg.gz << std::endl;
		IMU_pub.publish(msg);	
		ros::spinOnce();
		usleep(8000);
	}
	return 0;
}

// Sets up tty with appropriate parameters
void tty_setup(termios & tty, int USB) {
	memset(&tty, 0, sizeof tty);
	if (tcgetattr(USB, &tty) != 0) {
		std::cout << "Error " << errno << " from tcgetattr: " << strerror(errno)
			<< std::endl;
	}

	/* Set Baud Rate */
	cfsetospeed (&tty, (speed_t)B115200);
	cfsetispeed (&tty, (speed_t)B115200);
	
	// Other port stuff
	tty.c_cflag &= ~PARENB;
	tty.c_cflag &= ~CSTOPB;
	tty.c_cflag &= ~CSIZE;
	tty.c_cflag |= CS8;
	tty.c_cflag &= ~CRTSCTS;
	tty.c_cc[VMIN] = 1;
	tty.c_cc[VTIME] = 5;
	tty.c_cflag |= CREAD | CLOCAL;
	cfmakeraw(&tty);

	tcflush(USB, TCIFLUSH); // Flush port
	if (tcsetattr(USB, TCSANOW, &tty) != 0) {
		std::cout << "Error " << errno << " from tcsetattr" << std::endl;
	}
}

// Reads response from IMU
int read_IMU_response(char * response, int USB) {
	memset(response, '\0', sizeof response); // clear response
	
	int n = 0;       // check for successful read 
	int spot = 0;    // spot in response
	char buf = '\0'; // Hold individual characters	
	do {
		n = read(USB, &buf, 1); // Reads one character into buf from the USB
		sprintf( &response[spot], "%c", buf );
		spot += n;
	} while (buf != '\n' && n > 0); // loops until newline or unsuccessful read
	return n;
}
