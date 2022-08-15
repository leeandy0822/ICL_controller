clear all, close all, clc;

addpath('../tools/')
%  rosinit('127.0.0.1')

%% Initialize 

sim_t = 30;
traj_mode = "hover";
[payload, icl_trans, icl_rot]= gazebo_init(traj_mode, sim_t);
uav1 = gazebo_uav;
uav2 = gazebo_uav;
uav3 = gazebo_uav;
uav4 = gazebo_uav;

%% initialize ros function
system_pose = rossubscriber("/pub_system_pose","DataFormat","struct");
[uav1.pub, uav1.msg] = rospublisher("/firefly1/command/roll_pitch_yawrate_thrust","mav_msgs/RollPitchYawrateThrust");
[uav2.pub, uav2.msg] = rospublisher("/firefly2/command/roll_pitch_yawrate_thrust","mav_msgs/RollPitchYawrateThrust");
[uav3.pub, uav3.msg] = rospublisher("/firefly3/command/roll_pitch_yawrate_thrust","mav_msgs/RollPitchYawrateThrust");
[uav4.pub, uav4.msg] = rospublisher("/firefly4/command/roll_pitch_yawrate_thrust","mav_msgs/RollPitchYawrateThrust");
iter = 1;
initial_time = (rostime("now").Sec + rostime("now").Nsec/1000000000);
[uav1, uav2, uav3, uav4, payload] = getPose(uav1,uav2,uav3,uav4,payload,system_pose,iter); 

%% Loop for simulation
u1 = 0 ; 
u2 = 0 ; 
u3 = 0 ; 
u4 = 0 ; 
force_to_uav(u1,uav1,payload,iter);
force_to_uav(u2,uav2,payload,iter);
force_to_uav(u3,uav3,payload,iter);
force_to_uav(u4,uav4,payload,iter);


