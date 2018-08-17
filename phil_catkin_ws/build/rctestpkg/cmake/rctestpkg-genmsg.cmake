# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "rctestpkg: 6 messages, 3 services")

set(MSG_I_FLAGS "-Irctestpkg:/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg;-Istd_msgs:/opt/ros/jade/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/jade/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/jade/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rctestpkg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_CC.srv" NAME_WE)
add_custom_target(_rctestpkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rctestpkg" "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_CC.srv" ""
)

get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/TestTalkerMsg.msg" NAME_WE)
add_custom_target(_rctestpkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rctestpkg" "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/TestTalkerMsg.msg" ""
)

get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/currentTime.msg" NAME_WE)
add_custom_target(_rctestpkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rctestpkg" "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/currentTime.msg" ""
)

get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/LKdata.msg" NAME_WE)
add_custom_target(_rctestpkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rctestpkg" "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/LKdata.msg" ""
)

get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/IMUdata.msg" NAME_WE)
add_custom_target(_rctestpkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rctestpkg" "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/IMUdata.msg" ""
)

get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/CarState.msg" NAME_WE)
add_custom_target(_rctestpkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rctestpkg" "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/CarState.msg" ""
)

get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_LK.srv" NAME_WE)
add_custom_target(_rctestpkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rctestpkg" "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_LK.srv" ""
)

get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MultTwoInts.srv" NAME_WE)
add_custom_target(_rctestpkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rctestpkg" "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MultTwoInts.srv" ""
)

get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/Motor_data.msg" NAME_WE)
add_custom_target(_rctestpkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rctestpkg" "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/Motor_data.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/TestTalkerMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rctestpkg
)
_generate_msg_cpp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/currentTime.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rctestpkg
)
_generate_msg_cpp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/LKdata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rctestpkg
)
_generate_msg_cpp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/IMUdata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rctestpkg
)
_generate_msg_cpp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/CarState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rctestpkg
)
_generate_msg_cpp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/Motor_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rctestpkg
)

### Generating Services
_generate_srv_cpp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MultTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rctestpkg
)
_generate_srv_cpp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_CC.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rctestpkg
)
_generate_srv_cpp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_LK.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rctestpkg
)

### Generating Module File
_generate_module_cpp(rctestpkg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rctestpkg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rctestpkg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rctestpkg_generate_messages rctestpkg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_CC.srv" NAME_WE)
add_dependencies(rctestpkg_generate_messages_cpp _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/TestTalkerMsg.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_cpp _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/currentTime.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_cpp _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/LKdata.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_cpp _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/IMUdata.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_cpp _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/CarState.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_cpp _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_LK.srv" NAME_WE)
add_dependencies(rctestpkg_generate_messages_cpp _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MultTwoInts.srv" NAME_WE)
add_dependencies(rctestpkg_generate_messages_cpp _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/Motor_data.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_cpp _rctestpkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rctestpkg_gencpp)
add_dependencies(rctestpkg_gencpp rctestpkg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rctestpkg_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/TestTalkerMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rctestpkg
)
_generate_msg_eus(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/currentTime.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rctestpkg
)
_generate_msg_eus(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/LKdata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rctestpkg
)
_generate_msg_eus(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/IMUdata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rctestpkg
)
_generate_msg_eus(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/CarState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rctestpkg
)
_generate_msg_eus(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/Motor_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rctestpkg
)

### Generating Services
_generate_srv_eus(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MultTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rctestpkg
)
_generate_srv_eus(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_CC.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rctestpkg
)
_generate_srv_eus(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_LK.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rctestpkg
)

### Generating Module File
_generate_module_eus(rctestpkg
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rctestpkg
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(rctestpkg_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(rctestpkg_generate_messages rctestpkg_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_CC.srv" NAME_WE)
add_dependencies(rctestpkg_generate_messages_eus _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/TestTalkerMsg.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_eus _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/currentTime.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_eus _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/LKdata.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_eus _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/IMUdata.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_eus _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/CarState.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_eus _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_LK.srv" NAME_WE)
add_dependencies(rctestpkg_generate_messages_eus _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MultTwoInts.srv" NAME_WE)
add_dependencies(rctestpkg_generate_messages_eus _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/Motor_data.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_eus _rctestpkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rctestpkg_geneus)
add_dependencies(rctestpkg_geneus rctestpkg_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rctestpkg_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/TestTalkerMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rctestpkg
)
_generate_msg_lisp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/currentTime.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rctestpkg
)
_generate_msg_lisp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/LKdata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rctestpkg
)
_generate_msg_lisp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/IMUdata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rctestpkg
)
_generate_msg_lisp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/CarState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rctestpkg
)
_generate_msg_lisp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/Motor_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rctestpkg
)

### Generating Services
_generate_srv_lisp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MultTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rctestpkg
)
_generate_srv_lisp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_CC.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rctestpkg
)
_generate_srv_lisp(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_LK.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rctestpkg
)

### Generating Module File
_generate_module_lisp(rctestpkg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rctestpkg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rctestpkg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rctestpkg_generate_messages rctestpkg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_CC.srv" NAME_WE)
add_dependencies(rctestpkg_generate_messages_lisp _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/TestTalkerMsg.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_lisp _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/currentTime.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_lisp _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/LKdata.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_lisp _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/IMUdata.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_lisp _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/CarState.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_lisp _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_LK.srv" NAME_WE)
add_dependencies(rctestpkg_generate_messages_lisp _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MultTwoInts.srv" NAME_WE)
add_dependencies(rctestpkg_generate_messages_lisp _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/Motor_data.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_lisp _rctestpkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rctestpkg_genlisp)
add_dependencies(rctestpkg_genlisp rctestpkg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rctestpkg_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/TestTalkerMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rctestpkg
)
_generate_msg_py(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/currentTime.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rctestpkg
)
_generate_msg_py(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/LKdata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rctestpkg
)
_generate_msg_py(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/IMUdata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rctestpkg
)
_generate_msg_py(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/CarState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rctestpkg
)
_generate_msg_py(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/Motor_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rctestpkg
)

### Generating Services
_generate_srv_py(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MultTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rctestpkg
)
_generate_srv_py(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_CC.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rctestpkg
)
_generate_srv_py(rctestpkg
  "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_LK.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rctestpkg
)

### Generating Module File
_generate_module_py(rctestpkg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rctestpkg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rctestpkg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rctestpkg_generate_messages rctestpkg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_CC.srv" NAME_WE)
add_dependencies(rctestpkg_generate_messages_py _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/TestTalkerMsg.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_py _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/currentTime.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_py _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/LKdata.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_py _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/IMUdata.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_py _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/CarState.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_py _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MPC_LK.srv" NAME_WE)
add_dependencies(rctestpkg_generate_messages_py _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/srv/MultTwoInts.srv" NAME_WE)
add_dependencies(rctestpkg_generate_messages_py _rctestpkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg/Motor_data.msg" NAME_WE)
add_dependencies(rctestpkg_generate_messages_py _rctestpkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rctestpkg_genpy)
add_dependencies(rctestpkg_genpy rctestpkg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rctestpkg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rctestpkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rctestpkg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(rctestpkg_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(rctestpkg_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rctestpkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rctestpkg
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(rctestpkg_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(rctestpkg_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rctestpkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rctestpkg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(rctestpkg_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(rctestpkg_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rctestpkg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rctestpkg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rctestpkg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(rctestpkg_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(rctestpkg_generate_messages_py sensor_msgs_generate_messages_py)
endif()
