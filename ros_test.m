clear all, close all, clc;

addpath('Matlab_simulation/')
%  rosinit('127.0.0.1')
%% Mode selection
% Eight, Hover
traj_mode = "eight";
% Groundtruth Mode
groundtruth_mode = 1;

sim_t = 5;
[payload, icl_trans, icl_rot, ctrl, traj_handle] = gazebo_init(traj_mode,groundtruth_mode, sim_t);


uav1 = gazebo_dynamics;
uav2 = gazebo_dynamics;
uav3 = gazebo_dynamics;
uav4 = gazebo_dynamics;

%% initialize ros function
system_pose = rossubscriber("/pub_system_pose","DataFormat","struct");
[uav1.pub, uav1.msg] = rospublisher("/firefly1/command/roll_pitch_yawrate_thrust","mav_msgs/RollPitchYawrateThrust");
[uav2.pub, uav2.msg] = rospublisher("/firefly2/command/roll_pitch_yawrate_thrust","mav_msgs/RollPitchYawrateThrust");
[uav3.pub, uav3.msg] = rospublisher("/firefly3/command/roll_pitch_yawrate_thrust","mav_msgs/RollPitchYawrateThrust");
[uav4.pub, uav4.msg] = rospublisher("/firefly4/command/roll_pitch_yawrate_thrust","mav_msgs/RollPitchYawrateThrust");

initial_time = (rostime("now").Sec + rostime("now").Nsec/1000000000);
payload.cur_t = 0;

while payload.cur_t < sim_t
    % Get time
    payload.cur_t = (rostime("now").Sec + rostime("now").Nsec/1000000000) - initial_time;
    payload.cur_t
    [uav1, uav2, uav3, uav4, payload] = getPose(uav1,uav2,uav3,uav4,payload,system_pose); 
    
    % force_to_uav(u1,uav1,payload);
    % force_to_uav(u2,uav2,payload);
    % force_to_uav(u3,uav3,payload);
    % force_to_uav(u4,uav4,payload);

end
