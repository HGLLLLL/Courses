# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/huang/miniforge3/envs/ros_env/bin/cmake

# The command to remove a file.
RM = /home/huang/miniforge3/envs/ros_env/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/huang/test_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/huang/test_ws/build

# Utility rule file for _ball_detect_generate_messages_check_deps_BoundingBoxArray.

# Include any custom commands dependencies for this target.
include ball_detect/CMakeFiles/_ball_detect_generate_messages_check_deps_BoundingBoxArray.dir/compiler_depend.make

# Include the progress variables for this target.
include ball_detect/CMakeFiles/_ball_detect_generate_messages_check_deps_BoundingBoxArray.dir/progress.make

ball_detect/CMakeFiles/_ball_detect_generate_messages_check_deps_BoundingBoxArray:
	cd /home/huang/test_ws/build/ball_detect && ../catkin_generated/env_cached.sh /home/huang/miniforge3/envs/ros_env/bin/python3.11 /home/huang/miniforge3/envs/ros_env/share/genmsg/cmake/../../../lib/genmsg/genmsg_check_deps.py ball_detect /home/huang/test_ws/src/ball_detect/msg/BoundingBoxArray.msg std_msgs/Header:ball_detect/BoundingBox

_ball_detect_generate_messages_check_deps_BoundingBoxArray: ball_detect/CMakeFiles/_ball_detect_generate_messages_check_deps_BoundingBoxArray
_ball_detect_generate_messages_check_deps_BoundingBoxArray: ball_detect/CMakeFiles/_ball_detect_generate_messages_check_deps_BoundingBoxArray.dir/build.make
.PHONY : _ball_detect_generate_messages_check_deps_BoundingBoxArray

# Rule to build all files generated by this target.
ball_detect/CMakeFiles/_ball_detect_generate_messages_check_deps_BoundingBoxArray.dir/build: _ball_detect_generate_messages_check_deps_BoundingBoxArray
.PHONY : ball_detect/CMakeFiles/_ball_detect_generate_messages_check_deps_BoundingBoxArray.dir/build

ball_detect/CMakeFiles/_ball_detect_generate_messages_check_deps_BoundingBoxArray.dir/clean:
	cd /home/huang/test_ws/build/ball_detect && $(CMAKE_COMMAND) -P CMakeFiles/_ball_detect_generate_messages_check_deps_BoundingBoxArray.dir/cmake_clean.cmake
.PHONY : ball_detect/CMakeFiles/_ball_detect_generate_messages_check_deps_BoundingBoxArray.dir/clean

ball_detect/CMakeFiles/_ball_detect_generate_messages_check_deps_BoundingBoxArray.dir/depend:
	cd /home/huang/test_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/huang/test_ws/src /home/huang/test_ws/src/ball_detect /home/huang/test_ws/build /home/huang/test_ws/build/ball_detect /home/huang/test_ws/build/ball_detect/CMakeFiles/_ball_detect_generate_messages_check_deps_BoundingBoxArray.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : ball_detect/CMakeFiles/_ball_detect_generate_messages_check_deps_BoundingBoxArray.dir/depend

