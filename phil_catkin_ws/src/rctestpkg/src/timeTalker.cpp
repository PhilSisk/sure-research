#include "ros/ros.h"
#include "rctestpkg/currentTime.h"
#include <ctime>
#include <string>
#include <sstream> // You need to use an sstream object to convert an int to a string before C++11

int main(int argc, char ** argv) {
  ros::init(argc, argv, "timeTalker_toast");
  ros::NodeHandle n;
  ros::Publisher pub = n.advertise<rctestpkg::currentTime>("currentTime", 1000);
  ros::Rate loop_rate(1); // Loop once per second (1 Hz)
  while(ros::ok()) {
    rctestpkg::currentTime msg;
    time_t t = time(NULL);
    msg.time = static_cast<long int>(time(NULL));
    std::stringstream ss;
    ss << msg.time;
    std::string time_s = ss.str();
    ROS_INFO("Current time: %s", time_s.c_str());
    pub.publish(msg);
    ros::spinOnce();
    loop_rate.sleep();
  }
  return 0;
}