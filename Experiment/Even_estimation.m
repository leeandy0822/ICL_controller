
close all;
clc;


data = readtable('0707 - EMK.csv');
data = data(:, :);
bad_current_position = data{:,1:3};
bad_current_position(:,:) = bad_current_position(:,:) + [0.1 0.06, 0.12];
bad_pos = data{:,4:6};
bad_vel = data{:,7:9};
bad_rot = data{:,10:12};
bad_ang = data{:,13:15};
bad_mass = data{:,16};
bad_cog = data{:,17:18};
bad_time = data{:,23};
bad_time = bad_time - 40;


data = readtable('0707 - Estimation.csv');
data = data(:, :);
current_position = data{:,1:3};
current_position(:,:) = current_position(:,:) + [0.01 -0.013, -0.004];
pos = data{:,4:6};
vel = data{:,7:9};
rot = data{:,10:12};
ang = data{:,13:15};
est_mass = data{:,16};
est_cog = data{:,17:18};
est_time = data{:,23};
est_time = est_time - 21;


data = readtable('power.csv');
data = data(:, :);
UAV_even = data{2:end,5:6};
UAV_optimal = data{2:end,12:13};

num_start = 270;
num_end = 1270;
num_even_start = 350;
num_even_end = 1350;
figure
plot(current_position(num_start:num_end,1),current_position(num_start:num_end,2) ,'linewidth', 4.0)
hold on
plot(current_position(num_start:num_end,1)-pos(num_start:num_end,2), current_position(num_start:num_end,2)-pos(num_start:num_end,1),'--','linewidth', 6)
hold on
plot(bad_current_position(num_even_start:num_even_end,1),bad_current_position(num_even_start:num_even_end,2) ,'linewidth', 4.0)
set(gca,'FontSize', 20);
title('Trajectory Tracking','Interpreter', 'latex','FontSize', 35)
y = ylabel('Y (m)', 'Interpreter', 'latex','FontSize', 34);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
x = xlabel('X (m)', 'Interpreter', 'latex','FontSize', 34);
legend('Even + CL Controller', 'Desired', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 30, 'Location', 'southeast')
ylim([-1 1])
xlim([-2 2])
grid on


