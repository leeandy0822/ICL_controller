clear all, close all, clc;
addpath('./tools/')
tic;

%% Simulation time
dt = 1/400;
sim_t = 30;
payload = payload_dynamics;
payload.dt = dt;
payload.sim_t = sim_t;
payload.t = 0:dt:sim_t;

%% Physical property
payload.m = 5;
payload.J = [0.030, 0, 0;
                0, 0.03, 0;
                0, 0, 0.0500];

payload.x = zeros(3,length(payload.t));
payload.v = zeros(3,length(payload.t));
payload.R = zeros(9, length(payload.t));
payload.Rd = zeros(9, length(payload.t));
payload.W = zeros(3, length(payload.t));
payload.dW = zeros(3, length(payload.t));
payload.ex = zeros(3, length(payload.t));
payload.ev = zeros(3, length(payload.t));
payload.force = zeros(3,length(payload.t));
payload.moment = zeros(3,length(payload.t));

% translation: m m*CoG  rotation: CoG J3x1 (todo: 6x1)
payload.translation_estimation = zeros(4, length(payload.t));
payload.rotation_estimation = zeros(6, length(payload.t));

%% Grasp position 

payload.B = [eye(3) eye(3) eye(3); hat_map(payload.p1) hat_map(payload.p2) hat_map(payload.p3)];
payload.B_real =  payload.B(4:6,:) + [hat_map(payload.body2CoG) hat_map(payload.body2CoG) hat_map(payload.body2CoG)];
payload.B_real = [eye(3) eye(3) eye(3) ; payload.B_real];
payload.u1 = zeros(3, length(payload.t));
payload.u2 = zeros(3, length(payload.t));
payload.u3 = zeros(3, length(payload.t));


%% initial condition
eul = [0 0 0];
R0 = eul2rotm(eul);
payload.R(:,1) = reshape(R0,9,1);
payload.W(:,1) = [0, 0, 0];
% initial theta guess
payload.translation_estimation(:,1) = [3; 0.05 ; 0.05 ; 0.05 ];
payload.rotation_estimation(:, 1) = [0.01; 0.01; 0.01; 0; 0; 0];
payload.freq =  zeros(1, length(payload.t));

x0 = [0 ; 7 ; 0];
x0_dot = [0 ; 0; 0];
payload.x(:,1) = x0;
payload.v(:,1) = x0_dot;

t = payload.t;
% initialize controller
ctrl = controller;

%% ICL initialize
% initialize integral concurrent learning
icl_trans = integral_concurrent_learning;
icl_trans.N_diag = 20;
icl_trans.mat_diag_matrix = zeros(4, icl_trans.N_diag);
icl_trans.mat_diag_sum = zeros(4, 1);
icl_trans.index_diag = 0;
icl_trans.current_force = zeros(3, 1);


% initialize integral concurrent learning
icl_rot = integral_concurrent_learning;
icl_rot.N_diag = 5;
icl_rot.mat_diag_matrix = zeros(6, icl_rot.N_diag);
icl_rot.mat_diag_sum = zeros(6, 1);
icl_rot.index_diag = 0;
icl_rot.current_moment = zeros(3,1);
icl_rot.W_last = zeros(3, 1);
icl_rot.f_last = zeros(3, 1);

%% trajectory
tra = zeros(9, length(t));
traj = payload_trajectory;
tra(:,1) = traj.traj_generate(payload.t(1));

h = waitbar(0,'please wait');
for i= 2:length(payload.t)
    
    str=['Calculating...',num2str(round(i/length(payload.t)*100,1)),'%'];
    waitbar(i/length(payload.t),h,str)
    t_now = payload.t(i);
    % desire trajectory
    tra(:,i) = traj.traj_generate(t_now);
    Xd = tra(1:9, i);
    
    % force controller
    [Fd, force_error, translation_est, icl_trans] = ctrl.force_ctrl(i,payload , Xd,  icl_rot,icl_trans,dt);
    
    % moment controller 
    [Md, moment_error, rotation_est, icl_rot, Rd] = ctrl.moment_ctrl(i, payload, Xd, icl_rot, icl_trans,dt);

    
    % distribute force

    dis = distribute_force;
    [Fd, Md, u, freq_dis] = dis.cal_u(payload,Fd,Md,i); 

    payload.freq(:,i-1) = freq_dis;
    payload.u1(:,i-1) = u(1:3);
    payload.u2(:,i-1) = u(4:6);
    payload.u3(:,i-1) = u(7:9);

    payload.force(:,i-1) = Fd;
    payload.moment(:,i-1) = Md;

    % initial condition
    X0 = [vec_enu_to_ned(payload.x(:,i-1)); vec_enu_to_ned(payload.v(:,i-1));
        reshape(reshape(payload.R(:, i-1), 3, 3), 9, 1); payload.W(:, i-1)];

    
    control = [Fd ; Md];
    error = [force_error moment_error];
    
    %% add the CoG to body effect
    
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
    payload.translation_estimation(:,i) = translation_est;
    payload.rotation_estimation(:,i) = rotation_est;
    
    icl_trans.current_force = Fd;
    icl_rot.current_moment = Md;
