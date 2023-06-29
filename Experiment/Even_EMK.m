close all;
clc;

data = readtable('0627 - Even_EMK.csv');
data = data(:, :);

current_position = data{:,1:3};
pos = data{:,4:6};
vel = data{:,7:9};
rot = data{:,10:12};
ang = data{:,13:15};

mass = data{:,16}
cog = data{:,17:18}
time = data{:,23};

time = time - 46;
time_stamp = 55;
mass_error = (mass - 2.6)/2.6;
cog_x_error = (cog(:,1)*100 - 0);
cog_y_error = (cog(:,2)*100 - 6)/6;


figure
subplot(311)
plot(time, mass,'linewidth', 3)
set(gca,'FontSize', 15);
title('$Estimated\,Mass$','Interpreter', 'latex','FontSize', 20)
yline(3.7, "--", 'color', 'r', 'linewidth', 3);
ylim([2 5])
xlim([0,time_stamp])
xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 20);
ylabel('$mass(kg)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
legend('$\hat{\theta}_{m}$', '$\theta_{m}$', 'Interpreter', 'latex','FontSize', 20)
grid on
subplot(312)
plot(time, cog(:,1)*100,'linewidth', 3)
set(gca,'FontSize', 15);
title('$Estimation\,CoG$','Interpreter', 'latex','FontSize', 20)
yline(0, "--", 'color', 'r', 'linewidth', 3);
ylim([-1 1])
xlim([0,time_stamp])
ylabel('$CoG_x(cm)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
legend('$\hat{\theta}_{cog_x}$', '$\theta_{m}$', 'Interpreter', 'latex','FontSize', 20)
grid on
subplot(313)
plot(time, cog(:,2)*100,'linewidth', 3)
set(gca,'FontSize', 15);
yline(4.5, "--", 'color', 'r', 'linewidth', 3);
ylim([-1 6])
xlim([0,time_stamp])
xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 20);
ylabel('$CoG_y(cm)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
legend('$\hat{\theta}_{cog_y}$', '$\theta_{m}$', 'Interpreter', 'latex','FontSize', 20)
grid on





figure
subplot(311)
plot(time, current_position(:,1),time, current_position(:,1)+pos(:,1),"--",'linewidth', 3)
set(gca,'FontSize', 20);
title('$ Trajectory $','Interpreter', 'latex','FontSize', 25)
legend('$Current$', '$Desire$', 'Interpreter', 'latex','FontSize', 15)
ylim([-2 2])
xlim([0,time_stamp])
ylabel('$X(m)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
grid on
subplot(312)
plot(time, current_position(:,2),time, current_position(:,2)+pos(:,2),"--",'linewidth', 3)
set(gca,'FontSize', 20);
legend('$Current$', '$Desire$', 'Interpreter', 'latex','FontSize', 15)
ylim([-2 2])
xlim([0,time_stamp])
ylabel('$Y(m)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
grid on
subplot(313)
plot(time, current_position(:,3),time, current_position(:,3)+pos(:,3),"--",'linewidth', 3)
set(gca,'FontSize', 20);
legend('$Current$', '$Desire$', 'Interpreter', 'latex','FontSize', 15)
ylim([-1 3])
xlim([0,time_stamp])
xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 20);
ylabel('$Z(m)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
grid on


figure
subplot(311)
plot(time, pos(:,1),'linewidth', 3)
set(gca,'FontSize', 20);
title('$Position\,Error$','Interpreter', 'latex','FontSize', 25)
ylim([-1 1])
xlim([0,time_stamp])
ylabel('$X(m)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
grid on
subplot(312)
plot(time, pos(:,2),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-1 1])
xlim([0,time_stamp])
ylabel('$Y(m)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
grid on
subplot(313)
plot(time, pos(:,3),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-1 1])
xlim([0,time_stamp])
xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 20);
ylabel('$Z(m)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
grid on


figure
subplot(311)
plot(time, vel(:,1),'linewidth', 3)
set(gca,'FontSize', 20);
title('$Velocity\,Error$','Interpreter', 'latex','FontSize', 25)
ylim([-1 1])
xlim([0,time_stamp])
ylabel('$X(m)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
grid on
subplot(312)
plot(time, vel(:,2),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-1 1])
xlim([0,time_stamp])
ylabel('$Y(m)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
grid on
subplot(313)
plot(time, vel(:,3),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-1 1])
xlim([0,time_stamp])
xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 20);
ylabel('$Z(m)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
grid on



figure
subplot(311)
plot(time, rot(:,1),'linewidth', 3)
set(gca,'FontSize', 20);
title('$Rotation\,Error$','Interpreter', 'latex','FontSize', 25)
ylim([-30 30])
xlim([0,time_stamp])
ylabel('$Roll(degree)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
grid on
subplot(312)
plot(time, rot(:,2),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-30 30])
xlim([0,time_stamp])
ylabel('$Pitch(degree)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
grid on
subplot(313)
plot(time, rot(:,3),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-30 30])
xlim([0,time_stamp])
xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 20);
ylabel('$Yaw(degree)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
grid on



figure
subplot(311)
plot(time, ang(:,1),'linewidth', 3)
set(gca,'FontSize', 20);
title('$Angular Velocity\,Error$','Interpreter', 'latex','FontSize', 25)
ylim([-45 45])
xlim([0,time_stamp])
ylabel('$Roll(degree/s)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
grid on
subplot(312)
plot(time, ang(:,2),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-45 45])
xlim([0,time_stamp])
ylabel('$Pitch(degree/s)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
grid on
subplot(313)
plot(time, ang(:,3),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-45 45])
xlim([0,time_stamp])
xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 20);
ylabel('$Yaw(degree/s)$', 'Interpreter', 'latex','FontSize', 20, 'Rotation',90);
grid on





