/* central_controller.cpp
Implements the central_controller class, which sends control commands to the motors
Phil Sisk

		Type				Name
Subscriptions:	rctestpkg::CentralSignal	centralSignal
		rctestpkg::CarState		car_state

Publications:	std_msgs::Float32		Motor_command2
		std_msgs::UInt16		servo

Services:	rctestpkg::MPC_LK		LK_MPC2		(client)
		rctestpkg::MPC_CC		CC_MPC2		(client)
		rctestpkg::MPC_ACC		CC_ACC2		(client)

*/

#include <iostream>
#include <ros/ros.h>
#include <std_msgs/Float32.h>		// Motor command
#include <std_msgs/Float64.h>		
#include <std_msgs/UInt16.h>		// Servo command
#include <rctestpkg/Motor_data.h>	// Data from the motor
#include <rctestpkg/CentralSignal.h>	// Data from Teleop
#include <rctestpkg/MPC_LK.h>		// Lanekeeping service
#include <rctestpkg/MPC_CC.h>		// Cruise control service
#include <rctestpkg/MPC_ACC.h>		// Adaptive cruise control service
#include <rctestpkg/CarState.h>		// Car state information
#include <eigen3/Eigen/Dense>   	// Used in computing discretized dynamics matrices
#include <vector>
#include <cmath>

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
	rctestpkg::CarState car_state;		// Car state info
	rctestpkg::MPC_LK lk_srv;		// Lanekeeping service message
	rctestpkg::MPC_CC cc_srv;		// Cruise control service message
	rctestpkg::MPC_ACC acc_srv;		// ACC service message
	ros::ServiceClient	lk_client,	// Lanekeeping service client
				cc_client,	// Cruise control service client
				acc_client;	// Adaptive cruise control service
	ros::Subscriber car_state_sub;		// Car state subscriber
	ros::Subscriber signal_sub;		// Central signal subscriber
	ros::Publisher servo_pub;		// Servo command publisher
	ros::Publisher motor_pub;		// Motor command publisher
	std_msgs::UInt16 servo_msg;
	rctestpkg::CentralSignal signal_msg;
	float prev_s;				// Previous steering angle

	int 	servo_control;
	float	motor_control;
	float lane_position;

	int call_lanekeeping_service();
	float call_cc_service();
	float call_acc_service();
	void getLateralDynamicsMatrices(double current_u);

	/* CALLBACK FUNCTIONS */
	void car_state_callback(const rctestpkg::CarState::ConstPtr & msg) {
		car_state = *msg;
	}

	void signal_callback(const rctestpkg::CentralSignal::ConstPtr &msg) {
		signal_msg = *msg;
	}
public:
	// Constructor
	central_controller() :	servo_control(SERVO_MID),
				prev_s(0.0),
				motor_control(0.0),
				lane_position(LANEWIDTH) {
		
		lk_client = n.serviceClient<rctestpkg::MPC_LK>("MPC_LK2");
		cc_client = n.serviceClient<rctestpkg::MPC_CC>("MPC_CC2");
		acc_client = n.serviceClient<rctestpkg::MPC_ACC>("MPC_ACC2");
		
		car_state_sub = n.subscribe("car_state", 1,
			&central_controller::car_state_callback, this);

		signal_sub = n.subscribe("centralSignal", 1,
			&central_controller::signal_callback, this);

		servo_pub = n.advertise<std_msgs::UInt16>("servo", 10);
		motor_pub = n.advertise<std_msgs::Float32>("Motor_command2", 10);
	}
	~central_controller() {
		std_msgs::Float32 motor_command;
		std_msgs::UInt16 servo_command;
		motor_command.data = 0.0;
		servo_command.data = SERVO_MID;
		servo_pub.publish(servo_command);
		motor_pub.publish(motor_command);
	}
	void publish_commands();
		
}; // class central_controller

