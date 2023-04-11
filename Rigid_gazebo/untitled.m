
close all;
clc
weight = [1,1,1,1];
H = diag([weight, weight]);
uav1_pos(1) = 0.275;
uav1_pos(2) = 0; 
uav2_pos(1) = -0.275;
uav2_pos(2) = 0; 

A = [   1           0   0   0     1          0   0   0   ;
     -uav1_pos(2)   1   0   0    -uav2_pos(2)  1   0   0  ;
     uav1_pos(1)    0   1   0   uav2_pos(1)  0   1   0    ;
        0           0   0   1     0          0   0   1   ];


U  = H^(-2)*A'*(A*H^(-2)*A')^(-1);





