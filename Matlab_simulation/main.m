% A simulation for geometric tracking control of multirotors
close all;
tic;

% simulation time
dt = 0.0025;
sim_t = 20;

% flight mode
MODE_TRACKING = 0;
MODE_HOVERING = 1;
SELECT_FLIGHT_MODE = MODE_HOVERING;

% whether to impose noise or not
WITH_NOISE = 1;
WITHOUT_NOISE = 2;
SELECT_W_WO_NOISE = WITHOUT_NOISE;

% select filter
USE_NO_FILTER = 1;
USE_FIRST_ORDER_LPF = 2;
USE_ESTIMATOR = 5;
SELECT_FILTER = USE_NO_FILTER;

% select method to calculate force feedforward control
force_feedforward_use_geometric = 1;
force_feedforward_use_adaptive_ICL = 2;
select_force_feedforward = force_feedforward_use_adaptive_ICL;

% select method to calculate moment feedforward control
moment_feedforward_use_geometric = 1;
moment_feedforward_use_adaptive_ICL = 2;
select_moment_feedforward = moment_feedforward_use_adaptive_ICL;

% use adaptive with ICL or without ICL
moment_adaptive_without_ICL = 1;
moment_adaptive_with_ICL = 2;
select_moment_adaptive_w_wo_ICL = moment_adaptive_with_ICL;

% initialize parameters
multirotor = multirotor_dynamics;
uav1 = multirotor_dynamics;
uav2 = multirotor_dynamics;
uav3 = multirotor_dynamics;
multirotor.dt = dt;
multirotor.sim_t = sim_t;
multirotor.t = 0:dt:sim_t;
multirotor.m = 2.8;
multirotor.J = [0.2, 0, 0;
                0, 0.2, 0;
                0, 0, 0.1];
multirotor.d = 0.250;
multirotor.c_tau = 1.347e-2;
multirotor.uav1_pos = [0.25, 0];
multirotor.uav2_pos = [0, -0.5];
multirotor.uav3_pos = [0, 0.5];
multirotor.uav4_pos = [-0.25,0];

uav1.allocation_matrix = cal_allocation_matrix(multirotor.d, multirotor.c_tau);
uav1.allocation_matrix_inv = cal_allocation_matrix_inv(uav1.allocation_matrix);
uav2.allocation_matrix = cal_allocation_matrix(multirotor.d, multirotor.c_tau);
uav2.allocation_matrix_inv = cal_allocation_matrix_inv(uav2.allocation_matrix);
uav3.allocation_matrix = cal_allocation_matrix(multirotor.d, multirotor.c_tau);
uav3.allocation_matrix_inv = cal_allocation_matrix_inv(uav3.allocation_matrix);

multirotor.distribution_matrix = distribution(multirotor.uav1_pos,multirotor.uav2_pos,multirotor.uav3_pos);
multirotor.distribution_matrix_inv = distribution_inv(multirotor.distribution_matrix);
multirotor.x = zeros(3, length(multirotor.t));
multirotor.v = zeros(3, length(multirotor.t));
multirotor.R = zeros(9, length(multirotor.t));
multirotor.W = zeros(3, length(multirotor.t));
multirotor.ex = zeros(3, length(multirotor.t));
multirotor.ev = zeros(3, length(multirotor.t));
multirotor.eR = zeros(3, length(multirotor.t));
multirotor.eW = zeros(3, length(multirotor.t));
multirotor.mass_estimation = zeros(1, length(multirotor.t));
multirotor.inertia_estimation = zeros(5, length(multirotor.t));
multirotor.force_moment = zeros(4, length(multirotor.t));
multirotor.rotor_thrust = zeros(4, length(multirotor.t));
multirotor.F_disturbance = zeros(3, length(multirotor.t));

thrust_max = 9;
thrust_min = 0;
raw_W = zeros(3, length(multirotor.t));

% initialize states
if SELECT_FLIGHT_MODE == MODE_TRACKING
    multirotor.x(:, 1) = [0; 0; 0.95];
    multirotor.v(:, 1) = [0; 0; 0];
    multirotor.R(:, 1) = [1; 0; 0; 0; 1; 0; 0; 0; 1];
    multirotor.W(:, 1) = [0; 0; 0];
    multirotor.mass_estimation(1, 1) = 1.5;
    multirotor.inertia_estimation(1:2, 1) = [0.05 ; 0.05];
    multirotor.inertia_estimation(3:5, 1) = [0.005; 0.005; 0.005];
