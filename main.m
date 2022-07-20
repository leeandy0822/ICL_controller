clear all, close all, clc;
addpath('./tools/')
tic;

%% Initialize payload dynamics and controller
dt = 1/400;
sim_t = 10;
mode = "hover";
% 0 = even formation , 1 = optimal formation
optim_mode = 1;
[payload, icl_trans, icl_rot, ctrl] = initailize(mode,optim_mode,dt,sim_t);
t = payload.t;
% trajectory

traj_handle = payload_trajectory;
traj_handle.traj = zeros(9, length(t));
traj_handle.traj(:,1) = traj_handle.traj_generate(payload.t(1),payload.traj_mode);

%% Main function

% flow: ICL_every, Adaptive_every, Adaptive_J, pick two
flow = ['ICL_every', 'Adaptive_J'];
[payload, traj_handle] = simulation(payload, traj_handle, ctrl, icl_trans, icl_rot);
plotgraph(traj_handle.traj, payload);