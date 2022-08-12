# Install script for directory: /home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_state_machine_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mav_state_machine_msgs/msg" TYPE FILE FILES "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_state_machine_msgs/msg/StartStopTask.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mav_state_machine_msgs/srv" TYPE FILE FILES "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_state_machine_msgs/srv/RunTaskService.srv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mav_state_machine_msgs/cmake" TYPE FILE FILES "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/build/mav_state_machine_msgs/catkin_generated/installspace/mav_state_machine_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/devel/include/mav_state_machine_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/home/leeandy/.matlab/R2021b/ros1/glnxa64/venv/bin/python2" -m compileall "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/devel/lib/python2.7/dist-packages/mav_state_machine_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/devel/lib/python2.7/dist-packages/mav_state_machine_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/build/mav_state_machine_msgs/catkin_generated/installspace/mav_state_machine_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mav_state_machine_msgs/cmake" TYPE FILE FILES "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/build/mav_state_machine_msgs/catkin_generated/installspace/mav_state_machine_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mav_state_machine_msgs/cmake" TYPE FILE FILES
    "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/build/mav_state_machine_msgs/catkin_generated/installspace/mav_state_machine_msgsConfig.cmake"
    "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/build/mav_state_machine_msgs/catkin_generated/installspace/mav_state_machine_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mav_state_machine_msgs" TYPE FILE FILES "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_state_machine_msgs/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_state_machine_msgs/include/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/devel/lib/libmav_state_machine_msgs_matlab.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmav_state_machine_msgs_matlab.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmav_state_machine_msgs_matlab.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmav_state_machine_msgs_matlab.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/m/" TYPE DIRECTORY FILES "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_state_machine_msgs/m/" FILES_MATCHING REGEX "/[^/]*\\.m$")
endif()