elseif SELECT_FLIGHT_MODE == MODE_HOVERING
    multirotor.x(:, 1) = [1.1; 0.9; 0];
    multirotor.v(:, 1) = [0.1; -0.1; 0.1];
    multirotor.R(:, 1) = [1; 0; 0; 0; 1; 0; 0; 0; 1];
    multirotor.W(:, 1) = [0.01; -0.01; 0.01];
    multirotor.mass_estimation(1, 1) = 2;
    multirotor.inertia_estimation(1:2, 1) = [0.0 ; 0];
    multirotor.inertia_estimation(3:5, 1) = [0.01; 0.01; 0.01];
end

% initialize controller
ctrl = controller;

% initialize integral concurrent learning
icl = integral_concurrent_learning;
icl.N_diag = 10;
icl.mat_diag_matrix = zeros(5, icl.N_diag);
icl.mat_diag_sum = zeros(5, 1);
icl.index_diag = 0;
icl.if_full_diag = 0;
icl.W_last = zeros(3, 1);
icl.current_moment = zeros(3, 1);
icl.current_force = 0;

icl_mass = integral_concurrent_learning;
icl_mass.N_diag = 10; 
icl_mass.mat_diag_matrix = zeros(1, icl_mass.N_diag);
icl_mass.mat_diag_sum = zeros(1, 1);
icl_mass.index_diag = 0;
icl_mass.if_full_diag = 0;
icl_mass.current_force = 0 ; 

% initialize trajectory
tra = zeros(12, length(multirotor.t));
traj = trajectory;


for i = 2:length(multirotor.t)
    i
    t_now = multirotor.t(i);

    % desired trajectory
    tra(:, i) = traj.traj_generate(t_now, SELECT_FLIGHT_MODE);
    Xd_enu = tra(1:9, i-1);
    b1d = tra(10:12, i);
    
    % control input and error
    [control_dis, error, mass_est, J_est, icl] = ctrl.geometric_tracking_ctrl(i, multirotor, Xd_enu, b1d, icl,dt, select_force_feedforward, select_moment_feedforward, select_moment_adaptive_w_wo_ICL, SELECT_FILTER);

    U_star = multirotor.distribution_matrix_inv*control_dis;
    uav1_control = U_star(1:4);
    uav2_control = U_star(5:8);
    uav3_control = U_star(9:12);

    uav1_thrust = uav1.allocation_matrix_inv*uav1_control;
    uav1_bound = bound_control(uav1_thrust, thrust_max, thrust_min);
    uav1_control = uav1.allocation_matrix*uav1_bound;

    uav2_thrust = uav2.allocation_matrix_inv*uav2_control;
    uav2_bound = bound_control(uav1_thrust, thrust_max, thrust_min);
    uav2_control = uav2.allocation_matrix*uav2_bound;

    uav3_thrust = uav3.allocation_matrix_inv*uav3_control;
    uav3_bound = bound_control(uav1_thrust, thrust_max, thrust_min);
    uav3_control = uav3.allocation_matrix*uav3_bound;

    control = multirotor.distribution_matrix*[uav1_control; uav2_control; uav3_control];

    control - control_dis
    %% CoG drift effect

    R = reshape(multirotor.R(:, i-1), 3, 3);
    W = multirotor.W(:, i-1);
    % derivative
    dW = [0 ; 0 ; 0 ] ; 
    if i > 2
       dW = (W - multirotor.W(:,i-2))/dt;
    end
    e3 = multirotor.e3;
    
    alpha = hat_map(dW)*multirotor.body2CoG + hat_map(W)*hat_map(W)*multirotor.body2CoG;
