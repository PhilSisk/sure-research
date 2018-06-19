#include "ros/ros.h"
#include "rctestpkg/MultTwoInts.h"


bool mult(rctestpkg::MultTwoInts::Request &req, rctestpkg::MultTwoInts::Response &res) {
  res.product = req.a * req.b;
  ROS_INFO("request: x = %ld, y = %ld", (long int)req.a, (long int)req.b);
  ROS_INFO("sending back response: [%ld]", (long int)res.product);
  return true;
}

int main(int argc, char **argv) {
  ros::init(argc, argv, "MultTwoIntsServerToast");
  ros::NodeHandle n;
  ros::ServiceServer service = n.advertiseService("MultTwoInts", mult);
  ROS_INFO("Ready to mult two ints.");
  ros::spin();
  return 0;
}