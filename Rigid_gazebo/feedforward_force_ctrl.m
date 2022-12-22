classdef feedforward_force_ctrl
   properties
       gamma_m = 0.02;
       C1 = 3;
       kcl_m = 0.000000001;

   end
   
   methods
       function [F_ff, theta_m_hat] = feedforward_force_use_geometric(~, ad, multirotor)
           theta_m_hat = multirotor.m;
           F_ff = multirotor.m*ad - multirotor.m*multirotor.g*multirotor.e3;
       end
       
       function [F_ff, theta_m_hat, icl] = feedforward_force_use_adaptive_ICL(obj, ad, multirotor, icl, ex, ev, mass_est_last, dt)
            % calculate the regression matrix
            a = [multirotor.a.X ; multirotor.a.Y; multirotor.a.Z];
            
            if a(3) > 10
                a(3) = 9.8;
            end

            Y_m = [ad(1); ad(2); ad(3) - multirotor.g];
            Y_m_transpose = Y_m';
            
            Ym_cl =   [a(1); a(2); a(3) - multirotor.g];
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
