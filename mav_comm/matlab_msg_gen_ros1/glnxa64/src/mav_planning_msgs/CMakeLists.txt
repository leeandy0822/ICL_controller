cmake_minimum_required(VERSION 3.9)
project(mav_planning_msgs)
set(CMAKE_VERBOSE_MAKEFILE ON)
# Default to C99
if(NOT CMAKE_C_STANDARD)
  set(CMAKE_C_STANDARD 99)
endif()
# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()
if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  #add_compile_options(-Wall -Wextra -Wpedantic)
endif()
add_definitions( -DROS1_USES_ROS2_CLASS_LOADER )
## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  message_generation
  message_generation
  geometry_msgs
  sensor_msgs
  std_msgs
  trajectory_msgs
)
## System dependencies are found with CMake''s conventions
################################################
## Declare ROS messages, services and actions ##
################################################
add_message_files(
    FILES
    Point2D.msg
    PointCloudWithPose.msg
    Polygon2D.msg
    PolygonWithHoles.msg
    PolygonWithHolesStamped.msg
    PolynomialSegment4D.msg
    PolynomialTrajectory4D.msg
)
add_service_files(
    FILES
    PlannerService.srv
    PolygonService.srv
)
find_package( geometry_msgs REQUIRED)
find_package( roscpp REQUIRED)
find_package( sensor_msgs REQUIRED)
find_package( std_msgs REQUIRED)
find_package( trajectory_msgs REQUIRED)
## Generate added messages, services and actions with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs
  geometry_msgs
  sensor_msgs
  std_msgs
  trajectory_msgs
)
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if you package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
  CATKIN_DEPENDS
  message_runtime
  "message_runtime"
  "geometry_msgs"
  "roscpp"
  "sensor_msgs"
  "std_msgs"
  "trajectory_msgs"
)
###########
## Build ##
###########
## Specify additional locations of header files
## Your package locations should be listed before other locations
# include_directories(include)
include_directories(
  include
  ${PROJECT_SOURCE_DIR}
  ${Boost_INCLUDE_DIRS}
  ${catkin_INCLUDE_DIRS}
 "/home/leeandy/MATLAB/extern/include"
 "/home/leeandy/MATLAB/extern/include/MatlabDataArray"
 "/home/leeandy/MATLAB/toolbox/ros/include/ros1"
 "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/include"
 "/home/leeandy/MATLAB/sys/ros2/glnxa64/ros2/include/class_loader"
 "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/console_bridge/include"
 "/home/leeandy/MATLAB/toolbox/ros/mlroscpp/custom_messages/include"
 "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/bzip2/include"
 "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/lz4/include"
 "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/boost/include"
  "include/mav_planning_msgs"
)
set (CMAKE_SKIP_BUILD_RPATH false)
set (CMAKE_BUILD_WITH_INSTALL_RPATH true)
set (CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")
set (CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
## Get list of .c files in project source directory
file(GLOB ${PROJECT_NAME}_C_SOURCES RELATIVE ${PROJECT_SOURCE_DIR} ${PROJECT_SOURCE_DIR}/*.c)
## Get list of .cpp files in project source directory
file(GLOB ${PROJECT_NAME}_CPP_SOURCES RELATIVE ${PROJECT_SOURCE_DIR} ${PROJECT_SOURCE_DIR}/*.cpp)
link_directories("/home/leeandy/MATLAB/extern/bin/glnxa64")
link_directories("/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/console_bridge/lib")
link_directories("/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/lib")
link_directories("/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/boost/lib")
# Declare library
add_library(
    mav_planning_msgs_matlab 
    SHARED
    src/mav_planning_msgs_Point2D_message.cpp
    src/mav_planning_msgs_PointCloudWithPose_message.cpp
    src/mav_planning_msgs_Polygon2D_message.cpp
    src/mav_planning_msgs_PolygonWithHoles_message.cpp
    src/mav_planning_msgs_PolygonWithHolesStamped_message.cpp
    src/mav_planning_msgs_PolynomialSegment4D_message.cpp
    src/mav_planning_msgs_PolynomialTrajectory4D_message.cpp
    src/mav_planning_msgs_PlannerService_service.cpp
    src/mav_planning_msgs_PolygonService_service.cpp
)
target_include_directories(mav_planning_msgs_matlab PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>)
target_link_libraries( mav_planning_msgs_matlab
	"/home/leeandy/MATLAB/extern/bin/glnxa64/libMatlabDataArray.so"
	"/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/console_bridge/lib/libconsole_bridge.so"
	"/home/leeandy/MATLAB/sys/ros2/glnxa64/ros2/lib/libclass_loader.so"
	"/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/lib/librosconsole.so"
	"/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/lib/libroscpp.so"
	"/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/lib/libroscpp_serialization.so"
	"/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/lib/librostime.so"
	"/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/lib/librosbag_storage.so"
	"/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/lib/libroslz4.so"
	"/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/lib/libtopic_tools.so"
	"/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/lib/libmatlab_rosbag.so"
	"/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/lib/libactionlib.so"
	"/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/boost/lib/libmwboost_thread.so"
	${Boost_LIBRARIES}
	${CMAKE_DL_LIBS}
	)
## Add cmake target dependencies of the executable/library
## as an example, message headers may need to be generated before nodes
add_dependencies(
  mav_planning_msgs_matlab
  ${${PROJECT_NAME}_EXPORTED_TARGETS}
  ${catkin_EXPORTED_TARGETS}
)
# Causes the visibility macros to use dllexport rather than dllimport,
# which is appropriate when building the dll but not consuming it.
target_compile_definitions(mav_planning_msgs_matlab PRIVATE "MAV_PLANNING_MSGS_BUILDING_LIBRARY")
install(
  DIRECTORY include/
  DESTINATION include
)
install(
  TARGETS mav_planning_msgs_matlab
  EXPORT export_${PROJECT_NAME}
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin
)
install (DIRECTORY m/ DESTINATION m/ FILES_MATCHING PATTERN "*.m")
foreach(file_i ${CUDA_BINS})
add_custom_command(
                   TARGET 
                   POST_BUILD
                   COMMAND ${CMAKE_COMMAND}
                   ARGS -E copy ${PROJECT_SOURCE_DIR}/src/${file_i} ${CATKIN_DEVEL_PREFIX}/_ert_rtw/${file_i}
				   )
endforeach(file_i)
# Generated 12-Oct-2023 15:57:50
# Copyright 2019-2021 The MathWorks, Inc.
