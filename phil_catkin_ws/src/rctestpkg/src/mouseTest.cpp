#include <string>
#include <sstream>
#include <stdio.h>
#include <unistd.h>
#include <iostream>
#include <termios.h>
#include "ros/ros.h"
#include <stdlib.h>
#include <fcntl.h>
#include <linux/input.h>

#define MOUSEFILE "/dev/input/event3" // mouse file name

int main() {
	int fd;
	fd = open(MOUSEFILE, O_RDONLY);
	std::cout << "fd: " << fd << std::endl;
	if (fd < 0) {
		std::cout << "Device open error\n";
		return 1;
	}
	else std::cout << "Device open ok\n";
	return 0;
}
