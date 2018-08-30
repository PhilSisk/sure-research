cmake_minimum_required(VERSION 2.8.3)
project(rctestpkg)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)


# Using OpenCV
find_package( OpenCV REQUIRED )

find_package(CUDA 6.5 REQUIRED)

include_directories(${CUDA_INCLUDE_DIRS} ${CUDA_CUT_INCLUDE_DIR})

set(cudd_LIBRARIES_REL cudd dddmp epd util mtr st)
set(cudd_LIBRARIES)
foreach(lib ${cudd_LIBRARIES_REL})
  list(APPEND cudd_LIBRARIES ${CMAKE_CURRENT_SOURCE_DIR}/cudd-2.5.0/${lib}/lib${lib}.a)
endforeach()

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  sensor_msgs
  message_generation
  rosconsole
  eiquadprog
)

## System dependencies are found with CMake's conventions
# find_package(Boost REQUIRED COMPONENTS system)


## Uncomment this if the package has a setup.py. This macro ensures
## modules and global scripts declared therein get installed
## See http://ros.org/doc/api/catkin/html/user_guide/setup_dot_py.html
# catkin_python_setup()

################################################
## Declare ROS messages, services and actions ##
################################################

## Generate messages in the 'msg' folder
add_message_files(
   FILES
   IMUdata.msg
   Motor_data.msg
   CarState.msg
   LKdata.msg
   CentralSignal.msg
   Headway.msg
)

## Generate services in the 'srv' folder
add_service_files(
   FILES
   ComputeControl.srv
   MPC_CC.srv
   MPC_LK.srv
   MPC_ACC.srv
)

## Generate actions in the 'action' folder
# add_action_files(
#   FILES
#   Action1.action
#   Action2.action
# )

## Generate added messages and services with any dependencies listed here
generate_messages(
   DEPENDENCIES
   std_msgs
   sensor_msgs
)


###################################
## catkin specific configuration ##
###################################

catkin_package(
#  INCLUDE_DIRS include
  LIBRARIES rctestpkg
  CATKIN_DEPENDS roscpp rospy std_msgs
#  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
   cudd-2.5.0/include ${catkin_INCLUDE_DIRS} ${OpenCV_DIR}
)

## Declare a C++ library
# add_library(${PROJECT_NAME}
#   src/${PROJECT_NAME}/rctestpkg.cpp
add_library(rs232 STATIC src/rs232.cpp)
add_library(ccsolver STATIC src/ccsolver.cpp)
add_library(lksolver STATIC src/lksolver.cpp)
add_library(accsolver STATIC src/accsolver.cpp)
# )

## Add cmake target dependencies of the library
## as an example, code may need to be generated before libraries
## either from message generation or dynamic reconfigure
# add_dependencies(${PROJECT_NAME} ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

## Declare a C++ executable
## With catkin_make all packages are built within a single CMake context
## The recommended prefix ensures that target names across packages don't collide
# add_executable(${PROJECT_NAME}_node src/rctestpkg_node.cpp)

## Rename C++ executable without prefix
## The above recommended prefix causes long target names, the following renames the
## target back to the shorter version for ease of user use
## e.g. "rosrun someones_pkg node" instead of "rosrun someones_pkg someones_pkg_node"
# set_target_properties(${PROJECT_NAME}_node PROPERTIES OUTPUT_NAME node PREFIX "")

## Add cmake target dependencies of the executable
## same as for the library above
# add_dependencies(${PROJECT_NAME}_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

## Specify libraries to link a library or executable target against
# target_link_libraries(${PROJECT_NAME}_node
#   ${catkin_LIBRARIES}
# )

#############
## Install ##
#############

# all install targets should use catkin DESTINATION variables
# See http://ros.org/doc/api/catkin/html/adv_user_guide/variables.html

## Mark executable scripts (Python etc.) for installation
## in contrast to setup.py, you can choose the destination
# install(PROGRAMS
#   scripts/my_python_script
#   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark executables and/or libraries for installation
# install(TARGETS ${PROJECT_NAME} ${PROJECT_NAME}_node
#   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark cpp header files for installation
# install(DIRECTORY include/${PROJECT_NAME}/
#   DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
#   FILES_MATCHING PATTERN "*.h"
#   PATTERN ".svn" EXCLUDE
# )

## Mark other files for installation (e.g. launch and bag files, etc.)
# install(FILES
#   # myfile1
#   # myfile2
#   DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
# )

#############
## Testing ##
#############

## Add gtest based cpp test target and link libraries
# catkin_add_gtest(${PROJECT_NAME}-test test/test_rctestpkg.cpp)
# if(TARGET ${PROJECT_NAME}-test)
#   target_link_libraries(${PROJECT_NAME}-test ${PROJECT_NAME})
# endif()

## Add folders to be run by python nosetests
# catkin_add_nosetests(test)

add_executable(lane_publisher src/lane_publisher.cpp)
add_dependencies(lane_publisher um_acc_generate_messages_cpp)
target_link_libraries(lane_publisher ${catkin_LIBRARIES} ${OpenCV_LIBS})

add_executable(IMU src/IMU.cpp)
target_link_libraries(IMU ${catkin_LIBRARIES})
add_dependencies(IMU rctestpkg_generate_messages_cpp)

add_executable(motor src/motor.cpp)
add_dependencies(motor rctestpkg_generate_messages_cpp)
target_link_libraries(rs232 ${catkin_LIBRARIES})
target_link_libraries(motor ${catkin_LIBRARIES} rs232)

add_executable(CC_MPC src/CC_MPC.cpp)
add_dependencies(CC_MPC rctestpkg_generate_messages_cpp)
target_link_libraries(CC_MPC ${catkin_LIBRARIES} ccsolver)

add_executable(lkdata src/lkdata.cpp)
add_dependencies(lkdata rctestpkg_generate_messages_cpp)
target_link_libraries(lkdata ${catkin_LIBRARIES})

add_executable(LK_MPC src/LK_MPC.cpp)
add_dependencies(LK_MPC rctestpkg_generate_messages_cpp)
target_link_libraries(LK_MPC ${catkin_LIBRARIES} lksolver)

add_executable(GetCarState src/GetCarState.cpp)
add_dependencies(GetCarState rctestpkg_generate_messages_cpp)
target_link_libraries(GetCarState ${catkin_LIBRARIES})

add_executable(central_controller src/central_controller.cpp)
add_dependencies(central_controller rctestpkg_generate_messages_cpp)
target_link_libraries(central_controller ${catkin_LIBRARIES})

add_executable(calculate_headway src/calculate_headway.cpp)
add_dependencies(calculate_headway rctestpkg_generate_messages_cpp)
target_link_libraries(calculate_headway ${catkin_LIBRARIES})

add_executable(Teleop src/Teleop.cpp)
add_dependencies(Teleop rctestpkg_generate_messages_cpp)
target_link_libraries(Teleop ${catkin_LIBRARIES})

add_executable(ACC_MPC src/ACC_MPC.cpp)
add_dependencies(ACC_MPC rctestpkg_generate_messages_cpp)
target_link_libraries(ACC_MPC ${catkin_LIBRARIES} accsolver)

#catkin_install_python(
#  PROGRAMS
#  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

