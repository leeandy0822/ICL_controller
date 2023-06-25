close all;
clc;

data = readtable('hover_final.csv');
data = data(:, :);

pos = data{:,1:3};
vel = data{:,4:6};
rot = data{:,7:9};
ang = data{:,10:12};
Force = data{:,13:15};
moment = data{:,16:18};

time_stamp = 75;

scalar_force = zeros(1,length(Force));

UAV1 = zeros(4,length(Force));
UAV2 = zeros(4,length(Force));

allocation_matrix =[[ 0.5         1.30718954  0.          0.        ]
 [ 0.          0.08169935  0.          0.        ]
 [ 0.          0.          0.5         0.        ]
 [ 0.          0.          0.          0.5       ]
 [ 0.5        -1.30718954  0.          0.        ]
 [ 0.          0.08169935  0.          0.        ]
 [ 0.          0.          0.5         0.        ]
 [ 0.          0.          0.          0.5       ]];


r = 0.25*(1/0.1625);
cf = 0.25*(1/1);
motor_allocation = [1 1 1 1 ; -r r r -r; r r -r -r ; -cf cf -cf cf ];
UAV1_motor = zeros(4, length(Force));
UAV2_motor = zeros(4, length(Force));


for i = 1:1:length(Force)
    scalar_force = norm(Force(i,:));
    temp = allocation_matrix * [scalar_force  moment(i,:)]';
    UAV1(:,i) = temp(1:4);
    UAV2(:,i) = temp(5:8);

    UAV1_motor(:,i) = motor_allocation \ UAV1(:,i);
    UAV2_motor(:,i) = motor_allocation \ UAV2(:,i);
end



mass = data{:,19};
ym_cl = data{:,20:22};
cog = data{:,23:24};
pos_curr = data{:,25:27};
vel_curr = data{:,28:30};
time = data{:,31};


time = time - 20;


mass_error = (mass - 2.6)/2.6;
cog_x_error = (cog(:,1)*100 - 0);
cog_y_error = (cog(:,2)*100 - 6)/6;

figure
subplot(311)
plot(time, mass,'linewidth', 3)
set(gca,'FontSize', 20);
title('$Estimated\,Mass$','Interpreter', 'latex','FontSize', 30)
yline(2.7, "--", 'color', 'r', 'linewidth', 3);
ylim([0 5])
xlim([0,time_stamp])
xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 25);
ylabel('$mass(kg)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
legend('$\hat{\theta}_{m}$', '$\theta_{m}$', 'Interpreter', 'latex','FontSize', 20)
grid on
subplot(312)
plot(time, cog(:,1)*100,'linewidth', 3.5)
set(gca,'FontSize', 20);
title('$Estimation\,CoG$','Interpreter', 'latex','FontSize', 30)
yline(0, "--", 'color', 'r', 'linewidth', 3);
ylim([-10 10])
xlim([0,time_stamp])
ylabel('$CoG_x(cm)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
legend('$\hat{\theta}_{m}$', '$\theta_{m}$', 'Interpreter', 'latex','FontSize', 20)
grid on
subplot(313)
plot(time, cog(:,2)*100,'linewidth', 3.5)
set(gca,'FontSize', 20);
yline(6, "--", 'color', 'r', 'linewidth', 3);
ylim([-4 16])
xlim([0,time_stamp])
xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 25);
ylabel('$CoG_y(cm)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
legend('$\hat{\theta}_{cog_y}$', '$\theta_{m}$', 'Interpreter', 'latex','FontSize', 20)
grid on



figure
subplot(311)
plot(time, pos(:,1),'linewidth', 3)
set(gca,'FontSize', 20);
title('$Position\,Error$','Interpreter', 'latex','FontSize', 30)
ylim([-0.5 0.5])
xlim([0,time_stamp])
ylabel('$X(m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(312)
plot(time, pos(:,2),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-0.5 0.5])
xlim([0,time_stamp])
ylabel('$Y(m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(313)
plot(time, pos(:,3),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-1 1])
xlim([0,time_stamp])
xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 25);
ylabel('$Z(m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on


figure
subplot(311)
plot(time, vel(:,1),'linewidth', 3)
set(gca,'FontSize', 20);
title('$Velocity\,Error$','Interpreter', 'latex','FontSize', 30)
ylim([-0.5 0.5])
xlim([0,time_stamp])
ylabel('$X(m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(312)
plot(time, vel(:,2),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-0.5 0.5])
xlim([0,time_stamp])
ylabel('$Y(m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(313)
plot(time, vel(:,3),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-0.5 0.5])
xlim([0,time_stamp])
xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 25);
ylabel('$Z(m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on



figure
subplot(311)
plot(time, rot(:,1),'linewidth', 3)
set(gca,'FontSize', 20);
title('$Rotation\,Error$','Interpreter', 'latex','FontSize', 30)
ylim([-30 30])
xlim([0,time_stamp])
ylabel('$Roll(degree)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(312)
plot(time, rot(:,2),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-30 30])
xlim([0,time_stamp])
ylabel('$Pitch(degree)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(313)
plot(time, rot(:,3),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-30 30])
xlim([0,time_stamp])
xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 25);
ylabel('$Yaw(degree)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on



figure
subplot(311)
plot(time, ang(:,1),'linewidth', 3)
set(gca,'FontSize', 20);
title('$Angular Velocity\,Error$','Interpreter', 'latex','FontSize', 30)
ylim([-45 45])
xlim([0,time_stamp])
ylabel('$Roll(degree/s)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(312)
plot(time, ang(:,2),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-45 45])
xlim([0,time_stamp])
ylabel('$Pitch(degree/s)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(313)
plot(time, ang(:,3),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-45 45])
xlim([0,time_stamp])
xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 25);
ylabel('$Yaw(degree/s)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on




figure
subplot(211)
plot(time, UAV1(1,:),time, UAV2(1,:),'linewidth', 1)
set(gca,'FontSize', 20);
title('$Control Input$','Interpreter', 'latex','FontSize', 30)
ylim([0 20])
xlim([0,time_stamp])
ylabel('$Force(N)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(212)
plot(time, UAV1(2,:),time, UAV1(3,:),time, UAV2(2,:),time, UAV2(3,:),'linewidth', 1)
set(gca,'FontSize', 20);
ylim([-2 2])
xlim([0,time_stamp])
ylabel('$Moment(N \cdot m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
legend('$M1_x$', '$M1_y$', '$M2_x$','$M2_y$','Interpreter', 'latex','FontSize', 20)
grid on





