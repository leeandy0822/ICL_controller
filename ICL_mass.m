clear all, close all, clc;


theta_m = 0.755;
kx0 = 20;
kv0 = 20;
gamma_m = 0.8;
cx = 1;
kcl_m = 0.001;


e3 = [0 ; 0 ; 1];
x0 = [0 ; 0 ;0];
x0_dot = [0 ; 0; 0];
x0_double_dot = [0;0;0];
theta_m_hat = 0;
Fd = [ 0 ;0 ;0];


% initial condition

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

t = payload.t;


% ICL record
record_Xd = zeros(3,length(t));
record_X = zeros(3,length(t));
record_ex = zeros(3,length(t));
record_ev = zeros(3,length(t));
record_theta_m = zeros(1,length(t));
record_theta_m_ground = ones(1,length(t))*theta_m;
record_icl = zeros(3,10);
icl_index = 1;


% initialize integral concurrent learning
icl = integral_concurrent_learning;
icl.N_diag = 30;
icl.mat_diag_matrix = zeros(1, icl.N_diag);
icl.mat_diag_sum = zeros(1, 1);
icl.index_diag = 0;
icl.current_force = zeros(1, 1);

% initial trajectory
tra = zeros(9, length(t));
traj = payload_trajectory;

for i=1:length(payload.t)
    
    t_now = payload.t(i);

    % desire trajectory
    tra(:,i) = traj.traj_generate(t_now);
    Xd = tra(1:9, i);
    x0d = Xd(1:3);
    x0d_dot = Xd(4:6);
    x0d_double_dot = Xd(7:9);
    
    
    record_X(:,i) = x0;
    record_Xd(:,i) = x0d;
    
    
    % Repayload.gression Matrix
    Ym = -x0d_double_dot + payload.g*e3;
    
    Ym_cl = -x0_dot + payload.g*e3*dt;

    
    % Error
    payload.ex(:,i) = x0 - x0d;
    payload.ev(:,i) = x0_dot - x0d_dot;
    
    
    F_bar = icl.current_force*dt;
    
    % prepare the past data
    mat_diag_now = Ym_cl'*(F_bar - Ym_cl*theta_m_hat);
    
    % summation of the past data
    icl.mat_diag_matrix(:, icl.index_diag+1) = mat_diag_now;
    icl.index_diag = mod((icl.index_diag+1), icl.N_diag);
    icl.mat_diag_sum = sum(icl.mat_diag_matrix, 2);
    icl_term = icl.mat_diag_sum;
    

    % update law
    theta_m_hat_dot = gamma_m * Ym.' * (payload.ev(:,i) + cx*payload.ex(:,i)) + kcl_m * gamma_m * icl_term;
    theta_m_hat = theta_m_hat + theta_m_hat_dot*dt;
    record_theta_m(i) = theta_m_hat;
    
    % Control Input
    Fd = -kx0*payload.ex(:,i) - kv0*payload.ev(:,i) - Ym*theta_m_hat ;
    icl.current_force = Fd;
    

    x0_dot = x0_dot + (Fd + theta_m*payload.g*e3)/theta_m * dt;
    x0 = x0 + x0_dot*dt;

end

figure(1);

plot3(tra(1,:),tra(2,:),tra(3,:),record_X(1,:),record_X(2,:),record_X(3,:))
xlabel('X')
ylabel('Y')
zlabel('Z')
title("Trajectory");
grid on


figure(3);
tiledlayout(3,1)
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
% Plot velocity tracking error
plot(t,record_theta_m,t,record_theta_m_ground)
title("Velocity Tracking errors");
legend('theta m hat','Ground Truth')