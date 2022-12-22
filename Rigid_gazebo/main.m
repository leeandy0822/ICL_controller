% A simulation for geometric tracking control of multirotors
close all;
tic;

rosshutdown
rosinit

% simulation time
dt = 0.0025;

% flight mode
MODE_TRACKING = 0;
MODE_HOVERING = 1;
SELECT_FLIGHT_MODE = MODE_HOVERING;

if SELECT_FLIGHT_MODE == MODE_TRACKING
    sim_t = 80;
else
    sim_t = 60;
end
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
multirotor.dt = dt;
multirotor.sim_t = sim_t;
multirotor.t = 0:dt:sim_t;
multirotor.m = 3.2;
multirotor.J = [0.2, 0, 0;
                0, 0.2, 0;
                0, 0, 0.1];
multirotor.d = 0.1250;
multirotor.c_tau = 1.347e-2;

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

% ROS Gazebo setup
uav1 = gazebo_uav;
uav2 = gazebo_uav;
uav3 = gazebo_uav;
uav4 = gazebo_uav;

uav1.force_moment = zeros(4, length(multirotor.t));
uav2.force_moment = zeros(4, length(multirotor.t));
uav3.force_moment = zeros(4, length(multirotor.t));
uav4.force_moment = zeros(4, length(multirotor.t));

command = gazebo_uav;

system_pose = rossubscriber("/pub_system_pose","DataFormat","struct");

[command.pub, command.msg] = rospublisher("/payload/command","std_msgs/Float32MultiArray");

multirotor.cur_t = 0;
iter = 1;

[uav1, uav2, uav3, uav4,multirotor] = getPose(uav1,uav2,uav3,uav4,multirotor,system_pose,iter); 

multirotor.uav1_pos = uav1.x - multirotor.x(:,iter);
multirotor.uav2_pos = uav2.x - multirotor.x(:,iter);
multirotor.uav3_pos = uav3.x - multirotor.x(:,iter);
multirotor.uav4_pos = uav4.x - multirotor.x(:,iter);

multirotor.distribution_matrix = distribution(multirotor.uav1_pos,multirotor.uav2_pos,multirotor.uav3_pos,multirotor.uav4_pos);
multirotor.distribution_matrix_inv = distribution_inv(multirotor.distribution_matrix);

% initialize states
if SELECT_FLIGHT_MODE == MODE_TRACKING

    multirotor.mass_estimation(1, 1) = 8.5;
    multirotor.inertia_estimation(1:2, 1) = [0.095 ; 0.024];
    multirotor.inertia_estimation(3:5, 1) = [0.1; 0.1; 0.1];

elseif SELECT_FLIGHT_MODE == MODE_HOVERING

    multirotor.mass_estimation(1, 1) = 10;
    multirotor.inertia_estimation(1:2, 1) = [0.15 ; -0.02];
    multirotor.inertia_estimation(3:5, 1) = [0.1; 0.1; 0.1];
end

% initialize controller
ctrl = controller;

% initialize integral concurrent learning
icl = integral_concurrent_learning;
icl.N_diag = 30;
icl.mat_diag_matrix = zeros(5, icl.N_diag);
icl.mat_diag_sum = zeros(5, 1);
icl.index_diag = 0;
icl.if_full_diag = 0;

icl.mass_N_diag = 30;
icl.mass_mat_diag_matrix = zeros(1, icl.N_diag);
icl.mass_mat_diag_sum = zeros(1, 1);
icl.mass_index_diag = 0;
icl.mass_if_full_diag = 0;

icl.W_last = zeros(3, 1);
icl.current_moment = zeros(3, 1);
icl.current_force = 0;

% initialize trajectory
tra = zeros(12, length(multirotor.t));
traj = trajectory;

iter = iter+1;
multirotor.t(:,1) = 0;
initial_time = (rostime("now").Sec + rostime("now").Nsec/1000000000);
multirotor.last_t = (rostime("now").Sec + rostime("now").Nsec/1000000000) - initial_time;
icl_rot.f_last = [0 ; 0 ; 0];
time_rec = multirotor.cur_t;

while multirotor.cur_t < sim_t

