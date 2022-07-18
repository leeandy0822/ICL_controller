clc;
close all

options = optimoptions('fmincon','Display','iter','Algorithm','sqp');


%% Initialize parameters

global CoM weight ;
global W L;

W = 0.2;
L = 0.8;

g = 9.8;
mass = 5;
weight = mass*g;
CoM = [-0.08,-0.08,0];  

%% Solve Optimization
A = [];
b = [];


% initialize the motor eq
motor_eq = zeros(3,9);
for i = 1:1:9

    if mod(i,3) == 1
        motor_eq(1,i) = 1;
    elseif mod(i,3) == 2
        motor_eq(2,i) = 1;
    else
        motor_eq(3,i) = 1;
    end

end

Aeq = [motor_eq zeros(3,3)];
beq = [0 0 weight];

f_lb = zeros(9,1);
f_ub = 2*9.8*ones(9,1);

lb = [ f_lb    ;   -40   ;   -40  ;  -40  ];
ub = [ f_ub    ;    40   ;    40   ;   40  ];


ic_motor_x = zeros(1,9);
for i = 3:3:9
    ic_motor_x(i) = weight/3;
end
x0 = [ ic_motor_x, 0   0   0  ];


tic
[x, fval] = fmincon(@myfunc,x0,A,b,Aeq,beq,lb,ub,@force_balance,options);
toc

fprintf("========= Optimization Allocation =========")



r = [edge1(x(10))' edge2(x(11))' edge3(x(12))'];
fprintf("\n---------------------------------------")

for i = 1:1:3
    fprintf("\nForce%d: ",i);
    index1 = 3*i-2;
    index2 = 3*i;
    r(:,i) = r(:,i);
    fprintf(" %4.2f",x(index1 : index2))
    fprintf("\n\nPosition%d: \n",i);
    fprintf("   x:  %4.2f", r(1,i))
    fprintf("   y:  %4.2f", r(2,i))
    fprintf("   z:  %4.2f", r(3,i))
    fprintf("\n---------------------------------------")
end

fprintf("\n\n========= ========================= =========\n")

% Top
function c = edge1(input)
    x = input;
    y = 0.3;
    z = 0;
    c = [x , y, z];
end

% right
function c = edge2(input)
    x0 = -1*sqrt(3)*0.15;
    y0 = -1*0.15;
    x = x0 + input*(1/2);
    y = y0 - input*(sqrt(3)/2);
    z = 0;
    c = [x, y, z];
end

% Left
function c = edge3(input)
    x0 = 1*sqrt(3)*0.15;
    y0 = -1*0.15;
    x = x0 + input*(1/2);
    y = y0 + input*(sqrt(3)/2);
    z = 0;
    c = [x, y, z];
end


function [c,ceq] = force_balance(x)

    global CoM;
    c = [];

    f1 = x(1:3)';
    f2 = x(4:6)';
    f3 = x(7:9)';
    
    [x1] = edge1(x(10)) - CoM;
    [x2] = edge2(x(11)) - CoM;
    [x3] = edge3(x(12)) - CoM;
    
    ceq = hat_map(x1)*f1 + hat_map(x2)*f2 + hat_map(x3)*f3 ;

end

function fun = myfunc(x)

    P = 10;
    F1_norm = norm(x(1:3));
    F2_norm = norm(x(4:6));
    F3_norm = norm(x(7:9));

    energy_comsumption = P*(F1_norm^1.5 + F2_norm^1.5 + F3_norm^1.5);

    fun = energy_comsumption;

end