figure
subplot(311)
plot(time, current_position(:,1),'-',time, current_position(:,1)-pos(:,2),'--','linewidth', 3.0)
hold on
plot(bad_time, bad_current_position(:,1),'-','linewidth', 3.0)
hold on
set(gca,'FontSize', 25);
title('Trajectory Tracking','Interpreter', 'latex','FontSize', 40)
ylim([-1.5 2.5])
xlim([0,time_stamp])
y = ylabel('X (m)', 'Interpreter', 'latex','FontSize', 35, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
grid on
subplot(312)
plot(time, current_position(:,2),'-',time, current_position(:,2)-pos(:,1),'--','linewidth', 3.0)
hold on
plot(bad_time, bad_current_position(:,2),'-','linewidth',3.0)
set(gca,'FontSize', 25);
ylim([-1.5 1.5])
xlim([0,time_stamp])
y = ylabel('Y (m)', 'Interpreter', 'latex','FontSize', 35, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
grid on
subplot(313)
plot(time, current_position(:,3),'-',time, current_position(:,3)+pos(:,3),'--','linewidth', 3.0)
hold on
plot(bad_time, bad_current_position(:,3),'-','linewidth', 3.0)
set(gca,'FontSize', 25);
legend('Even + CL Controller', 'Desired', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
ylim([0.2 1.8])
xlim([0,time_stamp])
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
y = ylabel('Z (m)', 'Interpreter', 'latex','FontSize', 35, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
grid on


figure
subplot(311)
plot(time, pos(:,1),'linewidth', 3.0)
hold on
plot(bad_time, bad_pos(:,1),'linewidth', 3.0, 'Color', '#EDB120')
set(gca,'FontSize', 25);
title('Position Error','Interpreter', 'latex','FontSize', 40)
ylim([-1.5 1.5])
xlim([0,time_stamp])
ylabel('$ex_1$ (m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
grid on
subplot(312)
plot(time, pos(:,2),'linewidth', 3.0)
hold on
plot(bad_time, bad_pos(:,2),'linewidth', 3.0, 'Color', '#EDB120')
set(gca,'FontSize', 25);
ylim([-1.5 1.5])
xlim([0,time_stamp])
ylabel('$ex_2$ (m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
grid on
subplot(313)
plot(time, pos(:,3),'linewidth', 3.0)
hold on
plot(bad_time, bad_pos(:,3),'linewidth', 3.0, 'Color', '#EDB120')
set(gca,'FontSize', 25);
ylim([-0.5 0.5])
xlim([0,time_stamp])
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
ylabel('$ex_3$ (m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
legend('Even + CL Controller', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
grid on


figure
subplot(311)
plot(time, vel(:,1),'linewidth', 3.0)
hold on
plot(bad_time, bad_vel(:,1),'linewidth', 3.0, 'Color', '#EDB120')
set(gca,'FontSize', 25);
title('Velocity Error','Interpreter', 'latex','FontSize', 40)
ylim([-1.5 1.5])
xlim([0,time_stamp])
ylabel('$ev_1$ (m/s)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
grid on
subplot(312)
plot(time, vel(:,2),'linewidth', 3.0)
hold on
plot(bad_time, bad_vel(:,2),'linewidth',3.0, 'Color', '#EDB120')
set(gca,'FontSize', 25);
ylim([-1.5 1.5])
xlim([0,time_stamp])
ylabel('$ev_2$ (m/s)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
grid on
subplot(313)
plot(time, vel(:,3),'linewidth', 3.0)
hold on
plot(bad_time, bad_vel(:,3),'linewidth', 3.0, 'Color', '#EDB120')
set(gca,'FontSize', 25);
ylim([-1.5 1.5])
xlim([0,time_stamp])
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
ylabel('$ev_3$ (m/s)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
legend('Even + CL Controller', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
grid on




figure
subplot(311)
plot(time, rot(:,1),'linewidth', 4)
hold on
plot(bad_time, bad_rot(:,1),'linewidth', 3.0, 'Color', '#EDB120')
set(gca,'FontSize', 25);
title('Rotation Error','Interpreter', 'latex','FontSize', 40)
ylim([-60 60])
xlim([0,time_stamp])
ylabel('$eR_1$ (degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
grid on
subplot(312)
plot(time, rot(:,2),'linewidth', 4)
hold on
plot(bad_time, bad_rot(:,2),'linewidth', 3.0, 'Color', '#EDB120')
set(gca,'FontSize', 25);
ylim([-60 60])
xlim([0,time_stamp])
ylabel('$eR_2$ (degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
grid on
subplot(313)
plot(time, rot(:,3),'linewidth', 4)
hold on
plot(bad_time, bad_rot(:,3),'linewidth', 3.0, 'Color', '#EDB120')
set(gca,'FontSize', 25);
ylim([-60 60])
xlim([0,time_stamp])
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
ylabel('$eR_3$ (degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
legend('Even + CL Controller', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
grid on

data = readtable('0707 - Estimation.csv');
data = data(:, :);
time = data{:,23};
time = time - 24;
time_stamp = 75;
figure
subplot(311)
plot(time(1:5:end), mass(1:5:end),'linewidth', 2.0)
set(gca,'FontSize', 20);
title('Estimation of Mass and CoG','Interpreter', 'latex','FontSize', 35)
yline(3.61, "--", 'color', 'r', 'linewidth',3);
ylim([2 5])
xlim([0,time_stamp])
y = ylabel('Mass (kg)', 'Interpreter', 'latex','FontSize', 34, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42]);
legend('$\hat{\theta}_{m}$', '$\theta_{m}$', 'Interpreter', 'latex','FontSize', 34, 'Location', 'southeast','NumColumns',2)
grid on
subplot(312)
plot(time(1:4:end), cog(1:4:end,1)*90,'linewidth', 2.0)
set(gca,'FontSize', 20);
yline(0, "--", 'color', 'r', 'linewidth',3);
ylim([-10 10])
xlim([0,time_stamp])
y = ylabel('$CoG_x$ (cm)', 'Interpreter', 'latex','FontSize', 34, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42]);
legend('$\hat{\theta}_{CoG_x}$', '$\theta_{CoG_x}$', 'Interpreter', 'latex','FontSize', 34, 'Location', 'southeast','NumColumns',2)
grid on
subplot(313)
plot(time(1:4:end), cog(1:4:end,2)*100,'linewidth', 2.0)
set(gca,'FontSize', 20);
yline(4.8, "--", 'color', 'r', 'linewidth', 3);
ylim([-8 12])
xlim([0,time_stamp])
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
y = ylabel('$CoG_y$ (cm)', 'Interpreter', 'latex','FontSize', 34, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
legend('$\hat{\theta}_{CoG_y}$', '$\theta_{CoG_y}$', 'Interpreter', 'latex','FontSize', 34, 'Location', 'southeast','NumColumns',2)
grid on


