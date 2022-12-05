# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mav_planning_msgs: 7 messages, 2 services")

set(MSG_I_FLAGS "-Imav_planning_msgs:/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg;-Istd_msgs:/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg;-Igeometry_msgs:/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/sensor_msgs/cmake/../msg;-Istd_msgs:/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg;-Itrajectory_msgs:/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/trajectory_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mav_planning_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/srv/PlannerService.srv" NAME_WE)
add_custom_target(_mav_planning_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_planning_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/srv/PlannerService.srv" "geometry_msgs/Transform:geometry_msgs/PoseStamped:geometry_msgs/Vector3:trajectory_msgs/MultiDOFJointTrajectoryPoint:geometry_msgs/Point:mav_planning_msgs/PolynomialTrajectory4D:geometry_msgs/Twist:std_msgs/Header:geometry_msgs/Pose:mav_planning_msgs/PolynomialSegment4D:trajectory_msgs/MultiDOFJointTrajectory:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/srv/PolygonService.srv" NAME_WE)
add_custom_target(_mav_planning_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_planning_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/srv/PolygonService.srv" "mav_planning_msgs/PolygonWithHolesStamped:mav_planning_msgs/PolygonWithHoles:std_msgs/Header:mav_planning_msgs/Polygon2D:mav_planning_msgs/Point2D"
)

get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialSegment4D.msg" NAME_WE)
add_custom_target(_mav_planning_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_planning_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialSegment4D.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHolesStamped.msg" NAME_WE)
add_custom_target(_mav_planning_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_planning_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHolesStamped.msg" "mav_planning_msgs/PolygonWithHoles:std_msgs/Header:mav_planning_msgs/Polygon2D:mav_planning_msgs/Point2D"
)

get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHoles.msg" NAME_WE)
add_custom_target(_mav_planning_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_planning_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHoles.msg" "mav_planning_msgs/Polygon2D:mav_planning_msgs/Point2D"
)

get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PointCloudWithPose.msg" NAME_WE)
add_custom_target(_mav_planning_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_planning_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PointCloudWithPose.msg" "geometry_msgs/Transform:geometry_msgs/Vector3:sensor_msgs/PointCloud2:std_msgs/Header:geometry_msgs/TransformStamped:sensor_msgs/PointField:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Point2D.msg" NAME_WE)
add_custom_target(_mav_planning_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_planning_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Point2D.msg" ""
)

get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialTrajectory4D.msg" NAME_WE)
add_custom_target(_mav_planning_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_planning_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialTrajectory4D.msg" "mav_planning_msgs/PolynomialSegment4D:std_msgs/Header"
)

get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Polygon2D.msg" NAME_WE)
add_custom_target(_mav_planning_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_planning_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Polygon2D.msg" "mav_planning_msgs/Point2D"
)

#
#  langs = gencpp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialSegment4D.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_planning_msgs
)
_generate_msg_cpp(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHolesStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHoles.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg;/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Polygon2D.msg;/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Point2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_planning_msgs
)
_generate_msg_cpp(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHoles.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Polygon2D.msg;/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Point2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_planning_msgs
)
_generate_msg_cpp(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PointCloudWithPose.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Transform.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/TransformStamped.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/sensor_msgs/cmake/../msg/PointField.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_planning_msgs
)
_generate_msg_cpp(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Point2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_planning_msgs
)
_generate_msg_cpp(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialTrajectory4D.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialSegment4D.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_planning_msgs
)
_generate_msg_cpp(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Polygon2D.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Point2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_planning_msgs
)

### Generating Services
_generate_srv_cpp(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/srv/PlannerService.srv"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Transform.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectoryPoint.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Point.msg;/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialTrajectory4D.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Twist.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Pose.msg;/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialSegment4D.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectory.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_planning_msgs
)
_generate_srv_cpp(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/srv/PolygonService.srv"
  "${MSG_I_FLAGS}"
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHolesStamped.msg;/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHoles.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg;/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Polygon2D.msg;/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Point2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_planning_msgs
)

### Generating Module File
_generate_module_cpp(mav_planning_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_planning_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mav_planning_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mav_planning_msgs_generate_messages mav_planning_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/srv/PlannerService.srv" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_cpp _mav_planning_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/srv/PolygonService.srv" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_cpp _mav_planning_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialSegment4D.msg" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_cpp _mav_planning_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHolesStamped.msg" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_cpp _mav_planning_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHoles.msg" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_cpp _mav_planning_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PointCloudWithPose.msg" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_cpp _mav_planning_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Point2D.msg" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_cpp _mav_planning_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialTrajectory4D.msg" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_cpp _mav_planning_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Polygon2D.msg" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_cpp _mav_planning_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mav_planning_msgs_gencpp)
add_dependencies(mav_planning_msgs_gencpp mav_planning_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mav_planning_msgs_generate_messages_cpp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialSegment4D.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_planning_msgs
)
_generate_msg_py(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHolesStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHoles.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg;/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Polygon2D.msg;/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Point2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_planning_msgs
)
_generate_msg_py(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHoles.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Polygon2D.msg;/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Point2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_planning_msgs
)
_generate_msg_py(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PointCloudWithPose.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Transform.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/TransformStamped.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/sensor_msgs/cmake/../msg/PointField.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_planning_msgs
)
_generate_msg_py(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Point2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_planning_msgs
)
_generate_msg_py(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialTrajectory4D.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialSegment4D.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_planning_msgs
)
_generate_msg_py(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Polygon2D.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Point2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_planning_msgs
)

### Generating Services
_generate_srv_py(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/srv/PlannerService.srv"
  "${MSG_I_FLAGS}"
  "/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Transform.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectoryPoint.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Point.msg;/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialTrajectory4D.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Twist.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Pose.msg;/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialSegment4D.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectory.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_planning_msgs
)
_generate_srv_py(mav_planning_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/srv/PolygonService.srv"
  "${MSG_I_FLAGS}"
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHolesStamped.msg;/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHoles.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg;/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Polygon2D.msg;/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Point2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_planning_msgs
)

### Generating Module File
_generate_module_py(mav_planning_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_planning_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mav_planning_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mav_planning_msgs_generate_messages mav_planning_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/srv/PlannerService.srv" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_py _mav_planning_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/srv/PolygonService.srv" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_py _mav_planning_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialSegment4D.msg" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_py _mav_planning_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHolesStamped.msg" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_py _mav_planning_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolygonWithHoles.msg" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_py _mav_planning_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PointCloudWithPose.msg" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_py _mav_planning_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Point2D.msg" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_py _mav_planning_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/PolynomialTrajectory4D.msg" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_py _mav_planning_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg/Polygon2D.msg" NAME_WE)
add_dependencies(mav_planning_msgs_generate_messages_py _mav_planning_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mav_planning_msgs_genpy)
add_dependencies(mav_planning_msgs_genpy mav_planning_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mav_planning_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_planning_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_planning_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(mav_planning_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(mav_planning_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(mav_planning_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(mav_planning_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET trajectory_msgs_generate_messages_cpp)
  add_dependencies(mav_planning_msgs_generate_messages_cpp trajectory_msgs_generate_messages_cpp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_planning_msgs)
  install(CODE "execute_process(COMMAND \"/home/leeandy/.matlab/R2021b/ros1/glnxa64/venv/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_planning_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_planning_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(mav_planning_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(mav_planning_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(mav_planning_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(mav_planning_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET trajectory_msgs_generate_messages_py)
  add_dependencies(mav_planning_msgs_generate_messages_py trajectory_msgs_generate_messages_py)
endif()
