/* central_controller.cpp
Implements the central_controller class, which calls LK, CC, and ACC MPC nodes
*/

#include <iostream>
#include <ros/ros.h>
#include <std_msgs/Float32.h>		// Motor command
#include <std_msgs/Float64.h>		
#include <std_msgs/UInt16.h>		// Servo command
#include <rctestpkg/Motor_data.h>	// Data from the motor
#include <rctestpkg/MPC_LK.h>		// Lanekeeping service
#include <rctestpkg/MPC_CC.h>		// Cruise control service
#include <rctestpkg/CarState.h>		// Car state information
#include <eigen3/Eigen/Dense>   	// Used in computing discretized dynamics matrices
#include <vector>

#define SERVO_RATIO 0.00089479		// convert from lk response to servo command
#define SERVO_MID 1537			// PWM command for straight servo
#define LANEWIDTH 0.6			// Width of lane (in meters)
#define VMAX 0.5			// max velocity (m/s)
#define PI 3.14159
#define SRV_REQ_VEL 0.2 // cruise control velocity (in m/s)
#define CPS2V 0.004653	//countPerSecond to velocity

class central_controller {
private:
	ros::NodeHandle n;
	rctestpkg::CarState car_state;	// Car state info
	rctestpkg::MPC_LK lk_srv;	// Lanekeeping service message
	rctestpkg::MPC_CC cc_srv;	// Cruise control service message
	ros::ServiceClient	lk_client,	// Lanekeeping service client
				cc_client;	// Cruise control service client
	ros::Subscriber car_state_sub;
	ros::Subscriber motor_sub;
	ros::Publisher servo_pub;
	std_msgs::UInt16 servo_msg;
	rctestpkg::Motor_data motor_msg;
	float	servo_control,
		motor_control;
public:
	// Constructor
	central_controller() : servo_control(SERVO_MID), motor_control(0.0) {
		lk_client = n.serviceClient<rctestpkg::MPC_LK>("MPC_LK2");
		cc_client = n.serviceClient<rctestpkg::MPC_CC>("MPC_CC2");
		car_state_sub = n.subscribe("car_state", 1,
			&central_controller::car_state_callback, this);
		motor_sub = n.subscribe("Motor_data2", 10,
			&central_controller::motor_callback, this);
		servo_pub = n.advertise<std_msgs::UInt16>("servo", 10);
	}
	void publish_servo_msg();
	float call_lanekeeping_service();
	float call_cc_service();
	void getLateralDynamicsMatrices(double current_u);
	void car_state_callback(const rctestpkg::CarState::ConstPtr & msg);
	void motor_callback(const rctestpkg::Motor_data::ConstPtr & msg) {
		motor_msg = *msg;
	}
};

float central_controller::call_cc_service() {
	std::cout << "requesting cruise at " << SRV_REQ_VEL << std::endl;

	cc_srv.request.vr = SRV_REQ_VEL;
	cc_srv.request.u0 = motor_msg.countPerSecond * CPS2V ;
	cc_srv.request.i0 = motor_msg.current;
	cc_srv.request.wv = 10000;
	cc_srv.request.wi = 400;
	cc_srv.request.i_max = 4.5;
	cc_srv.request.i_min = -3;
	if (cc_client.call(cc_srv)) {
		std::cout << "called service; response = " << cc_srv.response.i << std::endl;
		motor_control =  (float)cc_srv.response.i;
	}

	else {
		ROS_ERROR("Failed to call service MPC_CC");
	}
	return motor_control;
}

