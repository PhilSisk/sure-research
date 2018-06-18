#include "ros/ros.h"
#include "rctestpkg/TestTalkerMsg.h"
#include <string>

void ListenerCallBack(const rctestpkg::TestTalkerMsg::ConstPtr& msg) {
  ROS_INFO("I heard: %s", msg->TestTalkerString.c_str());
}


int main(int argc, char **argv) {
  ros::init(argc, argv, "TestListener_toast");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("testTalk", 1000, ListenerCallBack);
  ros::spin();
  return 0;
}
