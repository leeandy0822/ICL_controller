clear all, close all, clc;
addpath('./tools/')
tic;

% Control frequency and simlation time 
dt = 1/400;
sim_t = 10;

%% Mode setup
% Trajectory: Eight, Hover
traj_mode = "hover";
% Controller: ICL , Adaptive: with EMK of CoG and Mass, EMK
ctrl_mode = "icl";
%  Even Formation: 0, Optimal Formation: 1
optim_mode = 0;

%% payload , ICL and controller initialize
[payload, icl_trans, icl_rot, ctrl] = initailize(traj_mode,optim_mode,dt,sim_t);
t = payload.t;

% trajectory initialize
traj_handle = payload_trajectory;
traj_handle.traj = zeros(9, length(t));
traj_handle.traj(:,1) = traj_handle.traj_generate(payload.t(1),payload.traj_mode);

%% Main function

[payload, traj_handle] = simulation(payload, traj_handle, ctrl, icl_trans, icl_rot);
plotgraph(traj_handle.traj, payload);