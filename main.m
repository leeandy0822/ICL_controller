clear all, close all, clc;


dt = 0.01;
sim_t = 10;
payload = payload_dynamics;
payload.dt = dt;
payload.sim_t = sim_t;
payload.t = 0:dt:sim_t;
payload.m = 0.755;
payload.x = zeros(3,length(payload.t));
payload.v = zeros(3,length(payload.t));
payload.ex = zeros(3, length(payload.t));
payload.ev = zeros(3, length(payload.t));
payload.mass_estimation = zeros(1, length(payload.t));
payload.force = zeros(3,length(payload.t));

% initial condition
payload.x(:,1) = [0; 0; 0];
payload.v(:,1) = [0; 0; 0];
payload.mass_estimation(1,1) = 0;
payload.force = [0; 0; 0];


% initial trajectory
tra = zeros(9, length(payload.t));
traj = payload_trajectory;


x0_double_dot = [0;0;0];

% initialize integral concurrent learning
icl = integral_concurrent_learning;
icl.N_diag = 10;
icl.mat_diag_matrix = zeros(1, icl.N_diag);
icl.mat_diag_sum = zeros(1, 1);
icl.index_diag = 0;
icl.current_force = zeros(1, 1);

ctrl = controller;
for i=2:length(payload.t)
    
    t_now = payload.t(i);

    % desire trajectory
    tra(:,i) = traj.traj_generate(t_now);
    Xd = tra(1:9, i-1);

    % control input and error
    [control, error, mass_est, icl] = ctrl.tracking_ctrl(i,payload,Xd,icl,dt);
    
    
    % dynamics
    X0 = [vec_enu_to_ned(payload.x(:, i-1));
        vec_enu_to_ned(payload.v(:, i-1));];

    [T, X_new] = ode45(@(t, x) payload.dynamics(t, x, control), [0, dt], X0, control);
    payload.x(:,i) = X_new(end, 1:3);
    payload.v(:,i) = X_new(end, 4:6);


    payload.ex(:,i) = error(1:3);
    payload.ev(:,i) = error(4:6);
    payload.mass_estimation(1,i) = mass_est;
    payload.force(:,i) = control;
end

figure(1);

plot3(tra(1,:),tra(2,:),tra(3,:),payload.x(1,:),payload.x(2,:),payload.x(3,:))
xlabel('X')
ylabel('Y')
zlabel('Z')
title("Trajectory");
grid on

