close all;
clc;

data = readtable('0707 - EMK.csv');
data = data(:, :);

current_position = data{:,1:3};
pos = data{:,4:6};
vel = data{:,7:9};
rot = data{:,10:12};
ang = data{:,13:15};

mass = data{:,16}
cog = data{:,17:18}
time = data{:,23};

time = time - 28;
time_stamp = 78;
mass_error = (mass - 2.6)/2.6;
cog_x_error = (cog(:,1)*100 - 0);
cog_y_error = (cog(:,2)*100 - 6)/6;


data = readtable('0707 - EMK.csv');
data = data(:, :);
bad_current_position = data{:,1:3};
bad_current_position(:,:) = bad_current_position(:,:) + [0.01 -0.013, -0.004];
bad_pos = data{:,4:6};
bad_vel = data{:,7:9};
bad_rot = data{:,10:12};
bad_ang = data{:,13:15};
bad_mass = data{:,16};
bad_cog = data{:,17:18};
bad_time = data{:,23};
bad_time = bad_time - 21;




figure
subplot(311)
plot(time, mass,'linewidth', 4)
set(gca,'FontSize', 20);
title('Estimation of Mass and CoG','Interpreter', 'latex','FontSize', 35)
yline(3.61, "--", 'color', 'r', 'linewidth', 5);
ylim([3 5])
xlim([0,time_stamp])
y = ylabel('$Mass(kg)$', 'Interpreter', 'latex','FontSize', 34, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42]);
legend('$\hat{\theta}_{m}$', '$\theta_{m}$', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast','NumColumns',2)
grid on
subplot(312)
plot(time, cog(:,1)*100,'linewidth', 4)
set(gca,'FontSize', 20);
yline(0, "--", 'color', 'r', 'linewidth', 5);
ylim([-7 7])
xlim([0,time_stamp])
y = ylabel('$CoG_x(cm)$', 'Interpreter', 'latex','FontSize', 34, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42]);
legend('$\hat{\theta}_{cog_x}$', '$\theta_{cog_x}$', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast','NumColumns',2)
grid on
subplot(313)
plot(time, cog(:,2)*100,'linewidth', 4)
set(gca,'FontSize', 20);
yline(4.5, "--", 'color', 'r', 'linewidth', 5);
ylim([-6 10])
xlim([0,time_stamp])
xlabel('$Time(s)$', 'Interpreter', 'latex','FontSize', 32);
y = ylabel('$CoG_y(cm)$', 'Interpreter', 'latex','FontSize', 34, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
legend('$\hat{\theta}_{cog_y}$', '$\theta_{cog_y}$', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast','NumColumns',2)
grid on


% num_start = 250;
% num_end = 1400;
% num_even_start = 300;
% num_even_end = 1400;
% figure
% plot(current_position(num_start:num_end,1),current_position(num_start:num_end,2) ,'linewidth', 5)
% hold on
% plot(bad_current_position(num_even_start:num_even_end,1),bad_current_position(num_even_start:num_even_end,2) ,'linewidth', 5)
% hold on
% plot(current_position(num_start:num_end,1)-pos(num_start:num_end,2), current_position(num_start:num_end,2)-pos(num_start:num_end,1),'--','linewidth', 5)
% set(gca,'FontSize', 20);
% title('Estimation of Mass and CoG','Interpreter', 'latex','FontSize', 35)
% y = ylabel('$Y[m]$', 'Interpreter', 'latex','FontSize', 34);
% set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
% x = xlabel('$X[m]$', 'Interpreter', 'latex','FontSize', 34);
% legend('CL Controller', 'Geometric Controller','$x_d$', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast','NumColumns',2)
% grid on




figure
subplot(311)
plot(time, current_position(:,1),'-',time, current_position(:,1)-pos(:,2),'--','linewidth', 4)
hold on
set(gca,'FontSize', 25);
title('Even Formation w/o CL Controller','Interpreter', 'latex','FontSize', 45)
legend('Current', 'Desire', 'Without','Interpreter', 'latex','FontSize', 22)
ylim([-1.5 2.5])
xlim([0,time_stamp])
y = ylabel('X(m)', 'Interpreter', 'latex','FontSize', 40, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
grid on
subplot(312)
plot(time, current_position(:,2),'-',time, current_position(:,2)-pos(:,1),'--','linewidth', 4)
set(gca,'FontSize', 25);
legend('Current', 'Desire', 'Interpreter', 'latex','FontSize', 22)
ylim([-1.5 0.9])
xlim([0,time_stamp])
y = ylabel('Y(m)', 'Interpreter', 'latex','FontSize', 40, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
grid on
subplot(313)
plot(time, current_position(:,3),'-',time, current_position(:,3)+pos(:,3),'--','linewidth', 4)
set(gca,'FontSize', 25);
legend('Current', 'Desire', 'Interpreter', 'latex','FontSize', 22)
ylim([-0.5 1.5])
xlim([0,time_stamp])
xlabel('Time(s)', 'Interpreter', 'latex','FontSize', 42);
y = ylabel('Z(m)', 'Interpreter', 'latex','FontSize', 40, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
grid on


figure
subplot(311)
plot(time, pos(:,1),'linewidth', 3)
set(gca,'FontSize', 25);
title('Even Formation w/o CL Controller','Interpreter', 'latex','FontSize', 45)
ylim([-1 1])
xlim([0,time_stamp])
ylabel('$ex_x$(m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
grid on
subplot(312)
plot(time, pos(:,2),'linewidth', 3)
set(gca,'FontSize', 25);
ylim([-0.5 1.5])
xlim([0,time_stamp])
ylabel('$ex_y$(m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
grid on
subplot(313)
plot(time, pos(:,3),'linewidth', 3)
set(gca,'FontSize', 25);
ylim([-1 1])
xlim([0,time_stamp])
xlabel('Time(s)', 'Interpreter', 'latex','FontSize', 42);
ylabel('$ex_z$(m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
grid on


figure
subplot(311)
plot(time, vel(:,1),'linewidth', 3)
set(gca,'FontSize', 25);
title('Even Formation w/o CL Controller','Interpreter', 'latex','FontSize', 45)
ylim([-1 1])
xlim([0,time_stamp])
ylabel('$ev_x$(m/s)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
grid on
subplot(312)
plot(time, vel(:,2),'linewidth', 3)
set(gca,'FontSize', 25);
ylim([-1 1])
xlim([0,time_stamp])
ylabel('$ev_y$(m/s)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
grid on
subplot(313)
plot(time, vel(:,3),'linewidth', 3)
set(gca,'FontSize', 25);
ylim([-1 1])
xlim([0,time_stamp])
xlabel('Time(s)', 'Interpreter', 'latex','FontSize', 42);
ylabel('$ev_z$(m/s)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
grid on




figure
subplot(311)
plot(time(1:4:end), rot(1:4:end,1),'linewidth', 3)
set(gca,'FontSize', 25);
title('Even Formation w/o CL Controller','Interpreter', 'latex','FontSize', 45)
ylim([-45 45])
xlim([0,time_stamp])
ylabel('$eR_x$(degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
grid on
subplot(312)
plot(time(1:4:end), rot(1:4:end,2),'linewidth', 3)
set(gca,'FontSize', 25);
ylim([-45 45])
xlim([0,time_stamp])
ylabel('$eR_y$(degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
grid on
subplot(313)
plot(time(1:4:end), rot(1:4:end,3),'linewidth', 3)
set(gca,'FontSize', 25);
ylim([-45 45])
xlim([0,time_stamp])
xlabel('Time(s)', 'Interpreter', 'latex','FontSize', 42);
ylabel('$eR_z$(degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
grid on


