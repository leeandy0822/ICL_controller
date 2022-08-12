# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mav_system_msgs: 2 messages, 0 services")

set(MSG_I_FLAGS "-Imav_system_msgs:/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_system_msgs/msg;-Istd_msgs:/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg;-Istd_msgs:/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mav_system_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_system_msgs/msg/CpuInfo.msg" NAME_WE)
add_custom_target(_mav_system_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_system_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_system_msgs/msg/CpuInfo.msg" "mav_system_msgs/ProcessInfo:std_msgs/Header"
)

get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_system_msgs/msg/ProcessInfo.msg" NAME_WE)
add_custom_target(_mav_system_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mav_system_msgs" "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_system_msgs/msg/ProcessInfo.msg" ""
)

#
#  langs = gencpp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mav_system_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_system_msgs/msg/CpuInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_system_msgs/msg/ProcessInfo.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_system_msgs
)
_generate_msg_cpp(mav_system_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_system_msgs/msg/ProcessInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_system_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(mav_system_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_system_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mav_system_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mav_system_msgs_generate_messages mav_system_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_system_msgs/msg/CpuInfo.msg" NAME_WE)
add_dependencies(mav_system_msgs_generate_messages_cpp _mav_system_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_system_msgs/msg/ProcessInfo.msg" NAME_WE)
add_dependencies(mav_system_msgs_generate_messages_cpp _mav_system_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mav_system_msgs_gencpp)
add_dependencies(mav_system_msgs_gencpp mav_system_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mav_system_msgs_generate_messages_cpp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mav_system_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_system_msgs/msg/CpuInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_system_msgs/msg/ProcessInfo.msg;/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_system_msgs
)
_generate_msg_py(mav_system_msgs
  "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_system_msgs/msg/ProcessInfo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_system_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(mav_system_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_system_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mav_system_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mav_system_msgs_generate_messages mav_system_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_system_msgs/msg/CpuInfo.msg" NAME_WE)
add_dependencies(mav_system_msgs_generate_messages_py _mav_system_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_system_msgs/msg/ProcessInfo.msg" NAME_WE)
add_dependencies(mav_system_msgs_generate_messages_py _mav_system_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mav_system_msgs_genpy)
add_dependencies(mav_system_msgs_genpy mav_system_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mav_system_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_system_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mav_system_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(mav_system_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(mav_system_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_system_msgs)
  install(CODE "execute_process(COMMAND \"/home/leeandy/.matlab/R2021b/ros1/glnxa64/venv/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_system_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mav_system_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(mav_system_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(mav_system_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
