classdef feedforward_moment_ctrl
   properties
       gamma_diag = diag([0.0002, 0.0002, 0.001, 0.001, 0.001]);
       C2 = 3;
       kcl_j = diag([  0, 0, 0, 0, 0]);
   end
   
   methods
       function [M_ff, theta_diag_hat] = feedforward_moment_use_geometric(~, W , multirotor)
           theta_diag_hat = [multirotor.J(1); multirotor.J(5); multirotor.J(9)];
           M_ff = -vec_cross(W, multirotor.J*W);
       end
       
       function [M_ff, theta_diag_hat, icl] = feedforward_moment_use_adaptive_ICL(obj, W, multirotor, eR, eW, J_est_last, icl, dt, iter, select_moment_adaptive_w_wo_ICL, SELECT_FILTER)
           % calculate the regression matrix

           inertia_Y_diag = [0, W(2)*W(3), -W(2)*W(3);
                     -W(1)*W(3), 0, W(1)*W(3);
                     W(1)*W(2), -W(1)*W(2), 0];

           Fz = icl.current_force;
           cog_Y_diag = [0   -Fz ; 
                        Fz 0  ;
                         0   0  ];
          
           Y_diag = [cog_Y_diag inertia_Y_diag];
           Y_diag_transpose = Y_diag';
         

           % use adaptive with ICL or without ICL
           moment_adaptive_without_ICL = 1;
           moment_adaptive_with_ICL = 2;

           if select_moment_adaptive_w_wo_ICL == moment_adaptive_without_ICL
               % moment of inertia update law
               theta_diag_hat_dot = obj.gamma_diag*Y_diag_transpose*(eW+obj.C2*eR);
               
               % moment of inertia estimation
               theta_diag_hat = J_est_last + theta_diag_hat_dot*dt;
               
               % moment feedforward control input
               M_ff = Y_diag*theta_diag_hat;
               
           elseif select_moment_adaptive_w_wo_ICL == moment_adaptive_with_ICL
               % y_diag_cl_integral and y_diag_cl_integral transpose
               inertia_y_diag_cl_integral = [W(1) - icl.W_last(1), -W(2)*W(3)*dt, W(2)*W(3)*dt;
                                     W(1)*W(3)*dt, W(2) - icl.W_last(2), -W(1)*W(3)*dt;
                                     -W(1)*W(2)*dt, W(1)*W(2)*dt, W(3) - icl.W_last(3)];
               
               force_y_diag_cl_integral = cog_Y_diag*dt;

               y_diag_cl_integral = [force_y_diag_cl_integral inertia_y_diag_cl_integral];
               
               y_diag_cl_integral_transpose = y_diag_cl_integral';

               % angular velocity last time
               icl.W_last = W;
               
               % integral of moment control input
               M_bar = icl.current_moment*dt;
               
               % prepare the past data
               mat_diag_now = y_diag_cl_integral_transpose*(M_bar - y_diag_cl_integral*J_est_last);
               
               % summation of the past data
               icl.mat_diag_matrix(:, icl.index_diag+1) = mat_diag_now;
               icl.index_diag = mod((icl.index_diag+1), icl.N_diag);
               icl.mat_diag_sum = sum(icl.mat_diag_matrix, 2);
               
               % moment of inertia update law
               theta_diag_hat_dot_adaptive = obj.gamma_diag*Y_diag_transpose*(eW+obj.C2*eR);
               theta_diag_hat_dot_ICL = obj.kcl_j*obj.gamma_diag*icl.mat_diag_sum;
               theta_diag_hat_dot = theta_diag_hat_dot_adaptive + theta_diag_hat_dot_ICL;
               
               % moment of inertia estimation
               theta_diag_hat = J_est_last + theta_diag_hat_dot*dt;
               
               % moment feedforward control input

               M_ff = Y_diag*theta_diag_hat;

           end
       end
   end
end
