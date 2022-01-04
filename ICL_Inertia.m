clear all, close all, clc;



kr0 = 11;
ko0 = 2;
gamma_j = diag([35,6,85]);
cr = 0.2;
kcl_j = 80;


g = 9.8;
e3 = [0 ; 0 ; -1];

t = (1:1:6000);
dt = 0.01;

theta_j = diag([0.0820; 0.0845; 0.13]);
theta_j_hat = [0; 0; 0];

omega0_dot = [0; 0; 0;];
omega0 = [0; 0.1; 0];
eul = [-pi/6 -pi/6 -pi/8];
R0 = eul2rotm(eul);
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
x0d_dot = [10*cos(i*dt) ; -10*sin(i*dt) ; 0];

% Desire attitude Desire rotation
R0d_before = R0d;
R0d = [x0d_dot/norm(x0d_dot) (hat_map(e3)*x0d_dot)/(norm(hat_map(e3)*x0d_dot)) -e3];

omega0d = [ 0 ; 0 ; 0];

% Regression Matrix

Yj = [ 0 , omega0(2)*omega0(3) , -omega0(2)*omega0(3);
-omega0(1)*omega0(3) , 0 , omega0(1)*omega0(3);
omega0(1)*omega0(2) , -omega0(1)*omega0(2) , 0 ];

Yj_cl = [ omega0(1) - omega0_before(1), -omega0(2)*omega0(3)*dt , omega0(2)*omega0(3)*dt;
omega0(1)*omega0(3)*dt , omega0(2) - omega0_before(2) , -omega0(1)*omega0(3)*dt;
-omega0(1)*omega0(2)*dt, omega0(1)*omega0(2)*dt , omega0(3) - omega0_before(3) ];

    
% ICL record
record_Yjcl(:,:,i) = Yj_cl;
record_Md(:,i) = Md*dt;

% Error
er0 = 0.5*vee_map(R0d.'*R0 - R0.'*R0d);
eo0 = omega0 - R0.'*R0d*omega0d;

record_er(:,i) = er0;
record_eo(:,i) = eo0;

icl_term = 0;
% when time > 0.5s (0.01*50), ICL starts to work
if i > 50
% Assume N = 20
for j = 1:50
icl_term = icl_term + record_Yjcl(:,:,i-j)'*(record_Md(:,i-j) - record_Yjcl(:,:,i-j)*theta_j_hat);
end
end

theta_j_hat_dot = gamma_j * Yj' * (eo0 + cr*er0) + kcl_j * gamma_j * icl_term;
theta_j_hat = theta_j_hat + theta_j_hat_dot*dt;

% Control Input
theta_j_hat_final = [theta_j_hat(1);theta_j_hat(5);theta_j_hat(9)];
Md = -kr0*er0 - ko0*eo0 - Yj*theta_j_hat_final ;

omega0_before = omega0;

omega0_dot = theta_j\(Md - hat_map(omega0)*theta_j*omega0);
omega0 = omega0 + omega0_dot*dt;
R0_dot = R0 * hat_map(omega0);
R0 = R0 + R0_dot*dt;


record_theta_j_hat(1,i) = theta_j_hat(1);
record_theta_j_hat(2,i) = theta_j_hat(5);
record_theta_j_hat(3,i) = theta_j_hat(9);
record_theta_j(1,i) = theta_j(1);
record_theta_j(2,i) = theta_j(5);
record_theta_j(3,i) = theta_j(9);

end


figure(1);
tiledlayout(2,1)
nexttile
% Plot position tracking error
plot(t,record_er(1,:),t,record_er(2,:),t,record_er(3,:))
title("Rotation Errors");
legend('er_1','er_2','er_3')
nexttile
% plot velocity tracking error
plot(t,record_eo(1,:),t,record_eo(2,:),t,record_eo(3,:))
title("angular velocity errors");
legend('eo_1','eo_2','eo_3')

figure(4);
tiledlayout(3,1)
nexttile
plot(t,record_theta_j_hat(1,:),t,record_theta_j(1,:))
title("Inertia xx");
legend('xx','groundtruth')
nexttile
plot(t,record_theta_j_hat(2,:),t,record_theta_j(2,:))
title("Inertia yy");
legend('yy','groundtruth')
nexttile
plot(t,record_theta_j_hat(3,:),t,record_theta_j(3,:))
title("Inertia zz");
legend('zz','groundtruth')

