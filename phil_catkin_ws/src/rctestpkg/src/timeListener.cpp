#include "ros/ros.h"
#include "rctestpkg/currentTime.h"
#include <string>
#include <sstream>

void callback(const rctestpkg::currentTime::ConstPtr & msg) {
  std::stringstream ss;
  ss << msg->time;
  std::string time_s = ss.str();
  ROS_INFO("I heard: %s", time_s.c_str());
}

int main(int argc, char ** argv) {
  ros::init(argc, argv, "timeListener");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("currentTime", 1000, callback);
  ros::spin();
  return 0;
}
