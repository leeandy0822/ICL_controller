clear all, close all, clc;

% initial condition
dt = 0.01;
sim_t = 20;
payload = payload_dynamics;
payload.dt = dt;
payload.sim_t = sim_t;
payload.t = 0:dt:sim_t;
payload.m = 0.755;
payload.J = [0.0920, 0, 0;
                0, 0.0845, 0;
                0, 0, 0.120];

payload.x = zeros(3,length(payload.t));
payload.v = zeros(3,length(payload.t));
payload.R = zeros(9, length(payload.t));
payload.Rd = zeros(9, length(payload.t));
payload.W = zeros(3, length(payload.t));
payload.eul = zeros(3, length(payload.t));
payload.ex = zeros(3, length(payload.t));
payload.ev = zeros(3, length(payload.t));
payload.mass_estimation = zeros(1, length(payload.t));
payload.inertia_estimation = zeros(3, length(payload.t));
payload.force = zeros(3,length(payload.t));

% initial condition
eul = [-pi/8 pi/8 pi/8];
R0 = eul2rotm(eul);
payload.R(:,1) = reshape(R0,9,1);
payload.W(:,1) = [0.03, -0.05, 0.05];
payload.inertia_estimation(:, 1) = [0.01; 0.01; 0.01];

x0 = [0 ; 0 ;0];
x0_dot = [0 ; 0; 0];
payload.x(:,1) = x0;
payload.v(:,1) = x0_dot;

t = payload.t;
% initialize controller
ctrl = controller;

% initialize integral concurrent learning
icl_mass = integral_concurrent_learning;
icl_mass.N_diag = 30;
icl_mass.mat_diag_matrix = zeros(1, icl_mass.N_diag);
icl_mass.mat_diag_sum = zeros(1, 1);
icl_mass.index_diag = 0;
icl_mass.current_force = zeros(1, 1);

% initialize integral concurrent learning
icl_moment = integral_concurrent_learning;
icl_moment.N_diag = 10;
icl_moment.mat_diag_matrix = zeros(3, icl_moment.N_diag);
icl_moment.mat_diag_sum = zeros(3, 1);
icl_moment.index_diag = 0;
icl_moment.current_moment = zeros(3,1);
icl_moment.W_last = zeros(3, 1);

% initial trajectory
tra = zeros(9, length(t));
traj = payload_trajectory;
tra(:,1) = traj.traj_generate(payload.t(1));


for i= 2:length(payload.t)

    t_now = payload.t(i);
    % desire trajectory
    tra(:,i) = traj.traj_generate(t_now);
    Xd = tra(1:9, i);
    
    % force controller
    [Fd, force_error, mass_est, icl_mass] = ctrl.force_ctrl(i,payload , Xd,  icl_mass,dt);
    
    % moment controller 
    [Md, moment_error, inertia_est, icl_moment, Rd] = ctrl.moment_ctrl(i, payload, Xd, icl_moment, dt);

    % initial condition
    X0 = [vec_enu_to_ned(payload.x(:,i-1)); vec_enu_to_ned(payload.v(:,i-1));
        reshape(reshape(payload.R(:, i-1), 3, 3), 9, 1); payload.W(:, i-1)];

    control = [Fd ; Md];
    error = [force_error moment_error];

    % dynamics update
    [T, X_new] = ode45(@(t, x) payload.dynamics(t, x, control), [0, dt], X0, control);

    % record
    payload.x(:,i) = vec_ned_to_enu(X_new(end,1:3));
    payload.v(:,i) = vec_ned_to_enu(X_new(end,4:6));
    payload.R(:, i) = X_new(end, 7:15);
    payload.W(:, i) = X_new(end, 16:18);
    payload.Rd(:, i) =  reshape(payload.R(:, i), 9, 1);

    payload.ex(:,i) = error(1:3);
    payload.ev(:,i) = error(4:6);
    payload.eR(:,i) = error(7:9);
    payload.eW(:,i) = error(10:12);
    payload.mass_estimation(:,i) = mass_est;
    payload.inertia_estimation(:,i) = inertia_est;
    
    icl_mass.current_force = Fd;
    icl_moment.current_moment = Md;
end
payload.inertia_estimation(:,end)
t = payload.t;
B = [ 0 1 0 ; 1 0 0 ; 0 0 -1];
% plot
figure(1);
tra(1:3,:) = B*tra(1:3,:);
payload.x(1:3,:) = B*payload.x(1:3,:);
plot3(tra(1,:),tra(2,:),tra(3,:),payload.x(1,:),payload.x(2,:),payload.x(3,:))
hold on;

for i = 1:200:length(payload.t)
    matrix = reshape(payload.R(:,i),3,3);
    matrix = B*matrix;
    quiver3(payload.x(1,i),payload.x(2,i),payload.x(3,i),matrix(1,1),matrix(2,1),matrix(3,1),'r',"LineWidth",0.4); 
    quiver3(payload.x(1,i),payload.x(2,i),payload.x(3,i),matrix(1,2),matrix(2,2),matrix(3,2),'g',"LineWidth",0.4); 
    quiver3(payload.x(1,i),payload.x(2,i),payload.x(3,i),matrix(1,3),matrix(2,3),matrix(3,3),'b',"LineWidth",0.4); 
end
hold on;
grid on;

figure(2);
tiledlayout(2,4)
nexttile
% Plot position tracking error
plot(t,payload.ex(1,:),t,payload.ex(2,:),t,payload.ex(3,:))
title("Postion Tracking errors");
legend('ex_1','ex_2','ex_3')
nexttile
% Plot velocity tracking error
plot(t,payload.ev(1,:),t,payload.ev(2,:),t,payload.ev(3,:))
title("Velocity Tracking errors");
legend('ev_1','ev_2','ev_3')

nexttile
% Plot position tracking error
plot(t,payload.eR(1,:),t,payload.eR(2,:),t,payload.eR(3,:))
title("Rotation Errors");
legend('er_1','er_2','er_3')
nexttile
% Plot velocity tracking error
plot(t,payload.eW(1,:),t,payload.eW(2,:),t,payload.eW(3,:))
title("Angular Velocity Errors");
legend('eo_1','eo_2','eo_3')

nexttile
% Plot velocity tracking error
theta_m_ground_truth = ones(1, length(payload.t))*payload.m;
plot(t,payload.mass_estimation,t,theta_m_ground_truth)
title("Theta");

nexttile
plot(t, payload.inertia_estimation(1,:),t,ones(1,length(t))*payload.J(1))
title("Inertia xx");
legend('xx','groundtruth')
nexttile
plot(t, payload.inertia_estimation(2,:),t,ones(1,length(t))*payload.J(5))
title("Inertia yy");
legend('yy','groundtruth')
nexttile
plot(t, payload.inertia_estimation(3,:),t,ones(1,length(t))*payload.J(9))
title("Inertia zz");
legend('zz','groundtruth')