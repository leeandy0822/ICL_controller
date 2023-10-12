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
SELECT_FLIGHT_MODE = MODE_TRACKING;

% position mode
MODE_NORMAL = 0 ; 
MODE_ENERGY = 1 ; 
MODE_BOTH = 2; 
MODE_CONTROLLABILITY = 3; 

SELECT_POSITION_MODE = MODE_BOTH;

if SELECT_FLIGHT_MODE == MODE_TRACKING
    sim_t = 100;
else
    sim_t = 80;
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

multirotor.x = zeros(3, length(multirotor.t));
multirotor.v = zeros(3, length(multirotor.t));
multirotor.R = zeros(9, length(multirotor.t));
multirotor.W = zeros(3, length(multirotor.t));
multirotor.W_dot = zeros(3, length(multirotor.t));
multirotor.ex = zeros(3, length(multirotor.t));
multirotor.ev = zeros(3, length(multirotor.t));
multirotor.eR = zeros(3, length(multirotor.t));
multirotor.eW = zeros(3, length(multirotor.t));
multirotor.mass_estimation = zeros(4, length(multirotor.t));
multirotor.inertia_estimation = zeros(5, length(multirotor.t));
multirotor.force_moment = zeros(4, length(multirotor.t));
multirotor.rotor_thrust = zeros(4, length(multirotor.t));
multirotor.F_disturbance = zeros(3, length(multirotor.t));
multirotor.energy = zeros(4, length(multirotor.t));

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
    
    if SELECT_POSITION_MODE == MODE_NORMAL
        multirotor.mass_estimation(1, 1) = 9.5;
        multirotor.inertia_estimation(1:2, 1) = [0; 0];
        multirotor.inertia_estimation(3:5, 1) = [0.1; 0.1; 0.1];
        file_title = "data/" + "normal";
    else
        multirotor.mass_estimation(1, 1) = 8.6;
        multirotor.inertia_estimation(1:2, 1) = [0.17; 0.04];
        multirotor.inertia_estimation(3:5, 1) = [0.1; 0.1; 0.1];
        file_title = "data/" + "energy";
    end

else
    multirotor.mass_estimation(1, 1) = 9.5;
    multirotor.inertia_estimation(1:2, 1) = [0; 0];
    multirotor.inertia_estimation(3:5, 1) = [0.1; 0.1; 0.1];
end

% initialize controller
ctrl = controller;

% initialize integral concurrent learning
icl = integral_concurrent_learning;
icl.N_diag = 400;
icl.mat_diag_matrix = zeros(5, icl.N_diag);
icl.mat_diag_sum = zeros(5, 1);
icl.index_diag = 0;
icl.if_full_diag = 0;

icl.mass_N_diag = 40;
icl.mass_mat_diag_matrix = zeros(4, icl.N_diag);
icl.mass_mat_diag_sum = zeros(4, 1);
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
    uav1.a = [System_pose.Uav1Acc.X;System_pose.Uav1Acc.Y; System_pose.Uav1Acc.Z];    
    uav2.a = [System_pose.Uav2Acc.X;System_pose.Uav2Acc.Y; System_pose.Uav2Acc.Z];    
    uav3.a = [System_pose.Uav3Acc.X;System_pose.Uav3Acc.Y; System_pose.Uav3Acc.Z];    
    uav4.a = [System_pose.Uav4Acc.X;System_pose.Uav4Acc.Y; System_pose.Uav4Acc.Z];    
    uav_a = [uav1.a ; uav2.a ; uav3.a ; uav4.a];

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
    [control_dis, error, mass_est, J_est, icl, W_dot] = ctrl.geometric_tracking_ctrl(iter,uav_a, multirotor, Xd_enu, b1d, icl,dt, select_force_feedforward, select_moment_feedforward, select_moment_adaptive_w_wo_ICL);
    multirotor.W_dot(:,iter) = W_dot;

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

    multirotor.energy(1,iter) = uav1.control(1)*uav1.control(1);
    multirotor.energy(2,iter) = uav2.control(1)*uav2.control(1);
    multirotor.energy(3,iter) = uav3.control(1)*uav3.control(1);
    multirotor.energy(4,iter) = uav4.control(1)*uav4.control(1);


    % save moment of inertia

    multirotor.mass_estimation(:, iter) = mass_est;
    multirotor.inertia_estimation(:, iter) = J_est;
    % save control input for ICL control

    iter = iter + 1; 

    time_rec = multirotor.cur_t;

