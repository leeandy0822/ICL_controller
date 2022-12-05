# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mav_msgs: 9 messages, 0 services")

set(MSG_I_FLAGS "-Imav_msgs:/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg;-Istd_msgs:/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg;-Igeometry_msgs:/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg;-Istd_msgs:/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mav_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/Status.msg" NAME_WE)
add_custom_target(_mav_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/Status.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/RateThrust.msg" NAME_WE)
add_custom_target(_mav_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/RateThrust.msg" "geometry_msgs/Vector3:std_msgs/Header"
)

get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/GpsWaypoint.msg" NAME_WE)
add_custom_target(_mav_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/GpsWaypoint.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/AttitudeThrust.msg" NAME_WE)
add_custom_target(_mav_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/AttitudeThrust.msg" "geometry_msgs/Vector3:std_msgs/Header:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/System_pose.msg" NAME_WE)
add_custom_target(_mav_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/System_pose.msg" "geometry_msgs/Pose:geometry_msgs/Point:std_msgs/Header:geometry_msgs/Vector3:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/RollPitchYawrateThrust.msg" NAME_WE)
add_custom_target(_mav_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/RollPitchYawrateThrust.msg" "geometry_msgs/Vector3:std_msgs/Header"
)

get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/TorqueThrust.msg" NAME_WE)
add_custom_target(_mav_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/TorqueThrust.msg" "geometry_msgs/Vector3:std_msgs/Header"
)

get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/FilteredSensorData.msg" NAME_WE)
add_custom_target(_mav_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/FilteredSensorData.msg" "geometry_msgs/Vector3:std_msgs/Header"
)

get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/Actuators.msg" NAME_WE)
add_custom_target(_mav_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/Actuators.msg" "std_msgs/Header"
)

#
#  langs = gencpp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/Status.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_msgs
)
_generate_msg_cpp(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/RateThrust.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_msgs
)
_generate_msg_cpp(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/GpsWaypoint.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_msgs
)
_generate_msg_cpp(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/AttitudeThrust.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_msgs
)
_generate_msg_cpp(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/System_pose.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Pose.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Point.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_msgs
)
_generate_msg_cpp(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/RollPitchYawrateThrust.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_msgs
)
_generate_msg_cpp(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/TorqueThrust.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_msgs
)
_generate_msg_cpp(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/FilteredSensorData.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_msgs
)
_generate_msg_cpp(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/Actuators.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(mav_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mav_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mav_msgs_generate_messages mav_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/Status.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_cpp _mav_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/RateThrust.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_cpp _mav_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/GpsWaypoint.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_cpp _mav_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/AttitudeThrust.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_cpp _mav_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/System_pose.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_cpp _mav_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/RollPitchYawrateThrust.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_cpp _mav_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/TorqueThrust.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_cpp _mav_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/FilteredSensorData.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_cpp _mav_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/Actuators.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_cpp _mav_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mav_msgs_gencpp)
add_dependencies(mav_msgs_gencpp mav_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mav_msgs_generate_messages_cpp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/Status.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_msgs
)
_generate_msg_py(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/RateThrust.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_msgs
)
_generate_msg_py(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/GpsWaypoint.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_msgs
)
_generate_msg_py(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/AttitudeThrust.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_msgs
)
_generate_msg_py(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/System_pose.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Pose.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Point.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_msgs
)
_generate_msg_py(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/RollPitchYawrateThrust.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_msgs
)
_generate_msg_py(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/TorqueThrust.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_msgs
)
_generate_msg_py(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/FilteredSensorData.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_msgs
)
_generate_msg_py(mav_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/Actuators.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(mav_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mav_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mav_msgs_generate_messages mav_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/Status.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_py _mav_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/RateThrust.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_py _mav_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/GpsWaypoint.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_py _mav_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/AttitudeThrust.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_py _mav_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/System_pose.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_py _mav_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/RollPitchYawrateThrust.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_py _mav_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/TorqueThrust.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_py _mav_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/FilteredSensorData.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_py _mav_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg/Actuators.msg" NAME_WE)
add_dependencies(mav_msgs_generate_messages_py _mav_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mav_msgs_genpy)
add_dependencies(mav_msgs_genpy mav_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mav_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(mav_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(mav_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(mav_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_msgs)
  install(CODE "execute_process(COMMAND \"/home/leeandy/.matlab/R2021b/ros1/glnxa64/venv/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(mav_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(mav_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(mav_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