%     [uav1, uav2, uav3, uav4,multirotor] = getPose(uav1,uav2,uav3,uav4, multirotor,system_pose,iter); 
    
     % subscribers get data
    
    System_pose = receive(system_pose,1);
    pose_payload_data = System_pose.Payload;
    pose_payload_acc = System_pose.PayloadAcc;
    pose_payload_vel = System_pose.PayloadVel;

    %% Get payload position and orientation
    multirotor.x(:,iter) = [ pose_payload_data.Position.X; pose_payload_data.Position.Y;pose_payload_data.Position.Z];
    q =  [pose_payload_data.Orientation.W pose_payload_data.Orientation.X pose_payload_data.Orientation.Y pose_payload_data.Orientation.Z];
    temp_R = quat2rotm(q);
    multirotor.a = pose_payload_acc;
    multirotor.v(:,iter) = [pose_payload_vel.X ;pose_payload_vel.Y ;pose_payload_vel.Z];
    multirotor.R(:,iter) = reshape(temp_R,[9,1]);
    multirotor.W(:,iter) = [System_pose.PayloadW.X ; System_pose.PayloadW.Y; System_pose.PayloadW.Z];

    % Get time
%     multirotor.cur_t = (rostime("now").Sec + rostime("now").Nsec/1000000000) - initial_time;
    multirotor.cur_t = multirotor.cur_t + 0.0067;
    dt = 0.0067;

    % desired trajectory
    tra(:, iter-1) = traj.traj_generate(multirotor.cur_t, SELECT_FLIGHT_MODE);

    Xd_enu = tra(1:9, iter-1);
    b1d = tra(10:12, iter-1);

    % control input and error
    [control_dis, error, mass_est, J_est, icl] = ctrl.geometric_tracking_ctrl(iter, multirotor, Xd_enu, b1d, icl,dt, select_force_feedforward, select_moment_feedforward, select_moment_adaptive_w_wo_ICL);
    
    error(1:3)
    mass_est
    J_est

    U_star = multirotor.distribution_matrix_inv*control_dis;
    uav1.control = U_star(1:4);
    uav2.control = U_star(5:8);
    uav3.control = U_star(9:12);
    uav4.control = U_star(13:16);
    
    
    command.msg.Data = [uav1.control,uav2.control,uav3.control,uav4.control];
    send(command.pub, command.msg);

    icl.current_force = control_dis(1);
    icl.current_moment = control_dis(2:4);
    % save the error

    multirotor.ex(:, iter) = error(1:3);
    multirotor.ev(:, iter) = error(4:6);
    multirotor.eR(:, iter) = error(7:9);
    multirotor.eW(:, iter) = error(10:12);
    
    % save rotor thrust
    multirotor.force_moment(:, iter) = control_dis(1:4);
    uav1.force_moment(:, iter) = uav1.control;
    uav2.force_moment(:, iter) = uav2.control;
    uav3.force_moment(:, iter) = uav3.control;
    uav4.force_moment(:, iter) = uav4.control;

    % save moment of inertia

    multirotor.mass_estimation(1, iter) = mass_est;
    multirotor.inertia_estimation(:, iter) = J_est;
    % save control input for ICL control

    iter = iter + 1; 

    time_rec = multirotor.cur_t;

end

t = 1:1:iter;
t = t*0.0067;
figure;
tiledlayout(3,1)
nexttile
% Plot position tracking error
plot(t,multirotor.x(1, 1:iter),LineWidth=1.0);
hold on
plot(t,tra(1, 1:iter),LineWidth=1.0);
title("Trajectory and Desired Trajectory",'FontSize', 18);
legend('x','xd','FontSize', 15)
xlim([0,sim_t])
nexttile
% Plot velocity tracking error
plot(t,multirotor.x(2, 1:iter),LineWidth=1.0)
hold on
plot(t,tra(2, 1:iter),LineWidth=1.0);
legend('y','yd','FontSize', 15)
xlim([0,sim_t])
nexttile
% Plot rotation tracking error
plot(t,multirotor.x(3, 1:iter),LineWidth=1.0)
hold on
plot(t,tra(3, 1:iter),LineWidth=1.0);
legend('z','zd','FontSize', 15)
xlabel('$Time(sec)$', 'Interpreter', 'latex')
xlim([0,sim_t])