end


t = payload.t;
B = [ 0 1 0 ; 1 0 0 ; 0 0 -1];

% plot
figure(1);
tra(1:3,:) = B*tra(1:3,:);
payload.x(1:3,:) = B*payload.x(1:3,:);
plot3(tra(1,:),tra(2,:),tra(3,:),'LineWidth', 1, 'Color','k')
hold on;
plot3(payload.x(1,:),payload.x(2,:),payload.x(3,:),'LineWidth', 0.5, 'Color','r')
hold on;
title('Trajectory','FontSize', 20);
hold on;

for i = 1:1500:length(payload.t)
    matrix = reshape(payload.R(:,i),3,3);
    matrix = B*matrix;
    norm = 3;
    quiver3(payload.x(1,i),payload.x(2,i),payload.x(3,i),matrix(1,1)/norm,matrix(2,1)/norm,matrix(3,1)/norm,'r',"LineWidth",1); 
    quiver3(payload.x(1,i),payload.x(2,i),payload.x(3,i),matrix(1,2)/norm,matrix(2,2)/norm,matrix(3,2)/norm,'g',"LineWidth",1); 
    quiver3(payload.x(1,i),payload.x(2,i),payload.x(3,i),matrix(1,3)/norm,matrix(2,3)/norm,matrix(3,3)/norm,'b',"LineWidth",1); 
end

hold on;
grid on;
xlabel('x(m)'), ylabel('y(m)'), zlabel('z(m)')
axis equal

figure(2);
tiledlayout(2,2)
nexttile
% Plot position tracking error
plot(t,payload.ex(1,:),t,payload.ex(2,:),t,payload.ex(3,:),LineWidth=2.0)
title("Postion Tracking errors",'FontSize', 20);
legend('ex_1','ex_2','ex_3','FontSize', 15)
nexttile
% Plot velocity tracking error
plot(t,payload.ev(1,:),t,payload.ev(2,:),t,payload.ev(3,:),LineWidth=2.0)
title("Velocity Tracking errors",'FontSize', 20);
legend('ev_1','ev_2','ev_3','FontSize', 15)

nexttile
% Plot rotation tracking error
plot(t,payload.eR(1,:),t,payload.eR(2,:),t,payload.eR(3,:),LineWidth=2.0)
title("Rotation Errors",'FontSize', 20);
legend('er_1','er_2','er_3','FontSize', 15)
nexttile
% Plot Omega tracking error
plot(t,payload.eW(1,:),t,payload.eW(2,:),t,payload.eW(3,:),LineWidth=2.0)
title("Angular Velocity Errors",'FontSize', 20);
legend('eo_1','eo_2','eo_3','FontSize', 15)

%% Calculating Error
% turn mass x CoG -> CoG
payload.translation_estimation(2:4,:) = payload.translation_estimation(2:4,:) ./ payload.translation_estimation(1,:);
trans_est = payload.translation_estimation(:,length(t))';
m = trans_est(1);
cog_x = trans_est(2);
cog_y = trans_est(3);
cog_z = trans_est(4);

rot_est = payload.rotation_estimation(:,length(t))';
cog_jx = rot_est(1);
cog_jy = rot_est(2);
cog_jz = rot_est(3);
J_x = rot_est(4);
J_y = rot_est(5);
J_z = rot_est(6);


fprintf("Mass Estimate Error: %.2f Percent\n", calculate_err(m, payload.m))
fprintf("CoG-x Tra Error: %.2f Percent\n", calculate_err(cog_x, payload.body2CoG(1)))
fprintf("CoG-y Tra Error: %.2f Percent\n", calculate_err(cog_y, payload.body2CoG(2)))
fprintf("CoG-z Tra Error: %.2f Percent\n", calculate_err(cog_z, payload.body2CoG(3)))
fprintf("Inertia XX Error: %.2f Percent\n", calculate_err(J_x,payload.J(1)))
fprintf("Inertia YY Error: %.2f Percent\n", calculate_err(J_y,payload.J(5)))
fprintf("Inertia ZZ Error: %.2f Percent\n", calculate_err(J_z,payload.J(9)))
fprintf("CoG-x Rot Error: %.2f Percent\n", calculate_err(cog_jx,-payload.body2CoG(1)))
fprintf("CoG-y Rot Error: %.2f Percent\n", calculate_err(cog_jy,-payload.body2CoG(2)))
fprintf("CoG-z Rot Error: %.2f Percent\n", calculate_err(cog_jz,-payload.body2CoG(3)))


