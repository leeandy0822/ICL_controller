close all;
clc;

data = readtable('data/0707 - Optimize.csv');
data = data(:, :);

current_position = data{:,1:3};
pos = data{:,4:6} ;
vel = data{:,7:9};
rot = data{:,10:12};
ang = data{:,13:15};

mass = data{:,16}
cog = data{:,17:18}
time = data{:,23};

time = time - 32;
time_stamp = 63;
mass_error = (mass - 2.6)/2.6;
cog_x_error = (cog(:,1)*100 - 0);
cog_y_error = (cog(:,2)*100 - 6)/6;


data = readtable('data/0707 - EMK.csv');
data = data(:, :);
bad_current_position = data{:,1:3};
bad_current_position(:,:) = bad_current_position(:,:)  + [-0.01 0.06, 0.085];
bad_pos = data{:,4:6};
bad_vel = data{:,7:9};
bad_rot = data{:,10:12};
bad_ang = data{:,13:15};
bad_mass = data{:,16};
bad_cog = data{:,17:18};
bad_time = data{:,23};
bad_time = bad_time - 39;


data = readtable('data/0707 - Estimation.csv');
data = data(:, :);
est_current_position = data{:,1:3};
est_current_position(:,:) = est_current_position(:,:) + [0.01 -0.013, -0.004];
est_pos = data{:,4:6};
est_vel = data{:,7:9};
est_rot = data{:,10:12};
est_ang = data{:,13:15};
est_mass = data{:,16};
est_cog = data{:,17:18};
est_time = data{:,23};
est_time = est_time - 21;


data = readtable('power.csv');
data = data(:, :);
UAV_even = data{2:end,5:6};
UAV_optimal = data{2:end,12:13};

num_start = 300;
num_end = 1320;
num_even_start = 350;
num_even_end = 1350;



figure
plot(est_current_position(num_even_start:num_even_end,1),est_current_position(num_even_start:num_even_end,2) ,'linewidth', 4, 'Color','b')
hold on
plot(current_position(num_start:num_end,1),current_position(num_start:num_end,2) ,'linewidth', 4, 'Color','g')
hold on
plot(bad_current_position(num_even_start:num_even_end,1),bad_current_position(num_even_start:num_even_end,2) ,'linewidth', 4, 'Color','r')
hold on
plot(current_position(num_start:num_end,1)-pos(num_start:num_end,2), current_position(num_start:num_end,2)-pos(num_start:num_end,1),'--','linewidth', 5, 'Color','k')
hold on
set(gca,'FontSize', 20);
title('Trajectory Tracking','Interpreter', 'latex','FontSize', 35)
y = ylabel('Y (m)', 'Interpreter', 'latex','FontSize', 34);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
x = xlabel('X (m)', 'Interpreter', 'latex','FontSize', 34);
legend('Even + CL Controller', 'Optimized + CL Controller','Even + Geometric Controller','Desired',  'Interpreter', 'latex','FontSize', 26, 'Location', 'southeast','NumColumns',2)
ylim([-1 1])
xlim([-2 2])
grid on


start = 550;
end_point = 1319;

bad_start = 620;
bad_end_point = 1236;

optimized_start = 400;
optimized_end_point = 1500;

fprintf("Norm \n")
fprintf("Even + CL\n")
sqrt(mean(est_pos(start:1:end_point,1).^2))
sqrt(mean(est_pos(start:1:end_point,2).^2))
sqrt(mean(est_pos(start:1:end_point,3).^2))
% sqrt(mean(est_vel(start:1:end_point,1).^2))
% sqrt(mean(est_vel(start:1:end_point,2).^2))
% sqrt(mean(est_vel(start:1:end_point,3).^2))
sqrt(mean(est_rot(start:1:end_point,1).^2))
sqrt(mean(est_rot(start:1:end_point,2).^2))
sqrt(mean(est_rot(start:1:end_point,3).^2))

fprintf("Even + Geometric \n")
sqrt(mean(bad_pos(bad_start:1:bad_end_point,1).^2))
sqrt(mean(bad_pos(bad_start:1:bad_end_point,2).^2))
sqrt(mean(bad_pos(bad_start:1:bad_end_point,3).^2))
% sqrt(mean(bad_vel(bad_start:1:bad_end_point,1).^2))
% sqrt(mean(bad_vel(bad_start:1:bad_end_point,2).^2))
% sqrt(mean(bad_vel(bad_start:1:bad_end_point,3).^2))
sqrt(mean(bad_rot(bad_start:1:bad_end_point,1).^2))
sqrt(mean(bad_rot(bad_start:1:bad_end_point,2).^2))
sqrt(mean(bad_rot(bad_start:1:bad_end_point,3).^2))

fprintf("Optimized + CLn")
sqrt(mean(pos(optimized_start:1:optimized_end_point,1).^2))
sqrt(mean(pos(optimized_start:1:optimized_end_point,2).^2))
sqrt(mean(pos(optimized_start:1:optimized_end_point,3).^2))
% sqrt(mean(vel(bad_start:1:bad_end_point,1).^2))
% sqrt(mean(vel(bad_start:1:bad_end_point,2).^2))
% sqrt(mean(vel(bad_start:1:bad_end_point,3).^2))
sqrt(mean(rot(optimized_start:1:optimized_end_point,1).^2))
sqrt(mean(rot(optimized_start:1:optimized_end_point,2).^2))
sqrt(mean(rot(optimized_start:1:optimized_end_point,3).^2))