float central_controller::call_lanekeeping_service() {
	// Due to possible numerical problems if car's longitudinal speed is less than
	// 0.1, only compute lanekeeping when speed is greater than 0.1
	double current_u = car_state.u;
	std::cout << "Current forward velocity: " << current_u << std::endl;
	if (current_u < 0.1) return servo_control;

	// Fill in data for service request
	lk_srv.request.y0 = car_state.y - LANEWIDTH;
	lk_srv.request.v0 = car_state.v;
	lk_srv.request.p0 = car_state.psi;
	lk_srv.request.r0 = car_state.r;
	lk_srv.request.s0 = 0.0;			// This is set to "prev_s" in .py code
	lk_srv.request.wy = 100.0;
	lk_srv.request.wv = 10.0;
	lk_srv.request.wp = 50.0;
	lk_srv.request.wr = 30.0;
	lk_srv.request.ws = 10.0;
	lk_srv.request.y_max = 0.8;
	lk_srv.request.y_min = -0.8;
	lk_srv.request.v_max = VMAX;
	lk_srv.request.p_max = 50.0 / 180.0 * PI;	// Convert from degrees to radians
	lk_srv.request.r_max = 20.0 / 180.0 * PI;
	lk_srv.request.s_max = 15.0 / 180.0 * PI;
	getLateralDynamicsMatrices(current_u);	// Compute A, B, Ed
	
	// Call service; if call is successful, publish servo command
	lk_srv.request.rd = std::vector<double>(21, 0);
	if (lk_client.call(lk_srv)) {
		double response = int(lk_srv.response.s/SERVO_RATIO);
		std::cout << "called service; response = "
			<< response << std::endl;
		servo_control = response + SERVO_MID;
		servo_msg.data = response + SERVO_MID;
		servo_pub.publish(servo_msg);
	}

	else {
		ROS_ERROR("Failed to call service MPC_LK");
	}
	return servo_control;
}


// Computes discretized lateral dynamics matrices with dt 0.1
void central_controller::getLateralDynamicsMatrices(double u) {
	Eigen::Matrix<double, 4, 4> A;
	Eigen::Matrix<double, 4, 1> B;
	Eigen::Matrix<double, 4, 1> E;
	unsigned int num_iter = 100;
	double	dt = 0.1,
		a = 0.17,
		b = 0.16,
		Caf = 14.66,
		Car = Caf * a / b,
		Iz = 0.03332;
	A << 	0, 1, u, 0,
		0, -(Caf + Car) / u, 0, ((-a * Caf + b * Car) / u - u),
		0, 0, 0, 1,
		0, (-a * Caf + b * Car) / (Iz * u), 0, -(a * a * Caf + b * b * Car)/ (Iz * u);
	B <<	0,
		Caf,
		0,
		a * Caf / Iz;
	E <<	0,
		0,
		-1,
		0;
	Eigen::Matrix<double, 4, 4> At =
				Eigen::Matrix<double, 4, 4>::Identity() * dt;
	Eigen::Matrix<double, 4, 4> Ad =
				Eigen::Matrix<double, 4, 4>::Identity();
	Eigen::Matrix<double, 4, 4> integral_A = At;
	for (unsigned int i = 2; i <= num_iter; ++i) {
		At = At * A*dt / i;
		integral_A += At;
		Ad += At / dt * i;
	}
	B = (integral_A * B);
	E = (integral_A * E);
	std::vector<double>	A_vec(Ad.data(), Ad.data() + Ad.size()),
				B_vec(B.data(), B.data() + B.size()),
				E_vec(E.data(), E.data() + E.size());
	lk_srv.request.A = A_vec;
	lk_srv.request.B = B_vec;
	lk_srv.request.E = E_vec;

	// Print matrices for debug
	std::cout << "A matrix (discretized):\n";
	for (int i = 0; i < 4; ++i) {
		for (int j = 0; j < 4; ++j) {
			std::cout << A_vec[4 * i + j] << "  ";
		}
		std::cout << std::endl;
	}
	std::cout << "\nB matrix\n";
	for (int i = 0; i < 4; ++i) {
		std::cout << B_vec[i] << std::endl;
	}
	std::cout << "\nE matrix\n";
	for (int i = 0; i < 4; ++i) {
		std::cout << E_vec[i] << std::endl;
	}	
}

void central_controller::car_state_callback(const rctestpkg::CarState::ConstPtr & msg) {
	car_state = *msg;
}

int main(int argc, char ** argv) {
	ros::init(argc, argv, "central_control2");
	central_controller controller;
	//ros::Publisher motor_pub = n.advertise<std_msgs::Float32>("Motor_command2", 10);
	std::cout << "Servo ratio: " << SERVO_RATIO << std::endl;
	ros::Rate loop_rate(10);
	while (ros::ok()) {
		ros::spinOnce();
		loop_rate.sleep();
		controller.call_lanekeeping_service();
	}
	return 0;
}
