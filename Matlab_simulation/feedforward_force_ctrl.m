classdef feedforward_force_ctrl
   properties
       gamma_m = 0.05;
       C1 = 1;
   end
   
   methods
       function [F_ff, theta_m_hat] = feedforward_force_use_geometric(~, ad, multirotor)
           theta_m_hat = multirotor.m;
           F_ff = multirotor.m*ad - multirotor.m*multirotor.g*multirotor.e3;
       end
       
       function [F_ff, theta_m_hat] = feedforward_force_use_adaptive_ICL(obj, ad, multirotor, ex, ev, mass_est_last, dt)
           % calculate the regression matrix
           Y_m = [ad(1); ad(2); ad(3)-multirotor.g];
           Y_m_transpose = Y_m';
           
           % mass update law
           theta_m_hat_dot = -obj.gamma_m*Y_m_transpose*(ev+obj.C1*ex);
           
           % mass estimation
           theta_m_hat = mass_est_last + theta_m_hat_dot*dt;
           
           % force feedforward control input
           F_ff = Y_m*theta_m_hat;
       end
   end
end
