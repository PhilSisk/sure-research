# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/phil_catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/phil_catkin_ws/build

# Include any dependencies generated for this target.
include rctestpkg/CMakeFiles/animalAgeTalker.dir/depend.make

# Include the progress variables for this target.
include rctestpkg/CMakeFiles/animalAgeTalker.dir/progress.make

# Include the compile flags for this target's objects.
include rctestpkg/CMakeFiles/animalAgeTalker.dir/flags.make

rctestpkg/CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.o: rctestpkg/CMakeFiles/animalAgeTalker.dir/flags.make
rctestpkg/CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.o: /home/ubuntu/phil_catkin_ws/src/rctestpkg/src/animalAgeTalker.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ubuntu/phil_catkin_ws/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object rctestpkg/CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.o"
	cd /home/ubuntu/phil_catkin_ws/build/rctestpkg && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.o -c /home/ubuntu/phil_catkin_ws/src/rctestpkg/src/animalAgeTalker.cpp

rctestpkg/CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.i"
	cd /home/ubuntu/phil_catkin_ws/build/rctestpkg && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/ubuntu/phil_catkin_ws/src/rctestpkg/src/animalAgeTalker.cpp > CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.i

rctestpkg/CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.s"
	cd /home/ubuntu/phil_catkin_ws/build/rctestpkg && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/ubuntu/phil_catkin_ws/src/rctestpkg/src/animalAgeTalker.cpp -o CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.s

rctestpkg/CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.o.requires:
.PHONY : rctestpkg/CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.o.requires

rctestpkg/CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.o.provides: rctestpkg/CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.o.requires
	$(MAKE) -f rctestpkg/CMakeFiles/animalAgeTalker.dir/build.make rctestpkg/CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.o.provides.build
.PHONY : rctestpkg/CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.o.provides

rctestpkg/CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.o.provides.build: rctestpkg/CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.o

# Object files for target animalAgeTalker
animalAgeTalker_OBJECTS = \
"CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.o"

# External object files for target animalAgeTalker
animalAgeTalker_EXTERNAL_OBJECTS =

/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: rctestpkg/CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.o
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: rctestpkg/CMakeFiles/animalAgeTalker.dir/build.make
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: /opt/ros/jade/lib/libroscpp.so
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: /usr/lib/arm-linux-gnueabihf/libboost_signals.so
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: /usr/lib/arm-linux-gnueabihf/libboost_filesystem.so
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: /opt/ros/jade/lib/librosconsole.so
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: /opt/ros/jade/lib/librosconsole_log4cxx.so
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: /opt/ros/jade/lib/librosconsole_backend_interface.so
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: /usr/lib/liblog4cxx.so
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: /usr/lib/arm-linux-gnueabihf/libboost_regex.so
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: /opt/ros/jade/lib/libxmlrpcpp.so
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: /opt/ros/jade/lib/libroscpp_serialization.so
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: /opt/ros/jade/lib/librostime.so
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: /usr/lib/arm-linux-gnueabihf/libboost_date_time.so
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: /opt/ros/jade/lib/libcpp_common.so
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: /usr/lib/arm-linux-gnueabihf/libboost_system.so
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: /usr/lib/arm-linux-gnueabihf/libboost_thread.so
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: /usr/lib/arm-linux-gnueabihf/libpthread.so
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: /usr/lib/arm-linux-gnueabihf/libconsole_bridge.so
/home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker: rctestpkg/CMakeFiles/animalAgeTalker.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker"
	cd /home/ubuntu/phil_catkin_ws/build/rctestpkg && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/animalAgeTalker.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
rctestpkg/CMakeFiles/animalAgeTalker.dir/build: /home/ubuntu/phil_catkin_ws/devel/lib/rctestpkg/animalAgeTalker
.PHONY : rctestpkg/CMakeFiles/animalAgeTalker.dir/build

rctestpkg/CMakeFiles/animalAgeTalker.dir/requires: rctestpkg/CMakeFiles/animalAgeTalker.dir/src/animalAgeTalker.cpp.o.requires
.PHONY : rctestpkg/CMakeFiles/animalAgeTalker.dir/requires

rctestpkg/CMakeFiles/animalAgeTalker.dir/clean:
	cd /home/ubuntu/phil_catkin_ws/build/rctestpkg && $(CMAKE_COMMAND) -P CMakeFiles/animalAgeTalker.dir/cmake_clean.cmake
.PHONY : rctestpkg/CMakeFiles/animalAgeTalker.dir/clean

rctestpkg/CMakeFiles/animalAgeTalker.dir/depend:
	cd /home/ubuntu/phil_catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/phil_catkin_ws/src /home/ubuntu/phil_catkin_ws/src/rctestpkg /home/ubuntu/phil_catkin_ws/build /home/ubuntu/phil_catkin_ws/build/rctestpkg /home/ubuntu/phil_catkin_ws/build/rctestpkg/CMakeFiles/animalAgeTalker.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : rctestpkg/CMakeFiles/animalAgeTalker.dir/depend

