#include <iostream>
#include "ros/ros.h"
#include "rctestpkg/MPC_CC.h"
#include "std_msgs/Float32.h"
#include "rctestpkg/CarState.h"

#define SRV_REQ_VEL 0.3



class CC_controller {
private:
	rctestpkg::MPC_CC srv;
public:
	CC_controller() {
		srv.request.vr = SRV_REQ_VEL;
		srv.request.u0 = 0.0;
		srv.request.i0 = 0.0;
		srv.request.wv = 10000;
		srv.request.wi = 400,
		srv.request.i_max = 4.5;
		srv.request.i_min = -3;
	}
	rctestpkg::MPC_CC get_srv() { return srv; }
};

CC_controller cc;


void car_state_callback(const rctestpkg::CarState::ConstPtr& msg) {
}

int main(int argc, char ** argv) {
	ros::init(argc, argv, "CC_controller");
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("car_state", 1000, car_state_callback);
	ros::ServiceClient client = n.serviceClient<rctestpkg::MPC_CC>("MPC_CC2");
	ros::Publisher pub = n.advertise<std_msgs::Float32>("Motor_command2", 10);
	ros::Rate loop_rate(1);
	std_msgs::Float32 motor_command_msg;
	

	while (ros::ok()) {
		rctestpkg::MPC_CC srv =  cc.get_srv();
		if (client.call(srv)) {
			std::cout << "called service; response = " << srv.response.i << std::endl;
			motor_command_msg.data = (float)srv.response.i;
		}
		else {
			ROS_ERROR("Failed to call service MPC_CC");
			motor_command_msg.data = 0.0;
		}
		pub.publish(motor_command_msg);
		ros::spinOnce();
		loop_rate.sleep();
	}
	motor_command_msg.data = 0.0;
	pub.publish(motor_command_msg);
	return 0;
}