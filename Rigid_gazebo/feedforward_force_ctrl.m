classdef feedforward_force_ctrl
   properties
       gamma_m = diag([  0.05, 0.00001, 0.00001, 0.00001]);
       C1 = 2;
       kcl_m = diag([  0.0003, 0, 0, 0]);


   end
   
   methods
       function [F_ff, theta_m_hat] = feedforward_force_use_geometric(~, ad, multirotor)
           theta_m_hat = multirotor.m;
           F_ff = multirotor.m*ad - multirotor.m*multirotor.g*multirotor.e3;
       end
       
       function [F_ff, theta_m_hat, icl, W_dot] = feedforward_force_use_adaptive_ICL(obj,iter, ad, uav_a,multirotor, icl, ex, ev, mass_est_last, dt)
            % calculate the regression matrix
            a = [multirotor.a.X ; multirotor.a.Y; multirotor.a.Z];
            R = reshape(multirotor.R(:, iter-1), 3, 3);
            W = multirotor.W(:, iter-1);
            r1 = multirotor.uav1_pos;
            r2 = multirotor.uav2_pos;
            r3 = multirotor.uav3_pos;
            r4 = multirotor.uav4_pos;
		% gazebo acceleration bound control
            if a(3) > 10 
                a(3) = 9.8;
            end
            if uav_a(3) > 10 
                uav_a(3) = 9.8;
            end
            if uav_a(6) > 10 
                uav_a(6) = 9.8;
            end
            if uav_a(9) > 10 
                uav_a(9) = 9.8;
            end
            if uav_a(12) > 10 
                uav_a(12) = 9.8;
            end
%             B = A*x
            B = [R'*(a - uav_a(1:3))   - hat_map(W)*hat_map(W)*r1;
                 R'*(a - uav_a(4:6))   - hat_map(W)*hat_map(W)*r2;
                 R'*(a - uav_a(7:9))   - hat_map(W)*hat_map(W)*r3;
                 R'*(a - uav_a(10:12)) - hat_map(W)*hat_map(W)*r4];
            A = [hat_map(r1); hat_map(r2); hat_map(r3) ; hat_map(r4)];

            W_dot = pinv(A)*B*0;


            Y_m_mass = [ad(1); ad(2); ad(3) - multirotor.g];
            Y_m_a = -R*(hat_map(W)*hat_map(W));
            Y_m = [Y_m_mass Y_m_a];
            Y_m_transpose = Y_m';
            
            Ym_cl_mass =   [a(1); a(2); a(3) - multirotor.g];
            Ym_cl_a = zeros(3,3);
            Ym_cl = [Ym_cl_mass Ym_cl_a];

            F_bar = icl.current_force;
            % prepare the past data
            mat_diag_now = Ym_cl'*(F_bar - Ym_cl*mass_est_last);
            
            % summation of the past data
            icl.mass_mat_diag_matrix(:, icl.mass_index_diag+1) = mat_diag_now;
            icl.mass_index_diag = mod((icl.mass_index_diag+1), icl.mass_N_diag);
            icl.mass_mat_diag_sum = sum(icl.mass_mat_diag_matrix, 2);
            icl_term = icl.mass_mat_diag_sum;
            % mass update law
            theta_m_hat_dot_icl =  -obj.kcl_m * obj.gamma_m * icl_term;
            theta_m_hat_dot_adaptive = -obj.gamma_m*Y_m_transpose*(ev+obj.C1*ex);
            
            theta_m_hat_dot = theta_m_hat_dot_icl + theta_m_hat_dot_adaptive;

            % mass estimation
            theta_m_hat = mass_est_last + theta_m_hat_dot*dt;
            
            % force feedforward control input
            F_ff = Y_m*theta_m_hat;
       end
   end
end