%     fprintf("Translation force : %.2f %.2f %.2f\n", alpha(1), alpha(2), alpha(3))
    M_drift = hat_map(multirotor.body2CoG)*control(1)*e3;
    control(2:4) = control(2:4) + M_drift;

    %% icl record
    icl.current_force = control(1);
    %% dynamics
    X0 = [vec_enu_to_ned(multirotor.x(:, i-1));
        vec_enu_to_ned(multirotor.v(:, i-1));
        reshape(reshape(multirotor.R(:, i-1), 3, 3), 9, 1);
        multirotor.W(:, i-1)];
    [T, X_new] = ode45(@(t, x) multirotor.dynamics(t, x, control, alpha), [0, dt], X0, control);
    multirotor.x(:, i) = vec_ned_to_enu(X_new(end, 1:3));
    multirotor.v(:, i) = vec_ned_to_enu(X_new(end, 4:6));
    multirotor.R(:, i) = X_new(end, 7:15);
    multirotor.W(:, i) = X_new(end, 16:18);

    % save the error
    multirotor.ex(:, i) = error(1:3);
    multirotor.ev(:, i) = error(4:6);
    multirotor.eR(:, i) = error(7:9);
    multirotor.eW(:, i) = error(10:12);
    
    % save rotor thrust
    multirotor.force_moment(:, i) = control(1:4);
%     multirotor.rotor_thrust(:, i) = multirotor.allocation_matrix_inv*control(1:4);
    
    % save moment of inertia
    multirotor.mass_estimation(1, i) = mass_est;
    multirotor.inertia_estimation(:, i) = J_est;
    multirotor.F_disturbance(:,i)= alpha*multirotor.m;
    % save control input for ICL control
    icl.current_force = control(1);
    icl.current_moment = control(2:4);

end

t = multirotor.t;

figure;
tiledlayout(3,1)
nexttile
% Plot position tracking error
plot(t,multirotor.x(1, :),LineWidth=1.0);
hold on
plot(t,tra(1, :),LineWidth=1.0);
title("Trajectory and Desired Trajectory",'FontSize', 18);
legend('x','xd','FontSize', 15)
nexttile
% Plot velocity tracking error
plot(t,multirotor.x(2, :),LineWidth=1.0)
hold on
plot(t,tra(2, :),LineWidth=1.0);
legend('y','yd','FontSize', 15)
nexttile
% Plot rotation tracking error
plot(t,multirotor.x(3, :),LineWidth=1.0)
hold on
plot(t,tra(3, :),LineWidth=1.0);
legend('z','zd','FontSize', 15)
xlabel('$Time(sec)$', 'Interpreter', 'latex')

figure;
tiledlayout(2,2)
nexttile
% Plot position tracking error
plot(t,multirotor.ex(1, :),t,multirotor.ex(2, :),t,multirotor.ex(3, :),LineWidth=1.0)
title("Postion Tracking errors",'FontSize', 20);
legend('ex_1','ex_2','ex_3','FontSize', 15)
nexttile
% Plot velocity tracking error
plot(t,multirotor.ev(1, :),t,multirotor.ev(2, :),t,multirotor.ev(3, :),LineWidth=1.0)
title("Velocity Tracking errors",'FontSize', 20);
legend('ev_1','ev_2','ev_3','FontSize', 15)

nexttile
% Plot rotation tracking error
plot(t,multirotor.eR(1, :),t,multirotor.eR(2, :),t,multirotor.eR(3,:),LineWidth=1.0)
title("Rotation Errors",'FontSize', 20);
legend('er_1','er_2','er_3','FontSize', 15)
nexttile
% Plot Omega tracking error
plot(t,multirotor.eW(1,:),t,multirotor.eW(2,:),t,multirotor.eW(3,:),LineWidth=1.0)
title("Angular Velocity Errors",'FontSize', 20);
legend('eo_1','eo_2','eo_3','FontSize', 15)



figure;
tiledlayout(3,1)
nexttile
% Plot necessary
theta_m_ground_truth = ones(1, length(multirotor.t))*multirotor.m;
t = multirotor.t;
plot(t,multirotor.mass_estimation,t,theta_m_ground_truth,LineWidth=1.0)
title("Mass",'FontSize', 20);
legend('Estimated Mass(kg)','Ground Truth(kg)','FontSize', 15)
nexttile
plot(t, multirotor.inertia_estimation(1,:),t,ones(1,length(t))*-multirotor.body2CoG(1),LineWidth=1.0)
title("CoG (x)",'FontSize', 20);
legend('Estimated (m)','Ground Truth(m)','FontSize', 15)
nexttile
plot(t, multirotor.inertia_estimation(2,:),t,ones(1,length(t))*-multirotor.body2CoG(2),LineWidth=1.0)
title("CoG (y)",'FontSize', 20);
legend('Estimated (m)','Ground Truth(m)','FontSize', 15)


text = sprintf('\nElapsed time : %.2f seconds\n', toc);
disp(text);