end

t = 1:1:iter;
t = t*0.0067;
sim_t = sim_t -1;

figure;
plot3(tra(1,1:length(t)-20),tra(2,1:length(t)-20),tra(3,1:length(t)-20),'LineWidth', 1.4, 'Color','k')
hold on;
plot3(multirotor.x(1,1:length(t)-20),multirotor.x(2,1:length(t)-20),multirotor.x(3,1:length(t)-20),'LineWidth', 1, 'Color','r')
hold on;
title('Trajectory','FontSize', 20);
hold on;

for i = 1:300:length(t)
    matrix = reshape(multirotor.R(:,i),3,3);
    norm = 8;
    quiver3(multirotor.x(1,i),multirotor.x(2,i),multirotor.x(3,i),matrix(1,1)/norm,matrix(2,1)/norm,matrix(3,1)/norm,'r',"LineWidth",1); 
    quiver3(multirotor.x(1,i),multirotor.x(2,i),multirotor.x(3,i),matrix(1,2)/norm,matrix(2,2)/norm,matrix(3,2)/norm,'g',"LineWidth",1); 
    quiver3(multirotor.x(1,i),multirotor.x(2,i),multirotor.x(3,i),matrix(1,3)/norm,matrix(2,3)/norm,matrix(3,3)/norm,'b',"LineWidth",1); 
end

hold on;
grid on;
xlabel('x(m)'), ylabel('y(m)'), zlabel('z(m)')
axis equal





t_temp = t(:,1:20:iter);
ex_temp = multirotor.ex(:,1:20:iter);
ev_temp = multirotor.ev(:,1:20:iter);
eR_temp = multirotor.eR(:,1:20:iter);
eW_temp = multirotor.eW(:,1:20:iter);
mass_temp = multirotor.mass_estimation(:,1:20:iter);
cogx_temp = multirotor.inertia_estimation(1,1:20:iter);
cogy_temp = multirotor.inertia_estimation(2,1:20:iter);

figure;
tiledlayout(3,2)
nexttile

% Plot position 
plot(t,multirotor.x(1, 1:iter),LineWidth=3.0);
hold on
plot(t,tra(1, 1:iter),LineWidth=2.0);
title('Trajectory Tracking','FontSize',28,'Interpreter', 'latex')
legend('$x$','$x_d$','FontSize', 25,'Location', 'southeast', 'Interpreter', 'latex')
y = ylabel('$x (m)$', 'Interpreter', 'latex','FontSize', 30);
set(y, 'Units', 'Normalized', 'Position', [-0.08, 0.42])
xlim([0,sim_t])
ylim([-5,5])
grid on
nexttile

