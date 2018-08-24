#define CPS2V 0.004653//countPerSecond to velocity
#define MAXCURRENT 0.25
#define SERVOMID 1537
#define SERVOMAXAMP 200 //Maximal servo amplitude
#define CARID 2

#include <iostream>
#include "ros/ros.h"
#include <rctestpkg/LKdata.h>
#include <rctestpkg/Motor_data.h>
#include <rctestpkg/CarState.h>
#include <std_msgs/Float64.h>
#include <rctestpkg/Headway.h>
#include <deque>		// Used in v_lead calculation
#include <numeric>		// For std::inner_product

#include "LowPassFilter.h"	// LPF used by lead car velocity

class car_state {
private:
	rctestpkg::CarState state_msg;
	std::deque<double> h_deque;
	LowPassFilter vl_lpf;	// Lead car velocity filter
public: 
	car_state() : vl_lpf(0.4) {}
	void set_lk_data(const rctestpkg::LKdata::ConstPtr& msg);
	void set_motor_data(const rctestpkg::Motor_data::ConstPtr& msg);
	void calculate_v_lead();
	rctestpkg::CarState get_state_msg() { return state_msg; }

	/* CALLBACK FUNCTIONS */
	void motor_callback(const rctestpkg::Motor_data::ConstPtr& msg) {
		std::cout << "motor_callback\n";
		set_motor_data(msg);
	}

	void LK_callback(const rctestpkg::LKdata::ConstPtr& msg) {
		std::cout << "LK_callback " << "\n";
		set_lk_data(msg);
	}

	void headway_callback(const rctestpkg::Headway::ConstPtr& msg){
		std::cout << "headway_callback\n";
		state_msg.h = msg->h;
		state_msg.h_angle = msg->angle;
	}

	void timed_callback(const ros::TimerEvent &) {
		calculate_v_lead();
	}
};

void car_state::set_lk_data(const rctestpkg::LKdata::ConstPtr& msg) {
	state_msg.y = msg->y;		// Lateral position
	state_msg.v = msg->vl;		// Lateral velocity
	state_msg.psi = msg->psi;	// Yaw
	state_msg.r = msg->r;		// Yaw rate
	state_msg.rd = msg->rd;		// Road disturbance
	// Setting all constants not important for lanekeeping to 0 (for now);
	state_msg.time = 0;
	state_msg.x_global = 0;
	state_msg.y_global = 0;
	state_msg.yaw_global = 0;
}

void car_state::set_motor_data(const rctestpkg::Motor_data::ConstPtr& msg) {
	state_msg.u = msg->countPerSecond*CPS2V;
}

void car_state::calculate_v_lead() {
	h_deque.push_back(state_msg.h);
	double delta_h = 0;
	if (h_deque.size() > 2) {
		h_deque.pop_front();
		delta_h = (h_deque[1] - h_deque[0]) / 0.1;
	}
	state_msg.vl = vl_lpf.filt(delta_h + state_msg.u);
}


int main(int argc, char ** argv) {
	ros::init(argc, argv, "CarStatePublisher");
	ros::NodeHandle n;
	car_state cs;
	ros::Publisher state_pub = n.advertise<rctestpkg::CarState>("car_state", 10);
	ros::Subscriber motor_sub = n.subscribe("Motor_data2", 10, &car_state::motor_callback, &cs);
	ros::Subscriber lk_sub = n.subscribe("lk_data", 10, &car_state::LK_callback, &cs);
	ros::Subscriber headway_sub = n.subscribe("headway", 10, &car_state::headway_callback, &cs);
	ros::Timer timer1 = n.createTimer(ros::Duration(0.1), &car_state::timed_callback, &cs);
	ros::Rate loop_rate(50);
	ros::spinOnce();
	while(ros::ok()) {
		std::cout << "In main loop\n";
		state_pub.publish(cs.get_state_msg());
		ros::spinOnce();
		loop_rate.sleep();
	}
	return 0;
}
	
