clc;
close all
options = optimoptions('fmincon','Display','iter','Algorithm','interior-point');

uav1_pos = [0, -0.32];
uav2_pos = [0, 0.32];

weight = [0.3,1,0.1,0.1];
H = diag([weight, weight]);

A = [   1          0   0   0     1          0   0   0   ;
      -uav1_pos(2)  1   0   0   -uav2_pos(2)  1   0   0   ;
       uav1_pos(1)  0   1   0    uav2_pos(1)  0   1   0   ;
        0          0   0   1     0          0   0   1   ];

M  = H^(-2)*A'*(A*H^(-2)*A')^(-1)