% Plot position tracking error
plot(t_temp,ex_temp(1, :),LineWidth=3.0)
title("Postion Errors(m)",'FontSize', 28,'Interpreter', 'latex');
grid on
y = ylabel('$e_{x_1}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 32);
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile

plot(t,multirotor.x(2, 1:iter),LineWidth=3.0)
hold on
plot(t,tra(2, 1:iter),LineWidth=2.0);
legend('$y$','$y_d$','FontSize', 25,'Location', 'northeast', 'Interpreter', 'latex')
y = ylabel('$y (m)$', 'Interpreter', 'latex','FontSize', 32);
set(y, 'Units', 'Normalized', 'Position', [-0.08, 0.42])
xlim([0,sim_t])
ylim([-5,5])
grid on
nexttile

plot(t_temp,ex_temp(2, :),LineWidth=3.0)
grid on
y = ylabel('$e_{x_2}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 32);
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile

plot(t,multirotor.x(3, 1:iter),LineWidth=3.0)
hold on
plot(t,tra(3, 1:iter),LineWidth=2.0);
legend('$z$','$z_d$','FontSize', 25,'Location', 'southeast', 'Interpreter', 'latex')
xlabel('$Time(s)$', 'Interpreter', 'latex','FontSize', 25);
y = ylabel('$z (m)$', 'Interpreter', 'latex','FontSize', 32);
set(y, 'Units', 'Normalized', 'Position', [-0.08, 0.42])
xlim([0,sim_t])
grid on
ylim([-0.5,1.5])
nexttile

plot(t_temp,ex_temp(3, :),LineWidth=3.0)
grid on
y = ylabel('$e_{x_3}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 32);
xlabel('$Time(s)$', 'Interpreter', 'latex','FontSize', 25);
set(y, 'Units', 'Normalized', 'Position', [-0.1, 0.42])
xlim([0,sim_t])
ylim([-1,1])




figure;
tiledlayout(3,1)
nexttile
% Plot position tracking error
plot(t_temp,ev_temp(1, :),LineWidth=3.0)
grid on
set(gca,'FontSize', 20);
title("Velocity Errors(m/s)",'FontSize', 32,'Interpreter', 'latex');
y = ylabel('$e_{v_1}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 36);
set(y, 'Units', 'Normalized', 'Position', [-0.08, 0.42])
xlim([0,sim_t])
ylim([-2,2])
nexttile
plot(t_temp,ev_temp(2, :),LineWidth=3.0)
set(gca,'FontSize', 18);
grid on
set(gca,'FontSize', 20);
y = ylabel('$e_{v_2}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 36);
set(y, 'Units', 'Normalized', 'Position', [-0.08, 0.42])
xlim([0,sim_t])
ylim([-2,2])
nexttile
plot(t_temp,ev_temp(3, :),LineWidth=3.0)
set(gca,'FontSize', 18);
grid on
set(gca,'FontSize', 20);
y = ylabel('$e_{v_3}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 36);
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 27);
set(y, 'Units', 'Normalized', 'Position', [-0.08, 0.42])
xlim([0,sim_t])
ylim([-2,2])



figure;
tiledlayout(3,1)
nexttile
% Plot position tracking error
plot(t_temp,eR_temp(1, :),LineWidth=3.0)
title("Rotation Errors(rad)",'FontSize', 28,'Interpreter', 'latex');
grid on
y = ylabel('$e_{R_1}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 36);
set(y, 'Units', 'Normalized', 'Position', [-0.08, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile
plot(t_temp,eR_temp(2, :),LineWidth=3.0)
grid on
y = ylabel('$e_{R_2}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 36);
set(y, 'Units', 'Normalized', 'Position', [-0.08, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile
plot(t_temp,eR_temp(3, :),LineWidth=3.0)
grid on
y = ylabel('$e_{R_3}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 36);
xlabel('$Time(s)$', 'Interpreter', 'latex','FontSize', 27);
set(y, 'Units', 'Normalized', 'Position', [-0.08, 0.42])
xlim([0,sim_t])
ylim([-1,1])




figure;
tiledlayout(3,1)
nexttile
% Plot position tracking error
plot(t_temp,eW_temp(1, :),LineWidth=3.0)
title("Angular Velocity Errors (rad/s)",'FontSize', 28,'Interpreter', 'latex');
grid on
y = ylabel('$e_{\Omega_1}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 32);
set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile
plot(t_temp,ex_temp(2, :),LineWidth=3.0)
grid on
y = ylabel('$e_{\Omega_2}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 32);
set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile
plot(t_temp,ex_temp(3, :),LineWidth=3.0)
grid on
y = ylabel('$e_{\Omega_3}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 32);
xlabel('$Time(s)$', 'Interpreter', 'latex','FontSize', 27);
set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.42])
xlim([0,sim_t])
ylim([-1,1])



figure;
tiledlayout(3,1)
nexttile
% Plot necessary
Cog_x = 0.048;
Cog_y = 0.012;
plot(t_temp,mass_temp(1,:),t_temp,ones(1,numel(t_temp))*8.6,LineWidth=3.0)
title('Mass Estimation','FontSize',28,'Interpreter', 'latex')
legend('$\hat{\theta}_m$','$\theta_m$','FontSize', 28,'Location', 'southeast', 'Interpreter', 'latex','NumColumns',2)
y = ylabel('$\hat{\theta}_m (kg)$','Interpreter', 'latex','FontSize', 25);
set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
xlim([0,sim_t])
ylim([7,10])
nexttile
plot(t_temp, cogx_temp,t_temp,ones(1,numel(t_temp))*Cog_x,LineWidth=3.0)
title('CoG Estimation','FontSize',28,'Interpreter', 'latex')
legend('$\hat{\theta}_{CoG_x}$','$\theta_{CoG_x}$','FontSize', 28,'Location', 'southeast', 'Interpreter', 'latex','NumColumns',2)
y = ylabel('$\hat{\theta}_{CoG_x} (cm)$','Interpreter', 'latex','FontSize', 25);
set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
xlim([0,sim_t])
ylim([-0.1, 0.1])
nexttile
plot(t_temp, cogy_temp,t_temp,ones(1,numel(t_temp))*Cog_y,LineWidth=3.0)
legend('$\hat{\theta}_{CoG_y}$','$\theta_{CoG_y}$','FontSize', 28,'Location', 'southeast', 'Interpreter', 'latex','NumColumns',2)
y = ylabel('$\hat{\theta}_{CoG_y} (cm)$','Interpreter', 'latex','FontSize', 25);
set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
xlabel('$Time(s)$', 'Interpreter', 'latex','FontSize', 27);
xlim([0,sim_t])
ylim([-0.08, 0.08])


figure;
tiledlayout(2,1)
nexttile
% Plot necessary
theta_m_ground_truth = ones(1, length(t))*8.6;
Cog_x = 0.048;
Cog_y = 0.012;
plot(t_temp,mass_temp-8.61,LineWidth=3.0)
title("Estimation Error",'FontSize', 30,'Interpreter', 'latex');
legend('$||\tilde{\theta}_m||$','FontSize', 28,'Interpreter', 'latex');
y = ylabel('$||\tilde{\theta}_m||(kg)$','Interpreter', 'latex','FontSize', 28);
set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
xlim([0,sim_t])
ylim([-0.6,1.2])

nexttile
temp_cog = ones(1,iter);
for i = 1:1:iter
    temp_cog(1,i) = 1*sqrt(multirotor.inertia_estimation(2,i)*multirotor.inertia_estimation(2,i) + multirotor.inertia_estimation(1,i)*multirotor.inertia_estimation(1,i));
end
plot(t_temp, -(cogx_temp-Cog_x)*100,t_temp, -(cogy_temp-Cog_y)*100,LineWidth=3.0)
legend("$||\tilde{\theta}_{CoG_x}||$","$||\tilde{\theta}_{CoG_y}||$", 'FontSize', 28,'Location', 'northeast','Interpreter', 'latex')
y = ylabel('$||\tilde{\theta}_{CoG}||(cm)$','Interpreter', 'latex','FontSize', 28);
set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
xlabel('$Time(s)$', 'Interpreter', 'latex','FontSize', 27);
xlim([0,sim_t])
ylim([-2, 6])


uav1_power = uav1.force_moment(1,1:1:iter).^1.5;
uav2_power = uav2.force_moment(1,1:1:iter).^1.5;
uav3_power = uav3.force_moment(1,1:1:iter).^1.5;
uav4_power = uav4.force_moment(1,1:1:iter).^1.5;

plot(t,uav1_power,t, uav2_power, t, uav3_power,t,  uav4_power, LineWidth=2.0)
legend('UAV1','UAV2','UAV3','UAV4','FontSize', 12, 'Interpreter', 'latex')
title("Power Consumption",'FontSize', 15, 'Interpreter', 'latex');

xlim([0,sim_t])

uav1_power = uav1.force_moment(1,1:20:iter).^1.5;
uav2_power = uav2.force_moment(1,1:20:iter).^1.5;
uav3_power = uav3.force_moment(1,1:20:iter).^1.5;
uav4_power = uav4.force_moment(1,1:20:iter).^1.5;


uav_power = [uav1_power; uav2_power; uav3_power ; uav4_power];


multirotor.tra = tra;
multirotor.uav1_power = uav1_power;
multirotor.uav2_power = uav2_power;
multirotor.uav3_power = uav3_power;
multirotor.uav4_power = uav4_power;
multirotor.t = t_temp;
multirotor_data = multirotor;
pos = multirotor.x(:, 1:20:iter);
save('optimized.mat', 'multirotor_data');


