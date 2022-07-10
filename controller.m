classdef controller

    properties

        kx = 30;
        kv = 10;
        gamma_m = 0.1;
        cx = 1;
        kcl_m = 0.00001;

        kr = 9;
        ko = 2;    
        gamma_j = diag([10.5,9.5,14]);
        cr = 0.5;
        kcl_j = 80;

        e3 = [0; 0; 1];
        last_w = [0;0;0];

    end


    methods 
        function [Fd, error, theta_m_hat, icl_mass] = force_ctrl(obj, iter, payload, Xd, icl_mass, dt)
           
            x_enu = payload.x(:,iter-1);
            x_dot_enu = payload.v(:,iter-1);

            xd_enu = Xd(1:3);
            xd_dot_enu = Xd(4:6);
            xd_double_dot_enu = Xd(7:9);
            

            % convert position and velocity from enu to ned
            x = vec_enu_to_ned(x_enu);
            x_dot = vec_enu_to_ned(x_dot_enu);
            xd = vec_enu_to_ned(xd_enu);
            xd_dot = vec_enu_to_ned(xd_dot_enu);
            xd_double_dot = vec_enu_to_ned(xd_double_dot_enu);
            

            theta_m_hat = payload.translation_estimation(:,iter-1);

            % payload.gression Matrix
            R = reshape(payload.R(:,iter-1), 3,3);
            W = payload.W(: , iter-1);
            W_dot = W- payload.last_W;

            a = -R*(hat_map(W_dot) + hat_map(W) * hat_map(W));
            b = -xd_double_dot + payload.g*obj.e3;

            % adaptive term 
            Ym = [b zeros(3,3); zeros(3,1) a];

            % integral term 
            icl_a = a*dt;
            c = -x_dot + payload.g*obj.e3*dt;

            Ym_cl = [c zeros(3,3); zeros(3,1) icl_a];
            
            % Error
            ex = x - xd;
            ev = x_dot - xd_dot;
            
            F_bar = icl_mass.current_force*dt;
            
            % prepare the past data
            mat_diag_now = Ym_cl'*(F_bar - Ym_cl*theta_m_hat);
            
            % summation of the past data
            icl_mass.mat_diag_matrix(:, icl_mass.index_diag+1) = mat_diag_now;
            icl_mass.index_diag = mod((icl_mass.index_diag+1), icl_mass.N_diag);
            icl_mass.mat_diag_sum = sum(icl_mass.mat_diag_matrix, 2);
            icl_term = icl_mass.mat_diag_sum;
            
            % update law
            theta_m_hat_dot = obj.gamma_m * Ym.' * (ev + obj.cx*ex) + obj.kcl_m * obj.gamma_m * icl_term;
            theta_m_hat = theta_m_hat + theta_m_hat_dot*dt;

            % Control Input
            Fd = obj.kx*ex + obj.kv*ev + Ym*theta_m_hat ;
            icl_mass.current_force = Fd;            
            
            error(1:3) = ex;
            error(4:6) = ev;

            obj.last_w = W;
        end


        function [Md, error, J_est, icl_moment, Rd] = moment_ctrl(obj, iter, payload, Xd, icl_moment, dt)

            xd_dot_enu = Xd(4:6);
            
            % convert position and velocity from enu to ned
            xd_dot = xd_dot_enu;

            % states 
            R = reshape(payload.R(:,iter-1), 3,3);
            W = payload.W(: , iter-1);
            W_dot = W- payload.last_W;

            % Desire 
            Rd = [xd_dot/norm(xd_dot) (hat_map(obj.e3)*xd_dot)/(norm(hat_map(obj.e3)*xd_dot)) obj.e3];
            Wd = [0; 0; 0];
            
            % eR and eW
            eR = 1/2*vee_map(Rd'*R - R'*Rd);
            eW = W - R'*Rd*Wd;
            
            % prepare the moment of inertia estimated last time
            J_est_last = payload.inertia_estimation(:, iter-1);

            % calculate the regression matrix
            Y_diag = [0, W(2)*W(3), -W(2)*W(3);
                     -W(1)*W(3), 0, W(1)*W(3);
                     W(1)*W(2), -W(1)*W(2), 0];

            Y_diag_transpose = Y_diag';

            % y_diag_cl_integral and y_diag_cl_integral transpose
            y_diag_cl_integral = [W(1) - icl_moment.W_last(1), -W(2)*W(3)*dt, W(2)*W(3)*dt;
                                  W(1)*W(3)*dt, W(2) - icl_moment.W_last(2), -W(1)*W(3)*dt;
                                 -W(1)*W(2)*dt, W(1)*W(2)*dt, W(3) - icl_moment.W_last(3)];
            
            y_diag_cl_integral_transpose = y_diag_cl_integral';
            
            % angular velocity last time
            icl_moment.W_last = W;
            
            % integral of moment control input
            M_bar = icl_moment.current_moment*dt;
            
            % prepare the past data
            mat_diag_now = y_diag_cl_integral_transpose*(M_bar - y_diag_cl_integral*J_est_last);
            
            % summation of the past data
            icl_moment.mat_diag_matrix(:, icl_moment.index_diag+1) = mat_diag_now;
            icl_moment.index_diag = mod((icl_moment.index_diag+1), icl_moment.N_diag);
            icl_moment.mat_diag_sum = sum(icl_moment.mat_diag_matrix, 2);
            
            % moment of inertia update law
            theta_diag_hat_dot_adaptive = obj.gamma_j * Y_diag_transpose*(eW + obj.cr*eR);
            theta_diag_hat_dot_icl_moment = obj.kcl_j * obj.gamma_j * icl_moment.mat_diag_sum;
            theta_diag_hat_dot = theta_diag_hat_dot_adaptive + theta_diag_hat_dot_icl_moment;
            
            % moment of inertia estimation
            theta_diag_hat = J_est_last + theta_diag_hat_dot*dt;
            
            J_est = theta_diag_hat;

            % moment feedforward control input
            M_ff = Y_diag*theta_diag_hat;

            Md = -obj.kr*eR - obj.ko*eW - M_ff;

            error(1:3) = eR;
            error(4:6) = eW;
        
        end

    end
end