figure(3);
tiledlayout(4,1)
nexttile
% Plot necessary
theta_m_ground_truth = ones(1, length(payload.t))*payload.m;
plot(t,payload.translation_estimation(1,:),t,theta_m_ground_truth,LineWidth=2.0)
title("Mass",'FontSize', 20);
legend('Estimated Mass','Ground Truth','FontSize', 15)
nexttile
plot(t, payload.rotation_estimation(1,:),t,ones(1,length(t))*-payload.body2CoG(1),LineWidth=2.0)
title("CoG (x)",'FontSize', 20);
legend('Estimate','Ground Truth','FontSize', 15)
nexttile
plot(t, payload.rotation_estimation(2,:),t,ones(1,length(t))*-payload.body2CoG(2),LineWidth=2.0)
title("CoG (y)",'FontSize', 20);
legend('Estimate','Ground Truth','FontSize', 15)
nexttile
plot(t, payload.rotation_estimation(3,:),t,ones(1,length(t))*-payload.body2CoG(3),LineWidth=2.0)
title("CoG (z)",'FontSize', 20);
legend('Estimate','Ground Truth','FontSize', 15)

figure(4)
plot(t, payload.freq,LineWidth=2.0);
title("Control Frequency",'FontSize', 20);
legend('x','y','z','FontSize', 15)


% 
% % Plot unnecessary
% figure(4);
% tiledlayout(2,3)
% nexttile
% plot(t, payload.rotation_estimation(4,:),t,ones(1,length(t))*payload.J(1),LineWidth=2.0)
% title("Inertia xx",'FontSize', 20);
% legend('Estimate','Ground Truth','FontSize', 15)
% nexttile
% plot(t, payload.rotation_estimation(5,:),t,ones(1,length(t))*payload.J(5),LineWidth=2.0)
% title("Inertia yy",'FontSize', 20);
% legend('Estimate','Ground Truth','FontSize', 15)
% nexttile
% plot(t, payload.rotation_estimation(6,:),t,ones(1,length(t))*payload.J(9),LineWidth=2.0)
% title("Inertia zz",'FontSize', 20);
% legend('Estimate','Ground Truth','FontSize', 15)
% nexttile
% plot(t, payload.translation_estimation(2,:),t,ones(1,length(t))*payload.body2CoG(1),LineWidth=2.0)
% title("From Mass CoG (x)",'FontSize', 20);
% legend('Estimate','Ground Truth','FontSize', 15)
% nexttile
% plot(t, payload.translation_estimation(3,:),t,ones(1,length(t))*payload.body2CoG(2),LineWidth=2.0)
% title("From Mass CoG (y)",'FontSize', 20);
% legend('Estimate','Ground Truth','FontSize', 15)
% nexttile
% plot(t, payload.translation_estimation(4,:),t,ones(1,length(t))*payload.body2CoG(3),LineWidth=2.0)
% title("From Mass CoG (z)",'FontSize', 20);
% legend('Estimate','Ground Truth','FontSize', 15)


% % resultant force
% figure(5)
% tiledlayout(2,1)
% nexttile
% plot(t, payload.force(1,:), t , payload.force(2,:), t , payload.force(3,:),LineWidth=2.0);
% title("Force Input",'FontSize', 20);
% legend('x','y','z','FontSize', 15)
% nexttile
% plot(t, payload.moment(1,:), t , payload.moment(2,:), t , payload.moment(3,:),LineWidth=2.0);
% title("Moment Input",'FontSize', 20);
% legend('x','y','z','FontSize', 15)

% distributed force
figure(6)
tiledlayout(3,1)
nexttile
plot(t, payload.u1(1,:), t , payload.u1(2,:), t , payload.u1(3,:),LineWidth=2.0);
title("Distributed force - u1",'FontSize', 20);
legend('x','y','z','FontSize', 15)
nexttile
plot(t, payload.u2(1,:), t , payload.u2(2,:), t , payload.u2(3,:),LineWidth=2.0);
title("Distributed force - u2",'FontSize', 20);
legend('x','y','z','FontSize', 15)
nexttile
plot(t, payload.u3(1,:), t , payload.u3(2,:), t , payload.u3(3,:),LineWidth=2.0);
title("Distributed force - u3",'FontSize', 20);
legend('x','y','z','FontSize', 15)

text = sprintf('\nElapsed time : %.2f seconds\n', toc);
disp(text);

