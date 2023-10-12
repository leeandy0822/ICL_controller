close all;
clc;

data = readtable('data/0707 - Estimation.csv');
data = data(:, :);

current_position = data{:,1:3};
pos = data{:,4:6};
vel = data{:,7:9};
rot = data{:,10:12};
ang = data{:,13:15};

mass = data{:,16}
cog = data{:,17:18}
time = data{:,23};

time = time - 31;
time_stamp = 63.5;
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
bad_time = bad_time - 42.6;


num_start = 300;
num_end = 1320;
num_even_start = 350;
num_even_end = 1350;
figure
plot(current_position(num_start:num_end,1),current_position(num_start:num_end,2) ,'linewidth', 4, 'Color','b')
hold on
plot(current_position(num_start:num_end,1)-pos(num_start:num_end,2), current_position(num_start:num_end,2)-pos(num_start:num_end,1),'--','linewidth', 6, 'Color','k')
hold on
plot(bad_current_position(num_even_start:num_even_end,1),bad_current_position(num_even_start:num_even_end,2) ,'linewidth', 4, 'Color','r')
set(gca,'FontSize', 20);
title('Trajectory Tracking','Interpreter', 'latex','FontSize', 35)
y = ylabel('Y (m)', 'Interpreter', 'latex','FontSize', 34);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
x = xlabel('X (m)', 'Interpreter', 'latex','FontSize', 34);
legend('Even + CL Controller', 'Desired', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 30, 'Location', 'southeast')
ylim([-1 1])
xlim([-2 2])
grid on


start = 550;
end_point = 1319;

bad_start = 620;
bad_end_point = 1236;

optimized_start = 400;
optimized_end_point = 1500;

line_width = 3;
step = 3;



