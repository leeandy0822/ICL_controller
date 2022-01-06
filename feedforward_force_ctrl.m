classdef feedforward_force_ctrl
    properties
        gamma_m = 0.8;
        cx = 1;
    end

    methods
        function [F_ff, theta_m_hat] = feedforward_force_use_adaptive_ICL(obj, ad, payload, ex, ev, mass_est_last, dt)

            Y_m = [ad(1) ; ad(2) ; ad(3) - payload.g];
            
            % mass update law
            theta_m_hat = -obj.gamma_m*Ym'*(ev + obj.cx*ex);

            % mass estimation 
            theta_m_hat = mass_est_last + theta_m_hat*dt;

            % force feedward term
            F_ff = Y_m*theta_m_hat;

        end
    end

end