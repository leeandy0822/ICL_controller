close all;
clc;

data = readtable('eight_alnumimum_not.csv');

data = data(1:1600, :);

cur_pos = data{:,1:3};
pos = data{:,4:6};
vel = data{:,7:9};
rot = data{:,10:12};
ang = data{:,13:15};
Force = data{:,16:18};
Moment = data{:,19:21};

scalar_force = zeros(1,length(Force));
UAV1 = zeros(4,length(Force));
UAV2 = zeros(4,length(Force));



allocation_matrix =[[ 0.5         1.04986877  0.          0.        ]
 [ 0.          0.16404199  0.          0.        ]
 [ 0.          0.          0.5         0.        ]
 [ 0.          0.          0.          0.5       ]
 [ 0.5        -1.04986877  0.          0.        ]
 [ 0.          0.16404199  0.          0.        ]
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





mass = data{:,22};
cog = data{:,23:24};
time = data{:,27};

time = time - 30;
des_pos = cur_pos + pos;

figure
plot(time, mass,'linewidth', 3.5)
set(gca,'FontSize', 20);
title('$Estimated\,Mass$','Interpreter', 'latex','FontSize', 30)
yline(2.8, "--", 'color', 'r', 'linewidth', 3);

xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 25);
ylabel('$mass(kg)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
legend('$\hat{\theta}_{m}$', '$\theta_{m}$', 'Interpreter', 'latex','FontSize', 20)
grid on


figure
subplot(211)
plot(time, cog(:,1),'linewidth', 3.5)
set(gca,'FontSize', 20);
title('$Estimation\,CoG$','Interpreter', 'latex','FontSize', 30)
yline(0, "--", 'color', 'r', 'linewidth', 3);
ylim([-0.1 0.1])
xlim([-20,90])
ylabel('$CoG_x(m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
legend('$\hat{\theta}_{m}$', '$\theta_{m}$', 'Interpreter', 'latex','FontSize', 20)
grid on
subplot(212)
plot(time, cog(:,2),'linewidth', 3.5)
set(gca,'FontSize', 20);
yline(0.06, "--", 'color', 'r', 'linewidth', 3);
ylim([-0.05 0.1])
xlim([-20,90])
xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 25);
ylabel('$CoG_y(m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
legend('$\hat{\theta}_{cog_y}$', '$\theta_{m}$', 'Interpreter', 'latex','FontSize', 20)
grid on

% draw traj
figure
subplot(311)
plot(time, cur_pos(:,1),time, des_pos(:,1), 'linewidth', 3)
set(gca,'FontSize', 20);
title('$Position$','Interpreter', 'latex','FontSize', 30)
ylim([-1.5 1.5])
xlim([0,90])
ylabel('$X(m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(312)
plot(time, cur_pos(:,2),time, des_pos(:,2),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-1.5 1.5])
xlim([0,90])
ylabel('$Y(m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(313)
plot(time, cur_pos(:,3),time, des_pos(:,3),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([0 1.5])
xlim([0,90])
xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 25);
ylabel('$Z(m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on



figure
subplot(311)
plot(time, pos(:,1),'linewidth', 3)
set(gca,'FontSize', 20);
title('$Position\,Error$','Interpreter', 'latex','FontSize', 30)
ylim([-1.2 1.2])
xlim([0,120])
ylabel('$X(m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(312)
plot(time, pos(:,2),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-1.2 1.2])
xlim([0,120])
ylabel('$Y(m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(313)
plot(time, pos(:,3),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-1.2 1.2])
xlim([0,120])
xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 25);
ylabel('$Z(m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on


figure
subplot(311)
plot(time, vel(:,1),'linewidth', 3)
set(gca,'FontSize', 20);
title('$Velocity\,Error$','Interpreter', 'latex','FontSize', 30)

ylabel('$X(m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(312)
plot(time, vel(:,2),'linewidth', 3)
set(gca,'FontSize', 20);

ylabel('$Y(m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(313)
plot(time, vel(:,3),'linewidth', 3)
set(gca,'FontSize', 20);

xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 25);
ylabel('$Z(m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on



figure
subplot(311)
plot(time, rot(:,1),'linewidth', 3)
set(gca,'FontSize', 20);
title('$Rotation\,Error$','Interpreter', 'latex','FontSize', 30)
ylim([-30 30])
xlim([0,60])
ylabel('$Roll(degree)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(312)
plot(time, rot(:,2),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-30 30])
xlim([0,60])
ylabel('$Pitch(degree)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(313)
plot(time, rot(:,3),'linewidth', 3)
set(gca,'FontSize', 20);

xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 25);
ylabel('$Yaw(degree)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on



figure
subplot(311)
plot(time, ang(:,1),'linewidth', 3)
set(gca,'FontSize', 20);
title('$Angular Velocity\,Error$','Interpreter', 'latex','FontSize', 30)
ylim([-45 45])
xlim([0,60])
ylabel('$Roll(degree/s)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(312)
plot(time, ang(:,2),'linewidth', 3)
set(gca,'FontSize', 20);
ylim([-45 45])
xlim([0,60])
ylabel('$Pitch(degree/s)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(313)
plot(time, ang(:,3),'linewidth', 3)
set(gca,'FontSize', 20);

xlabel('$time(s)$', 'Interpreter', 'latex','FontSize', 25);
ylabel('$Yaw(degree/s)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on




figure
subplot(211)
plot(time, UAV1(1,:),time, UAV2(1,:),'linewidth', 1)
set(gca,'FontSize', 20);
title('$Control Input$','Interpreter', 'latex','FontSize', 30)
ylim([0 20])
xlim([0,60])
ylabel('$Force(N)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
grid on
subplot(212)
plot(time, UAV1(2,:),time, UAV1(3,:),time, UAV2(2,:),time, UAV2(3,:),'linewidth', 1)
set(gca,'FontSize', 20);

ylabel('$Moment(N \cdot m)$', 'Interpreter', 'latex','FontSize', 25, 'Rotation',90);
legend('$M1_x$', '$M1_y$', '$M2_x$','$M2_y$','Interpreter', 'latex','FontSize', 20)
grid on





