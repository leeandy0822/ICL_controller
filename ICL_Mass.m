clear all, close all, clc;

theta_m = 0.755;
kx0 = 10;
kv0 = 10;
gamma_m = 0.8;
cx = 1;
kcl_m = 0.01;


g = 9.8;
e3 = [0 ; 0 ; -1];

t = (1:1:6000);
dt = 0.01;

sim_t = 10;

payload = payload_dynamics;
payload.dt = dt;
payload.sim_t = sim_t;
payload.t = 0:dt:sim_t;
payload.m = 0.75;
payload.J = [];
payload.x = zeros(3,length(payload.t));
payload.v = zeros(3,length(payload.t));
payload.R = zeros(3,length(payload.t));
payload.W = zeros(3,length(payload.t));
payload.ex = zeros(3,length(payload.t));
payload.ev = zeros(3,length(payload.t));
payload.eR = zeros(3,length(payload.t));
payload.eW = zeros(3,length(payload.t));
payload.mass_estimation = zeros(1,length(payload.t));
payload.inertia_estimation = zeros(3,length(payload.t));
payload.control_input = zeros(4,length(payload.t));


payload.x(:,1) = [0 ; 0 ;0];
payload.v(:,1) = [0 ; 0 ;0];
payload.mass_estimation(1,1) = 0;
payload.inertia_estimation(:,1) = [0 ; 0 ; 0];

% Trajctory
tra = zeros(9,length(payload.t));
traj = trajectory;

% Initialize Controller
ctrl = controller;

% initialize integral concurrent learning
icl = integral_concurrent_learning;
icl.N_diag = 10;
icl.mat_diag_matrix = zeros(3, icl.N_diag);
icl.mat_diag_sum = zeros(3, 1);
icl.index_diag = 0;
icl.if_full_diag = 0;
icl.W_last = zeros(3, 1);
icl.current_moment = zeros(3, 1);


% initialize ICL
for i=2:length(payload.t)

    t = payload.t(i);
    % desire trajectory
    tra(:,i) = traj.traj_gen(t);
    Xd_enu = tra(1:9, i-1);
    b1d = tra(10:12, i);
    
    
end


figure(1);

plot3(record_Xd(1,:),record_Xd(2,:),record_Xd(3,:),record_X(1,:),record_X(2,:),record_X(3,:))
xlabel('X')
ylabel('Y')
zlabel('Z')
title("Trajectory");
grid on

t = t*0.01;
figure(3);
tiledlayout(3,1)
nexttile
% Plot position tracking error
plot(t,record_ex(1,:),t,record_ex(2,:),t,record_ex(3,:))
title("Postion Tracking errors");
legend('ex_1','ex_2','ex_3')
nexttile
% Plot velocity tracking error
plot(t,record_ev(1,:),t,record_ev(2,:),t,record_ev(3,:))
title("Velocity Tracking errors");
legend('ev_1','ev_2','ev_3')
nexttile
% Plot velocity tracking error
plot(t,record_theta_m,t,record_theta_m_ground)
title("Velocity Tracking errors");
legend('theta m hat','Ground_truth')