clear all, close all, clc;
addpath('./tools/')
tic;

% Control frequency and simlation time 
dt = 1/400;
sim_t = 10;

%% Mode selection

% Eight, Hover
traj_mode = "eight";
% ICL ,  Adaptive
ctrl_mode = "icl";
%  Even Formation: 0, Optimal Formation: 1
optim_mode = 1;
% with CoG and mass knowledge: 1, else 0
emk_mode = 1;

%% Initailze the controller, dynamics and trajectory
[payload, icl_trans, icl_rot, ctrl, traj_handle] = initailize(traj_mode,emk_mode, optim_mode,dt,sim_t);

%% Main function
dt = payload.dt;
h = waitbar(0,'please wait');

for i= 2:length(payload.t)
    str=['Calculating...',num2str(round(i/length(payload.t)*100,1)),'%'];
    waitbar(i/length(payload.t),h,str)
    t_now = payload.t(i);
    % desire trajectory
    traj_handle.traj(:,i) = traj_handle.traj_generate(t_now,payload.traj_mode);
    Xd = traj_handle.traj(1:9, i);
    
    %% Controller
    [Fd, force_error, translation_est, icl_trans] = ctrl.force_ctrl(i,payload , Xd,  icl_rot,icl_trans,dt);
    [Md, moment_error, rotation_est, icl_rot, Rd] = ctrl.moment_ctrl(i, payload, Xd, icl_rot, icl_trans,dt);

    % distribute force and get th
    dis = distribute_force;
    [Fd, Md, u, freq_dis] = dis.cal_u(payload,Fd,Md,i); 

    %% Calculate next step dynamics
    X0 = [vec_enu_to_ned(payload.x(:,i-1)); vec_enu_to_ned(payload.v(:,i-1));
        reshape(reshape(payload.R(:, i-1), 3, 3), 9, 1); payload.W(:, i-1)];

    control = [Fd ; Md];
    error = [force_error moment_error];
    [T, X_new] = ode45(@(t, x) payload.dynamics(t, x, control), [0, dt], X0, control);

    %% record
    payload.x(:,i) = vec_ned_to_enu(X_new(end,1:3));
    payload.v(:,i) = vec_ned_to_enu(X_new(end,4:6));
    payload.R(:, i) = X_new(end, 7:15);
    payload.W(:, i) = X_new(end, 16:18);
    payload.Rd(:, i) =  reshape(payload.R(:, i), 9, 1);
    payload.ex(:,i) = error(1:3);
    payload.ev(:,i) = error(4:6);
    payload.eR(:,i) = error(7:9);
    payload.eW(:,i) = error(10:12);
    payload.translation_estimation(:,i) = translation_est;
    payload.rotation_estimation(:,i) = rotation_est;
    payload.freq(:,i-1) = freq_dis;
    payload.u1(:,i-1) = u(1:3);
    payload.u2(:,i-1) = u(4:6);
    payload.u3(:,i-1) = u(7:9);    
    payload.force(:,i-1) = Fd;
    payload.moment(:,i-1) = Md;
    icl_trans.current_force = Fd;
    icl_rot.current_moment = Md;
end

%% Plot
plotgraph(traj_handle.traj, payload);