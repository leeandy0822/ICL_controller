clear all, close all, clc;

addpath('../tools/')
%  rosinit('127.0.0.1')

%% Initialize 
sim_t = 60;
traj_mode = "hover";

[payload, icl_trans, icl_rot]= gazebo_init(traj_mode, sim_t);
uav1 = gazebo_uav;
uav2 = gazebo_uav;
uav3 = gazebo_uav;
uav4 = gazebo_uav;

% initialize controller
ctrl = gazebo_controller;
% initialize distributed handle
dis_handle = gazebo_distributed;
% initialize trajectory
traj_handle = gazebo_trajectory;

%% initialize ros function
system_pose = rossubscriber("/pub_system_pose","DataFormat","struct");
[uav1.pub, uav1.msg] = rospublisher("/firefly1/command/roll_pitch_yawrate_thrust","mav_msgs/RollPitchYawrateThrust");
[uav2.pub, uav2.msg] = rospublisher("/firefly2/command/roll_pitch_yawrate_thrust","mav_msgs/RollPitchYawrateThrust");
[uav3.pub, uav3.msg] = rospublisher("/firefly3/command/roll_pitch_yawrate_thrust","mav_msgs/RollPitchYawrateThrust");
[uav4.pub, uav4.msg] = rospublisher("/firefly4/command/roll_pitch_yawrate_thrust","mav_msgs/RollPitchYawrateThrust");

initial_time = (rostime("now").Sec + rostime("now").Nsec/1000000000);
payload.cur_t = 0;

iter = 1; 
[uav1, uav2, uav3, uav4, payload] = getPose(uav1,uav2,uav3,uav4,payload,system_pose,iter); 
iter = iter+1;
dt = 0.02;
t = 0 ; 
payload.last_t = (rostime("now").Sec + rostime("now").Nsec/1000000000) - initial_time;

%% Loop for simulation
while payload.cur_t < sim_t
    tic
    [uav1, uav2, uav3, uav4, payload] = getPose(uav1,uav2,uav3,uav4,payload,system_pose,iter); 
    % Get time
    payload.cur_t = (rostime("now").Sec + rostime("now").Nsec/1000000000) - initial_time;
    payload.cur_t
    Xd = traj_handle.traj_generate(payload.cur_t,payload.traj_mode);
    % Controller
    [Fd, force_error, translation_est, icl_trans] = ctrl.force_ctrl(iter,payload , Xd,  icl_rot,icl_trans, dt);
    [Md, moment_error, rotation_est, icl_rot, Rd] = ctrl.moment_ctrl(iter, payload, Xd, icl_rot, icl_trans, dt);
    Md
    % distributed force
    u = dis_handle.cal_u(payload, Fd, Md,iter);

    error = [force_error moment_error];
    force_to_uav(u(1:3)',uav1,payload,iter);
    force_to_uav(u(4:6)',uav2,payload,iter);
    force_to_uav(u(7:9)',uav3,payload,iter);
    force_to_uav(u(10:12)',uav4,payload,iter);
    payload.ex(:,iter) = error(1:3);
    payload.ev(:,iter) = error(4:6);
    payload.eR(:,iter) = error(7:9);
    payload.eW(:,iter) = error(10:12);

    payload.translation_estimation(:,iter) = translation_est;
    payload.rotation_estimation(:,iter) = rotation_est;
    payload.u1(:,iter-1) = u(1:3);
    payload.u2(:,iter-1) = u(4:6);
    payload.u3(:,iter-1) = u(7:9); 
    payload.u4(:,iter-1) = u(10:12); 
    iter = iter + 1;

    if (iter > 10)
        dt = toc;
    end
end