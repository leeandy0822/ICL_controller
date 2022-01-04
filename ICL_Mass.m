clear all, close all, clc;


theta_m = 0.755;
kx0 = 10;
kv0 = 10;
gamma_m = 0.8;
cx = 1;
kcl_m = 0.01;


g = 9.8;
e3 = [0 ; 0 ; -1];

t = (1:1:6000);
dt = 0.01;


x0 = [0 ; 0 ;0];
x0_dot = [0 ; 0 ;0];
x0_double_dot = [0;0;0];
theta_m_hat = 0;
Fd = [ 0 ; 0 ;0];

% ICL record
record_Ymcl = zeros(3,length(t));
record_Fd = zeros(3,length(t));
record_Xd = zeros(3,length(t));
record_X = zeros(3,length(t));
record_ex = zeros(3,length(t));
record_ev = zeros(3,length(t));
record_theta_m = zeros(1,length(t));
record_theta_m_ground = ones(1,length(t))*theta_m;
for i=1:length(t)

% desire trajectory
x0d = [1.2*sin(0.4*pi*i*dt); 4.2*cos(0.2*pi*i*dt); 3];
x0d_dot = [0.48*pi*cos(0.4*pi*i*dt) ; -0.84*pi*sin(0.2*pi*i*dt) ; 0];
x0d_double_dot = [ -0.192*pi*pi*sin(0.4*pi*i*dt) ;-0.168*pi*pi*cos(0.2*pi*i*dt) ; 0];

record_X(:,i) = x0;
record_Xd(:,i) = x0d;


% Regression Matrix
Ym = -x0d_double_dot + g*e3;

Ym_cl = -x0_double_dot + g*e3;

% ICL record
record_Ymcl(:,i) = Ym_cl*dt;
record_Fd(:,i) = Fd*dt;

% Error
ex0 = x0 - x0d;
ev0 = x0_dot - x0d_dot;
record_ex(:,i) = ex0;
record_ev(:,i) = ev0;

icl_term = 0;
% when time > 0.5s (0.01*50), ICL starts to work
if i > 50
% Assume N = 20
for j = 1:10
icl_term = icl_term + record_Ymcl(i-j)*(record_Fd(i-j) - record_Ymcl(i-j)*theta_m_hat);
end
end

theta_m_hat_dot = gamma_m * Ym.' * (ev0 + cx*ex0) + kcl_m * gamma_m * icl_term;
theta_m_hat = theta_m_hat + theta_m_hat_dot*dt;
record_theta_m(i) = theta_m_hat;

% Control Input
Fd = -kx0*ex0 - kv0*ev0 - Ym*theta_m_hat ;
%Fd = theta_m*(-kx0*ex0 - kv0*ev0 + x0_double_dot - g*e3);

x0_double_dot = (Fd + theta_m*g*e3)/theta_m;
x0_dot = x0_dot + x0_double_dot * dt;
x0 = x0 + x0_dot*dt + 0.5*x0_double_dot*dt*dt ;

end

figure(1);

plot3(record_Xd(1,:),record_Xd(2,:),record_Xd(3,:),record_X(1,:),record_X(2,:),record_X(3,:))
xlabel('X')
ylabel('Y')
zlabel('Z')
title("Trajectory");
grid on

t = t*0.01;
figure(3);
tiledlayout(3,1)
nexttile
% Plot position tracking error
plot(t,record_ex(1,:),t,record_ex(2,:),t,record_ex(3,:))
title("Postion Tracking errors");
legend('ex_1','ex_2','ex_3')
nexttile
% Plot velocity tracking error
plot(t,record_ev(1,:),t,record_ev(2,:),t,record_ev(3,:))
title("Velocity Tracking errors");
legend('ev_1','ev_2','ev_3')
nexttile
% Plot velocity tracking error
plot(t,record_theta_m,t,record_theta_m_ground)
title("Velocity Tracking errors");
legend('theta m hat','Ground_truth')