figure;
tiledlayout(2,2)
nexttile
% Plot position tracking error
plot(t,multirotor.ex(1, 1:iter),t,multirotor.ex(2, 1:iter),t,multirotor.ex(3, 1:iter),LineWidth=1.0)
title("Postion Tracking errors",'FontSize', 20);
legend('ex_1','ex_2','ex_3','FontSize', 15)
xlim([0,sim_t])
nexttile
% Plot velocity tracking error
plot(t,multirotor.ev(1, 1:iter),t,multirotor.ev(2, 1:iter),t,multirotor.ev(3, 1:iter),LineWidth=1.0)
title("Velocity Tracking errors",'FontSize', 20);
legend('ev_1','ev_2','ev_3','FontSize', 15)
xlim([0,sim_t])
nexttile
% Plot rotation tracking error
plot(t,multirotor.eR(1, 1:iter),t,multirotor.eR(2, 1:iter),t,multirotor.eR(3,1:iter),LineWidth=1.0)
title("Rotation Errors",'FontSize', 20);
legend('er_1','er_2','er_3','FontSize', 15);
xlim([0,sim_t])
nexttile
% Plot Omega tracking error
plot(t,multirotor.eW(1,1:iter),t,multirotor.eW(2,1:iter),t,multirotor.eW(3,1:iter),LineWidth=1.0)
title("Angular Velocity Errors",'FontSize', 20);
legend('eo_1','eo_2','eo_3','FontSize', 15)
xlim([0,sim_t])



figure;
tiledlayout(3,1)
nexttile

% Plot necessary
theta_m_ground_truth = ones(1, length(t))*8.6;
Cog_x = 0.095;
Cog_y = 0.0238;
plot(t,multirotor.mass_estimation(:,1:iter),t,theta_m_ground_truth(:,1:iter),LineWidth=1.0)
title("Mass",'FontSize', 20);
legend('Estimated Mass(kg)','Ground Truth(kg)','FontSize', 15)
xlim([0,sim_t])
ylim([5,11])
nexttile
plot(t, multirotor.inertia_estimation(1,1:iter),t,ones(1,iter)*Cog_x,LineWidth=1.0)
title("CoG (x)",'FontSize', 20);
legend('Estimated (m)','Ground Truth(m)','FontSize', 15)
xlim([0,sim_t])
ylim([0, 0.2])
nexttile
plot(t, multirotor.inertia_estimation(2,1:iter),t,ones(1,iter)*Cog_y,LineWidth=1.0)
title("CoG (y)",'FontSize', 20);
legend('Estimated (m)','Ground Truth(m)','FontSize', 15)
xlim([0,sim_t])
ylim([-0.1, 0.2])




figure;
tiledlayout(5,1)
nexttile
% Plot position tracking error
plot(t,multirotor.force_moment(1,1:iter),t,multirotor.force_moment(2, 1:iter),t,multirotor.force_moment(3, 1:iter),t,multirotor.force_moment(4, 1:iter),LineWidth=1.0)
title("Total control input",'FontSize', 15);
legend('Thrust','Moment x','Moment y','Moment z','FontSize', 12)
xlim([0,sim_t])
nexttile
% Plot position tracking error
plot(t,uav1.force_moment(1,1:iter),t,uav1.force_moment(2, 1:iter),t,uav1.force_moment(3, 1:iter),t,uav1.force_moment(4, 1:iter),LineWidth=1.0)
title("UAV1 input",'FontSize', 15);
legend('Thrust','Moment x','Moment y','Moment z','FontSize', 12)
xlim([0,sim_t])
nexttile
% Plot position tracking error
plot(t,uav2.force_moment(1, 1:iter),t,uav2.force_moment(2, 1:iter),t,uav2.force_moment(3, 1:iter),t,uav2.force_moment(4, 1:iter),LineWidth=1.0)
title("UAV2 input",'FontSize', 15);
legend('Thrust','Moment x','Moment y','Moment z','FontSize', 12)
xlim([0,sim_t])
nexttile
% Plot position tracking error
plot(t,uav3.force_moment(1, 1:iter),t,uav3.force_moment(2, 1:iter),t,uav3.force_moment(3, 1:iter),t,uav3.force_moment(4, 1:iter),LineWidth=1.0)
title("UAV3 input",'FontSize', 15);
legend('Thrust','Moment x','Moment y','Moment z','FontSize', 12)
xlim([0,sim_t])
nexttile
% Plot position tracking error
plot(t,uav4.force_moment(1, 1:iter),t,uav4.force_moment(2, 1:iter),t,uav4.force_moment(3, 1:iter),t,uav4.force_moment(4, 1:iter),LineWidth=1.0)
title("UAV4 input",'FontSize', 15);
legend('Thrust','Moment x','Moment y','Moment z','FontSize', 12)
xlim([0,sim_t])





text = sprintf('\nElapsed time : %.2f seconds\n', toc);
disp(text);
