#include "ros/ros.h"
#include "rctestpkg/TestTalkerMsg.h"
#include <string>

int main(int argc, char **argv) {
  // These first two lines initialize the ROS node and its handle
  ros::init(argc, argv, "TestTalker");
  ros::NodeHandle n;
  ros::Publisher talker_pub = n.advertise<rctestpkg::TestTalkerMsg>("testTalk", 1000);
  ros::Rate loop_rate(1);
  int count = 0;
  while(ros::ok()) {
    rctestpkg::TestTalkerMsg msg;
    msg.TestTalkerString = std::string("hello world");
    msg.TestTalkerInt = count + 1;
    ROS_INFO("%s", msg.TestTalkerString.c_str());
    talker_pub.publish(msg);
    ros::spinOnce();
    loop_rate.sleep();
    ++count;
  }
  return 0;
}
