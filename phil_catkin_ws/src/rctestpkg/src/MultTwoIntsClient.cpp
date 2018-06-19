#include "ros/ros.h"
#include "rctestpkg/MultTwoInts.h"
#include "rctestpkg/TestTalkerMsg.h"

ros::ServiceClient *clientPtr;

void listenerCallBack(const rctestpkg::TestTalkerMsg::ConstPtr& msg) {
  ROS_INFO("I heard %ld", (long int)msg->TestTalkerInt);

  ros::ServiceClient client = (ros::ServiceClient)*clientPtr;
  rctestpkg::MultTwoInts srv;
  srv.request.a = (long int)msg->TestTalkerInt;
  srv.request.b = 2;

  if (client.call(srv)) {
    ROS_INFO("Product: %ld", (long int)srv.response.product);
  }
  else {
    ROS_INFO("Failed to call service MultTwoInts");
  }
}


int main(int argc, char ** argv) {
  ros::init(argc, argv, "MultTwoIntsClientToast");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("testTalk", 1000, listenerCallBack);
  ros::ServiceClient client = n.serviceClient<rctestpkg::MultTwoInts>("MultTwoInts");
  clientPtr = &client;

  ros::spin();
 
  return 0;
}