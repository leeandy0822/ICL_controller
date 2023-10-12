clc;
close all
addpath("../tools/")
options = optimoptions('fmincon','Display','off','Algorithm','sqp');


%% Initialize parameters

global CoM weight mass CoM_temp L;

L = 0.7;
g = 9.8;
mass = 8.67;
weight = mass*g;
CoM = [0.0478,0.012,0];  
%% Solve Optimization
A = [];
b = [];


% initialize the motor eq
Aeq = [eye(3) eye(3) eye(3) eye(3) zeros(3, 4)];
beq = [0 0 weight];

f_lb = zeros(12,1);
f_ub = 3*9.8*ones(12,1);

lb = [ f_lb    ;   -0.4 ;   -0.4;  -0.4 ; -0.4];
ub = [ f_ub    ;    0.4;     0.4  ;   0.4 ; 0.4];

ic_motor_x = zeros(1,12);
for i = 3:3:12
    ic_motor_x(i) = weight/4;
end
x0 = [ ic_motor_x zeros(1, 4)  ];


tic
[x, fval] = fmincon(@myfunc,x0,A,b,Aeq,beq,lb,ub,@force_balance,options);
toc



r = [edge1(x(13))' edge2(x(14))' edge3(x(15))' edge4(x(16))'];
fprintf("\n======= Optimization Allocation =======\n")

for i = 1:1:4
    fprintf("\nForce%d:\n ",i);
    index1 = 3*i-2;
    index2 = 3*i;
    r(:,i) = r(:,i);
    fprintf("  %4.2f   ",x(index1 : index2))
    fprintf("\n---------------------------------------")
    fprintf("\nPosition%d: \n",i);
    fprintf("   x:  %4.2f", r(1,i))
    fprintf("   y:  %4.2f", r(2,i))
    fprintf("   z:  %4.2f", r(3,i))
    fprintf("\n=======================================")
end
fprintf("\n")

% left
function c = edge1(input)
    global L;
    x = -L;
    y = input;
    z = 0;
    c = [x , y, z];
end

% right
function c = edge2(input)
    global L;
    x = L;
    y = input;
    z = 0;
    c = [x, y, z];
end

% top
function c = edge3(input)
    global L;
    x = input;
    y = L;
    z = 0;
    c = [x, y, z];
end

% bottom
function c = edge4(input)
    global L;
    x = input;
    y = -L;
    z = 0;
    c = [x, y, z];
end

function [c,ceq] = force_balance(x)

    global CoM ;
    global mass;
    global CoM_temp;
    c = [];

    f1 = x(1:3)';
    f2 = x(4:6)';
    f3 = x(7:9)';
    f4 = x(10:12)';
    % the position of uavs will affect CoG of system

    [x1] = edge1(x(13)) - CoM_temp;
    [x2] = edge2(x(14)) - CoM_temp;
    [x3] = edge3(x(15)) - CoM_temp;
    [x4] = edge4(x(16)) - CoM_temp;

    ceq = hat_map(x1)*f1 + hat_map(x2)*f2 + hat_map(x3)*f3 + hat_map(x4)*f4 ;

end

function fun = myfunc(x)
    
    global CoM mass CoM_temp;

    % the position of uavs will affect CoG of system
    x1_drift = edge1(x(13)) - edge1(0);
    x2_drift = edge2(x(14)) - edge2(0);
    x3_drift = edge3(x(15)) - edge3(0);
    x4_drift = edge4(x(16)) - edge4(0);

    uav_mass = 1.57;
    CoM_temp = CoM + (uav_mass/mass)*(x1_drift + x2_drift + x3_drift + x4_drift);
    [p1] = edge1(x(13)) - CoM_temp;
    [p2] = edge2(x(14)) - CoM_temp;
    [p3] = edge3(x(15)) - CoM_temp;
    [p4] = edge4(x(16)) - CoM_temp;

    F1_norm = norm(x(1:3));
    F2_norm = norm(x(4:6));
    F3_norm = norm(x(7:9));
    F4_norm = norm(x(10:12));

    energy_comsumption = (F1_norm^1.5 - F2_norm^1.5)^2 +(F2_norm^1.5 - F3_norm^1.5)^2 +(F3_norm^1.5 - F4_norm^1.5)^2 + (F1_norm^1.5 - F4_norm^1.5)^2;
    fun = energy_comsumption;

end
