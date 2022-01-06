classdef feedward_moment_ctrl
    properties
        gamma_j = diag([35,6,85]);
        cr = 0.5;
        kcl_j = 90;
    end

    methods
        function [M_ff, theta_J_hat] = feedforward_moment_use_adaptive_ICL(obj, W, payload, eR, eW, J_est_last, icl, dt, iter)
            
            % calculate the regression matrix
            Y_diag = [0, W(2)*W(3), -W(2)*W(3);
                     -W(1)*W(3), 0, W(1)*W(3);
                     W(1)*W(2), -W(1)*W(2), 0];
            Y_diag_transpose = Y_diag';         

            y_diag_icl = [W(1) - icl.W_last(1), -W(2)*W(3)*dt, W(2)*W(3)*dt;
                         W(1)*W(3)*dt, W(2) - icl.W_last(2), -W(1)*W(3)*dt;
                         -W(1)*W(2)*dt, W(1)*W(2)*dt, W(3) - icl.W_last(3)];

            % update angular velocity
            icl.W_last = W;
            M_bar = icl.current_moment*dt;

            % prepare the past data
            mat_diag_now = y_diag_icl'*(M_bar - y_diag_icl*J_est_last);
           
            % summation of the past data
            icl.mat_diag_matrix(:, icl.index_diag+1) = mat_diag_now;
            icl.index_diag = mod((icl.index_diag+1), icl.N_diag);
            icl.mat_diag_sum = sum(icl.mat_diag_matrix, 2);
           
            % moment of inertia update law
            theta_diag_hat_dot_adaptive = obj.gamma_j*Y_diag_transpose*(eW+obj.cr*eR);
            theta_diag_hat_dot_ICL = obj.kcl_j*obj.gamma_j*icl.mat_diag_sum;
            theta_diag_hat_dot = theta_diag_hat_dot_adaptive + theta_diag_hat_dot_ICL;
            
           % moment of inertia estimation
           theta_J_hat = J_est_last + theta_diag_hat_dot*dt;
           
           % moment feedforward control input
           M_ff = Y_diag*theta_J_hat;
        end
    end
end














