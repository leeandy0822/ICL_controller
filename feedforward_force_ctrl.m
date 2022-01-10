classdef feedforward_force_ctrl
    properties
        gamma_m = 0.8;
        cx = 1;
        kcl_m = 0.01;
    end

    methods
        
        function [F_ff, theta_m_hat,icl] = feedforward_force_use_adaptive_ICL(obj, v_ned, ad, payload, ex, ev, mass_est_last, dt, icl)
        
            % calculate the regression matrix
            Y_m = [-ad(1); -ad(2); -ad(3) + payload.g];
            
            Ym_cl = -v_ned + payload.g*payload.e3*dt;
            
            
            F_bar = icl.current_force*dt;
            
            % prepare the past data
            mat_diag_now = Ym_cl'*(F_bar - Ym_cl*mass_est_last);
            
            % add some data in next index (start from 1)
            icl.mat_diag_matrix(:, icl.index_diag+1) = mat_diag_now;
            
            % if the index > 10, then start from 1 again
            icl.index_diag = mod((icl.index_diag+1), icl.N_diag);
            
            % add all the data in database (10 data)
            icl.mat_diag_sum = sum(icl.mat_diag_matrix, 2);
            
            icl_term = icl.mat_diag_sum;
            
            % mass update law 
            theta_m_hat_dot = -obj.gamma_m*Y_m'*(ev+obj.cx*ex)+ obj.kcl_m * obj.gamma_m * icl_term ;
            
            % mass estimation
            theta_m_hat = mass_est_last + theta_m_hat_dot*dt;
            
            % force feedforward control input
            F_ff = Y_m*theta_m_hat;
        end
    end
end