line_width = 3;
step = 4;



figure
subplot(311)
plot(time(1:step:end), pos(1:step:end,1),'linewidth', line_width)
hold on
plot(bad_time(1:step:end), bad_pos(1:step:end,1),'linewidth', line_width, 'Color', 'r')
set(gca,'FontSize', 25);
title('Position Error','Interpreter', 'latex','FontSize', 40)
ylim([-1.8 1.8])
xlim([0,time_stamp])
ylabel('$ex_1$ (m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
grid on
subplot(312)
plot(time(1:step:end), pos(1:step:end,2),'linewidth', line_width)
hold on
plot(bad_time(1:step:end), bad_pos(1:step:end,2),'linewidth', line_width, 'Color', '#EDB120')
set(gca,'FontSize', 25);
ylim([-1.8 1.8])
xlim([0,time_stamp])
ylabel('$ex_2$ (m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
grid on
subplot(313)
plot(time(1:step:end), pos(1:step:end,3),'linewidth', line_width)
hold on
plot(bad_time(1:step:end), bad_pos(1:step:end,3),'linewidth', line_width, 'Color', '#EDB120')
set(gca,'FontSize', 25);
ylim([-0.8 0.2])
xlim([0,time_stamp])
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
ylabel('$ex_3$ (m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
legend('Optimized + CL Controller', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
grid on



% figure
% subplot(311)
% plot(time, vel(:,1),'linewidth', 4)
% hold on
% plot(bad_time, bad_vel(:,1),'linewidth', 4, 'Color', '#EDB120')
% set(gca,'FontSize', 25);
% title('Velocity Error','Interpreter', 'latex','FontSize', 40)
% ylim([-1.5 1.5])
% xlim([0,time_stamp])
% ylabel('$ev_1$ (m/s)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
% grid on
% subplot(312)
% plot(time, vel(:,2),'linewidth', 4)
% hold on
% plot(bad_time, bad_vel(:,2),'linewidth',4, 'Color', '#EDB120')
% set(gca,'FontSize', 25);
% ylim([-1.5 1.5])
% xlim([0,time_stamp])
% ylabel('$ev_2$ (m/s)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
% grid on
% subplot(313)
% plot(time, vel(:,3),'linewidth', 4)
% hold on
% plot(bad_time, bad_vel(:,3),'linewidth', 4, 'Color', '#EDB120')
% set(gca,'FontSize', 25);
% ylim([-1.5 1.5])
% xlim([0,time_stamp])
% xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
% ylabel('$ev_3$ (m/s)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
% legend('Optimized + CL Controller', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
% grid on
% 
% 


figure
subplot(311)
plot(time(1:2:end), rot(1:2:end,1),'linewidth', 4)
hold on
plot(bad_time(1:2:end), bad_rot(1:2:end,1),'linewidth', 4, 'Color', '#EDB120')
set(gca,'FontSize', 25);
title('Rotation Error','Interpreter', 'latex','FontSize', 40)
ylim([-45 45])
xlim([0,time_stamp])
ylabel('$eR_1$ (degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
grid on
subplot(312)
plot(time(1:2:end), rot(1:2:end,2),'linewidth', 4)
hold on
plot(bad_time(1:2:end), bad_rot(1:2:end,2),'linewidth', 4, 'Color', '#EDB120')
set(gca,'FontSize', 25);
ylim([-45 45])
xlim([0,time_stamp])
ylabel('$eR_2$ (degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
grid on
subplot(313)
plot(time(1:2:end), rot(1:2:end,3),'linewidth', 4)
hold on
plot(bad_time(1:2:end), bad_rot(1:2:end,3),'linewidth', 4, 'Color', '#EDB120')
set(gca,'FontSize', 25);
ylim([-90 90])
xlim([0,time_stamp])
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
ylabel('$eR_3$ (degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
legend('Even + CL Controller', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast','NumColumns',2)
grid on



figure
subplot(211)
energy_time = 0:0.5:110*0.5-1;
energy_time = energy_time + 10;
plot(energy_time, UAV_even(:,2),energy_time, UAV_even(:,1),'linewidth', 3)
set(gca,'FontSize', 25);
title('Power Consumption','Interpreter', 'latex','FontSize', 36)
ylim([150 350])
xlim([10,time_stamp])
ylabel('Power (Watt)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
legend('Even UAV1', 'Even UAV2', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
grid on
subplot(212)
plot(energy_time, UAV_optimal(:,2),energy_time, UAV_optimal(:,1),'linewidth', 3)
set(gca,'FontSize', 25);
ylim([150 350])
xlim([10,time_stamp])
ylabel('Power (Watt)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
legend('Optimized UAV1', 'Optimized UAV2', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
grid on
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);