float central_controller::call_cc_service() {
	float command_v = signal_msg.command_v;
	std::cout << "requesting cruise at " << command_v << std::endl;

	cc_srv.request.vr = command_v;
	cc_srv.request.u0 = car_state.u;
	cc_srv.request.i0 = car_state.i;
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

float central_controller::call_acc_service() {
	float command_v = signal_msg.command_v;
	std::cout << "requesting cruise at " << command_v << std::endl;
	if (command_v < 0.0) command_v = 0.0;
	

	acc_srv.request.u0 = car_state.u;
	acc_srv.request.h0 = car_state.h;
	acc_srv.request.vl = car_state.vl;
	acc_srv.request.i0 = car_state.i;
	acc_srv.request.wv = 10;
	acc_srv.request.wh = 100;
	acc_srv.request.wi = 5;
	acc_srv.request.h_stop = 0.6;
	acc_srv.request.T_gap = 0.5;
	acc_srv.request.v_max = command_v;
	acc_srv.request.v_min = -0.1;
	acc_srv.request.h_min = 0.3;
	acc_srv.request.i_max = 4.5;
	acc_srv.request.i_min = -3;
	if (acc_client.call(acc_srv)) {
		std::cout << "called acc service; response = " << acc_srv.response.i << std::endl;
		motor_control =  (float)acc_srv.response.i;
	}

	else {
		ROS_ERROR("Failed to call service MPC_ACC");
	}
	return motor_control;
}

int central_controller::call_lanekeeping_service() {
	// Due to possible numerical problems if car's longitudinal speed is less than
	// 0.1, only compute lanekeeping when speed is greater than 0.1
	double current_u = car_state.u;
	if (current_u < 0.1) return servo_control;
	// Calculate desired current lane_position
	if (signal_msg.right_lane) {
		if (lane_position < LANEWIDTH) {
			lane_position += 0.01;
		}
	}
	else {
		if (lane_position > 0.0) {
			lane_position -= 0.01;
		}
	}

	// Fill in data for service request
	lk_srv.request.y0 = car_state.y - LANEWIDTH - lane_position;
	lk_srv.request.v0 = car_state.v;
	lk_srv.request.p0 = car_state.psi;
	lk_srv.request.r0 = car_state.r;
	lk_srv.request.s0 = prev_s;			// This is set to "prev_s" in .py code
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
		int response = int(lk_srv.response.s/SERVO_RATIO);
		prev_s = lk_srv.response.s;
		std::cout << "called service; response = "
			<< response << std::endl;
		servo_control = response + SERVO_MID;
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

// Publishes commands for the servo and motor depending on inputs
void central_controller::publish_commands() {
	std_msgs::Float32 motor_command;
	std_msgs::UInt16 servo_command;

	if (signal_msg.stop) {
		motor_command.data = 0.0;
		servo_command.data = SERVO_MID;
	}
	else {
		if (!signal_msg.cruise_control) {	// Manual speed control
			if (fabs(signal_msg.command_v) > 0.01) {
					motor_command.data = call_cc_service();
			}
			else {
				motor_command.data = 0.0;
			}
		}
	
		else {	// Cruise control (ACC or CC depending on heaadway and desired speed)
			if (signal_msg.command_v > 0.0 &&
				car_state.h < 2.0 &&
				fabs(car_state.h_angle) < (10.0 / 180.0 * PI)) { // < 20 degrees
				motor_command.data = call_acc_service();
			}
			else {
				motor_command.data = call_cc_service();
			}
		}
	
		// Send manual or auto lanekeeping depending on central signal
		if (signal_msg.lanekeeping) {
			servo_command.data = call_lanekeeping_service();
		}
		else {
			servo_command.data = signal_msg.servo_pwm;
			prev_s = float(signal_msg.servo_pwm - SERVO_MID) * SERVO_RATIO;
		}
	}

	// Publish commands
	motor_pub.publish(motor_command);
	servo_pub.publish(servo_command);
	std::cout << "Prev s: " << prev_s << std::endl;		
}

int main(int argc, char ** argv) {
	std::cout << "Starting central controller...\n";
	ros::init(argc, argv, "central_control2");
	central_controller controller;
	ros::Rate loop_rate(20);
	while (ros::ok()) {
		ros::spinOnce();
		loop_rate.sleep();
		controller.publish_commands();
	}
	return 0;
}
