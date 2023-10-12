clc;
close all
options = optimoptions('fmincon','Display','iter','Algorithm','sqp');


%% Initialize parameters

global CoM weight mass uav_mass;

g = 9.8;
uav_mass = 1.15;
% Control the moving length of the UAV
payload_mass = 1.3;
mass = 2*uav_mass + payload_mass;
weight = mass*g;
% Connect to energy 
CoM = 0.045;

origin_matrix = [1  1 ; -0.33 - CoM 0.33-CoM];

Force = origin_matrix \ [weight 0]';
%% Solve Optimization
A = [];
b = [];

% initialize the motor eq
Aeq = [1 1 0 0];
beq = [weight];

f_lb = zeros(2,1);
f_ub = 3*9.8*ones(2,1);

lb = [ f_lb ; -0.55 ; -0.55];
ub = [ f_ub ;  0.55; 0.55];

x0 = [ Force(1) Force(2) 0.33- CoM -0.33-CoM ];


tic
[x, fval] = fmincon(@myfunc,x0,A,b,Aeq,beq,lb,ub,@force_balance,options);
toc

r = [x(3) x(4)];

fprintf("Origin Force : %4.2f, %4.2f\n", Force(1), Force(2));
fprintf("After optimization : %4.2f, %4.2f\n", x(1), x(2))
fprintf("Save about: %4.2f percent of energy \n", (Force(2)^1.5 - x(2)^1.5)/Force(2)^1.5*100)
fprintf("Position:  %4.2f %4.2f\n", x(3), x(4));



function [c,ceq] = force_balance(x)
    global CoM ;
    global uav_mass;
    global mass;
    c = [];
    c = -sqrt((x(3) - x(4))^2) + 0.66;
    f1 = x(1);
    f2 = x(2);
    r1_drift = x(3) - (-0.33);
    r2_drift = x(4) - (0.33);
    new_CoM = CoM + r1_drift*(uav_mass/mass) + r2_drift*(uav_mass/mass);
    % the position of uavs will affect CoG of system
    [x1] = x(3) - new_CoM;
    [x2] = x(4) - new_CoM;
    ceq = x1*f1 + x2*f2 + 0.05;
end

function fun = myfunc(x)
    global CoM;
    weight = 5;
    energy_comsumption = (x(1)-x(2))^2 + weight*sqrt((x(3) - x(4) - 0.66)^2);
    fun = energy_comsumption ;
end