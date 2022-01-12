clear all, close all, clc;



kr0 = 14;
ko0 = 8;
gamma_j = diag([35,6,85]);
cr = 0.2;
kcl_j = 80;


g = 9.8;
e3 = [0 ; 0 ; 1];

t = (1:1:6000);
dt = 0.01;

theta_j = diag([0.0820; 0.0845; 0.08454]);
theta_j_hat = [0; 0; 0];

omega0_dot = [0; 0; 0;];
omega0 = [0.8; 0.1; 0.9];
eul = [-pi/2 pi/8 pi/6];
R0 = eul2rotm(eul);
% R0 = [1 0 0 ; 0 1 0 ; 0 0 1 ];
R0_dot = zeros(3,3);
R0d = zeros(3,3);
Md = 0;

% ICL record
record_Yjcl = zeros(3,3,length(t));
record_Md = zeros(3,length(t));
record_er = zeros(3,length(t));
record_eo = zeros(3,length(t));
record_theta_j = zeros(3,length(t));
record_theta_j_hat = zeros(3,length(t));
record_eul = zeros(3,length(t));
record_omega = zeros(3,length(t));

omega0d = [ 0 ; 0 ; 0];
omega0_before = [ 0 ; 0 ; 0];


for i=1:length(t)

% desire trajectory
X0d = [25*sin(0.02*i*dt) ; 25*cos(0.02*i*dt); 3*sin(0.1*i*dt)];
x0d_dot = [0.5*cos(0.02*i*dt) ; -0.5*sin(0.02*i*dt) ; 0.3*cos(0.1*i*dt)];

% Desire attitude Desire rotation
R0d_before = R0d;
R0d = [x0d_dot/norm(x0d_dot) (hat_map(e3)*x0d_dot)/(norm(hat_map(e3)*x0d_dot)) e3];

omega0d = [ 0 ; 0 ; 0];

% Regression Matrix


% Error
er0 = 0.5*vee_map(R0d.'*R0 - R0.'*R0d);
eo0 = omega0 - R0.'*R0d*omega0d;

record_er(:,i) = er0;
record_eo(:,i) = eo0;


Md = -kr0*er0 - ko0*eo0;

omega0_before = omega0;

omega0_dot = theta_j\(Md - hat_map(omega0)*theta_j*omega0);
omega0 = omega0 + omega0_dot*dt;
R0_dot = R0 * hat_map(omega0);
R0 = R0 + R0_dot*dt;


end


figure(1);
tiledlayout(2,1)
nexttile
% Plot position tracking error
plot(t,record_er(1,:),t,record_er(2,:),t,record_er(3,:))
title("Rotation Errors");
legend('er_1','er_2','er_3')
nexttile
% Plot velocity tracking error
plot(t,record_eo(1,:),t,record_eo(2,:),t,record_eo(3,:))
title("Angular Velocity Errors");
legend('eo_1','eo_2','eo_3')

er0
eo0

function x = hat_map(x)
x=[0 -x(3) x(2) ; x(3) 0 -x(1) ; -x(2) x(1) 0 ];
end
function x = vee_map(x)
x=[x(6) ;x(7) ;x(2)];
end