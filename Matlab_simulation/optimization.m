clc;
close all
clear norm;
options = optimoptions(@fminunc,'Display','iter','Algorithm','quasi-newton');
%% distance from quadcopter to CoG
d1 = [ 0 1 0]*0.5;
d2 = [-1 -1 0]*0.5;
d3 = [1 -1 0]*0.5;
%% allocation matrix
B = [eye(3) eye(3) eye(3); hat_map(d1) hat_map(d2) hat_map(d3)];
B1 = B(:, 1:3)';
B2 = B(:, 4:6)';
B3 = B(:, 7:9)';

%% nullspace (for optimization)
Z = null(B);
global Z1;
global Z2;
global Z3;
Z1 = Z(1:3,:);
Z2 = Z(4:6,:);
Z3 = Z(7:9,:);


%% command force
U = payload.force
%% Analytical solution F
global F1_bar;
global F2_bar;
global F3_bar;
F1_bar = B1/(B*B')*U;
F2_bar = B2/(B*B')*U;
F3_bar = B3/(B*B')*U;

% extra DOF
gamma = [0.5  ; 0.5 ; 0.5];

tic
gamma_new = fminunc(@myfunc,gamma,options);
toc
t = toc;

F1 = F1_bar + Z1*gamma_new;
F2 = F2_bar + Z2*gamma_new;
F3 = F3_bar + Z3*gamma_new;

gamma_force = Z*gamma_new;
U_real = B*[F1;F2;F3];
err_f = norm(U(1:3) - U_real(1:3));
err_m = norm(U(4:6) - U_real(4:6));


fprintf("Frequency : %4.2f\n", 1/t);
fprintf("\n==========    Desire Wrench  ==========\n");
fprintf("force  : %4.4f  %4.4f  %4.4f  \n", U(1),U(2),U(3));
fprintf("moment : %4.4f  %4.4f  %4.4f \n" , U(4),U(5),U(6));
fprintf("\n==========    Real Wrench  ==========\n");
fprintf("force  : %4.4f  %4.4f  %4.4f  \n", U_real(1),U_real(2),U_real(3));
fprintf("moment : %4.4f  %4.4f  %4.4f \n" , U_real(4),U_real(5),U_real(6));
fprintf("\n======== Force Input and Gamma ========\n");
fprintf("F1_bar : %4.4f  %4.4f  %4.4f \n", F1_bar(1), F1_bar(2) , F1_bar(3));
fprintf("gamma1 : %4.4f  %4.4f %4.4f\n" , gamma_force(1),gamma_force(2), gamma_force(3));
fprintf("  F1   : %4.4f  %4.4f  %4.4f \n", F1(1), F1(2) , F1(3));
fprintf("-----------------------------------------\n")
fprintf("F2_bar : %4.4f  %4.4f  %4.4f \n", F2_bar(1), F2_bar(2) , F2_bar(3));
fprintf("gamma2 : %4.4f  %4.4f %4.4f\n" , gamma_force(4),gamma_force(5), gamma_force(6));
fprintf("  F2   : %4.4f  %4.4f  %4.4f\n", F2(1), F2(2) , F2(3));
fprintf("-----------------------------------------\n")
fprintf("F3_bar : %4.4f  %4.4f  %4.4f \n", F3_bar(1), F3_bar(2) , F3_bar(3));
fprintf("gamma3 : %4.4f  %4.4f %4.4f\n" , gamma_force(7),gamma_force(8), gamma_force(9));
fprintf("  F3   : %4.4f  %4.4f  %4.4f\n", F3(1), F3(2) , F3(3));
fprintf("-----------------------------------------\n")
fprintf("==========       Error       ==========\n");
fprintf(" F_err : %d \n", err_f)
fprintf(" M_err : %d \n", err_m)

function cost = myfunc(gamma)
    s = 10;
    upperbound = 30;
    global F1_bar F2_bar F3_bar Z1 Z2 Z3;
    %% force 1
    F1 = F1_bar + Z1*gamma;
    F2 = F2_bar + Z2*gamma;
    F3 = F3_bar + Z3*gamma;
    p_i = [0 ; 0 ; -1];
    
    spherical_contraint = cos(deg2rad(35))*cos(deg2rad(35))*eye(3) - p_i*p_i'; 

    c11 = F1'*(spherical_contraint)*F1;
    c21 = F1'*F1 - upperbound^2;
    result1 = 0.5*s*F1'*F1 + (-log(-c11) - log(-c21));

    c12 = F2'*(spherical_contraint)*F2;
    c22 = F2'*F2 - upperbound^2;
    result2 = 0.5*s*F2'*F2 + (-log(-c12) - log(-c22));

    c13 = F3'*(spherical_contraint)*F3;
    c23 = F3'*F3 - upperbound^2;
    result3 = 0.5*s*F3'*F3 + (-log(-c13) - log(-c23));
        
    cost = result1 + result2 + result3;
end