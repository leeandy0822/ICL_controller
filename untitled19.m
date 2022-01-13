Fd = [6.998 ;  5.07 ; -3.13];
Md = [-3.88 ; -4.24; 4.14];

eul = [pi/6 0 0];
R = eul2rotm(eul);
R= reshape(R,3,3);

% contact point
p1 = [0.5 ; 0 ; -0.1];
p2 = [-0.5 ; 0.4; -0.1];
p3 = [-0.5 ; -0.4 ; -0.1];

grasp_matrix = [ eye(3) eye(3) eye(3) ; hat_map( p1) hat_map( p2) hat_map( p3)];

temp_f = R'*Fd;
temp_m = Md;
grasp_term =  grasp_matrix'*inv( grasp_matrix* grasp_matrix');
rotation_term = [R zeros(3) zeros(3) ; zeros(3) R zeros(3); zeros(3) zeros(3) R];

u = rotation_term*grasp_term*[temp_f;temp_m];
u1 = u(1:3);
u2 = u(4:6);
u3 = u(7:9);

Fd_new =  u1 +  u2 +  u3;
Md_new = hat_map(p1)*R'* u1 + hat_map( p1)*R'* u1 + hat_map( p1)*R'* u1 ;

Fd_error = Fd - Fd_new;
Md_error = Md - Md_new;

disp(Fd_error);
disp(Md_error);

A = grasp_matrix;
B = [temp_f; temp_m];

u = lsqminnorm(A,B);
u1 = R*u(1:3);
u2 = R*u(4:6);
u3 = R*u(7:9);
Fd_new =  u1 +  u2 +  u3;
Md_new = hat_map(p1)*R'* u1 + hat_map( p2)*R'* u1 + hat_map( p3)*R'* u1 ;

temp = [u1; u2 ; u3];
Fd_error = Fd - Fd_new;
Md_error = Md - Md_new;
disp(Fd_error);
disp(Md_error);