figure
subplot(311)
plot(time(1:step:end), current_position(1:step:end,1),'-','linewidth', line_width,'Color','b')
hold on
plot(time(1:step:end), current_position(1:step:end,1)-pos(1:step:end,2),'--','linewidth', line_width+1, 'Color','k')
hold on
plot(bad_time(1:step:end), bad_current_position(1:step:end,1),'-','linewidth', line_width, 'Color','r')
% hold on
% plot(bad_time(1:step:end), bad_current_position(1:step:end,1)-bad_pos(1:step:end,2),'-','linewidth', line_width, 'Color','g')
set(gca,'FontSize', 25);
title('Trajectory Tracking','Interpreter', 'latex','FontSize', 40)
ylim([-2.2 3.0])
xlim([0,time_stamp])
y = ylabel('X (m)', 'Interpreter', 'latex','FontSize', 35, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
grid on
subplot(312)
plot(time(1:step:end), current_position(1:step:end,2),'-','linewidth', line_width,'Color','b')
hold on
plot(time(1:step:end), current_position(1:step:end,2)-pos(1:step:end,1),'--','linewidth', line_width+1, 'Color','k')
hold on
plot(bad_time(1:step:end), bad_current_position(1:step:end,2),'-','linewidth', line_width, 'Color','r')
% hold on
% plot(bad_time(1:step:end), bad_current_position(1:step:end,2)-bad_pos(1:step:end,1),'-','linewidth', line_width, 'Color','g')
set(gca,'FontSize', 25);
ylim([-1.8 1.8])
xlim([0,time_stamp])
y = ylabel('Y (m)', 'Interpreter', 'latex','FontSize', 35, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
grid on
subplot(313)
plot(time(1:step:end), current_position(1:step:end,3),'-','linewidth', line_width,'Color','b')
hold on
plot(time(1:step:end), current_position(1:step:end,3)+pos(1:step:end,3),'--','linewidth', line_width+1, 'Color','k')
hold on
plot(bad_time(1:step:end), bad_current_position(1:step:end,3),'-','linewidth', line_width, 'Color','r')
% hold on
% plot(bad_time(1:step:end), bad_current_position(1:step:end,3)+bad_pos(1:step:end,3),'-','linewidth', line_width, 'Color','g')
set(gca,'FontSize', 25);
legend('Even + CL Controller', 'Desired', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 20, 'Location', 'southeast')
ylim([0.5 1.3])
xlim([0,time_stamp])
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
y = ylabel('Z (m)', 'Interpreter', 'latex','FontSize', 35, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
grid on



figure
subplot(311)
plot(time(1:step:end), pos(1:step:end,1),'linewidth', line_width, 'Color', 'b')
hold on
plot(bad_time(1:step:end), bad_pos(1:step:end,1),'linewidth', line_width, 'Color', 'r')
set(gca,'FontSize', 25);
title('Position Error','Interpreter', 'latex','FontSize', 40)
ylim([-1.2 1.2])
xlim([0,time_stamp])
ylabel('$ex_1$ (m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
grid on
subplot(312)
plot(time(1:step:end), pos(1:step:end,2),'linewidth', line_width, 'Color', 'b')
hold on
plot(bad_time(1:step:end), bad_pos(1:step:end,2),'linewidth', line_width, 'Color', 'r')
set(gca,'FontSize', 25);
ylim([-1.2 1.2])
xlim([0,time_stamp])
ylabel('$ex_2$ (m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
grid on
subplot(313)
plot(time(1:step:end), pos(1:step:end,3),'linewidth', line_width, 'Color', 'b')
hold on
plot(bad_time(1:step:end), bad_pos(1:step:end,3),'linewidth', line_width, 'Color', 'r')
set(gca,'FontSize', 25);
ylim([-0.5 0.12])
xlim([0,time_stamp])
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
ylabel('$ex_3$ (m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
legend('Even + CL Controller', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
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



step = 3; 
figure
subplot(311)
plot(time(1:step:end), rot(1:step:end,1),'linewidth', 3 ,'Color', 'b')
hold on
plot(bad_time(1:step:end), bad_rot(1:step:end,1),'linewidth', 3, 'Color', 'r')
set(gca,'FontSize', 25);
title('Rotation Error','Interpreter', 'latex','FontSize', 40)
ylim([-45 45])
xlim([0,time_stamp])
ylabel('$eR_1$ (degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
grid on
subplot(312)
plot(time(1:step:end), rot(1:step:end,2),'linewidth', 3 ,'Color', 'b')
hold on
plot(bad_time(1:step:end), bad_rot(1:step:end,2),'linewidth', 3, 'Color', 'r')
set(gca,'FontSize', 25);
ylim([-45 45])
xlim([0,time_stamp])
ylabel('$eR_2$ (degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
grid on
subplot(313)
plot(time(1:step:end), rot(1:step:end,3),'linewidth', 3 ,'Color', 'b')
hold on
plot(bad_time(1:step:end), bad_rot(1:step:end,3),'linewidth', 3, 'Color', 'r')
set(gca,'FontSize', 25);
ylim([-95 95])
xlim([0,time_stamp])
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
ylabel('$eR_3$ (degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
legend('Even + CL Controller', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
grid on

time = time + 8.0;
time_stamp = 73;
step =3; 

figure
subplot(311)
plot(time(1:step:end)-1.3, mass(1:step:end),'linewidth', 3, 'color', 'r')
set(gca,'FontSize', 25);
title('Estimation of Mass and CoG','Interpreter', 'latex','FontSize', 35)
yline(3.61, "--", 'color', 'k', 'linewidth', 5);
ylim([2.5 5])
xlim([0,time_stamp])
y = ylabel('Mass(kg)', 'Interpreter', 'latex','FontSize', 34, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42]);
legend('$\hat{\theta}_{m}$', '$\theta_{m}$', 'Interpreter', 'latex','FontSize', 30, 'Location', 'southeast','NumColumns',2)
grid on
subplot(312)
plot(time(1:4:end)+0.5, cog(1:4:end,1)*100,'linewidth', 3, 'color', 'r')
set(gca,'FontSize', 25);
yline(0, "--", 'color', 'k', 'linewidth', 5);
ylim([-8 8])
xlim([0,time_stamp])
y = ylabel('$CoG_x$(cm)', 'Interpreter', 'latex','FontSize', 34, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42]);
legend('$\hat{\theta}_{cog_x}$', '$\theta_{cog_x}$', 'Interpreter', 'latex','FontSize', 30, 'Location', 'southeast','NumColumns',2)
grid on
subplot(313)
plot(time(1:step:end), cog(1:step:end,2)*100,'linewidth', 3, 'color', 'r')
set(gca,'FontSize', 25);
yline(4.5, "--", 'color', 'k', 'linewidth', 5);
ylim([-5 10])
xlim([0,time_stamp])
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
y = ylabel('$CoG_y$(cm)', 'Interpreter', 'latex','FontSize', 34, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
legend('$\hat{\theta}_{cog_y}$', '$\theta_{cog_y}$', 'Interpreter', 'latex','FontSize', 30, 'Location', 'southeast','NumColumns',2)
grid on
