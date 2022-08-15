classdef gazebo_controller

    properties

        kx = 12;
        kv = 8;
        gamma_m = diag([0.01,0.0018,0.0022,0.0015]);
        cx = 5; 
        kcl_m = diag([0.0001, 50000 , 50000 ,50000]);
        
        kr = 6*eye(3);
        ko = 3*eye(3);    
        cr = 5;
        %                         CoG              Inertia
        gamma_j = diag([0.001,0.001,0.0001, 0.03, 0.015, 0.0055]);
        kcl_j = diag([  400, 400, 300 ,  3900, 700, 500]);

        e3 = [0; 0; 1];
        last_f = [0; 0; 0];

    end

    methods

        function [Fd, error, theta_m_hat, icl_trans] = force_ctrl(obj, iter, payload, Xd, icl_rot, icl_trans, dt)
           
            x_enu = payload.x(:,iter-1);

            if iter > 2
                payload.v(:,iter-1) = (payload.x(:,iter-1) - payload.x(:,iter-2))/dt;
                x_dot_enu = payload.v(:,iter-1);
            else 
                x_dot_enu = payload.v(:,iter-1) ;
            end

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

            if iter > 2
                W_dot = (payload.W(:,iter-1) - payload.W(:,iter-2))/dt;
            else 
                W_dot = payload.W(:,iter-1) ;
            end

            a = -R*(hat_map(W_dot) + hat_map(W) * hat_map(W));
            b = -xd_double_dot + payload.g*obj.e3;

            % adaptive term 
            Ym = [b a];

            % integral term 
            icl_a = a*dt;
            c = -x_dot + payload.g*obj.e3*dt;

            Ym_cl = [c  icl_a];
            
            % Error
            ex = x - xd;
            ev = x_dot - xd_dot;
            
            F_bar = icl_trans.current_force*dt;
            
            % prepare the past data
            mat_diag_now = Ym_cl'*(F_bar - Ym_cl*theta_m_hat);
            
            % summation of the past data
            icl_trans.mat_diag_matrix(:, icl_trans.index_diag+1) = mat_diag_now;
            icl_trans.index_diag = mod((icl_trans.index_diag+1), icl_trans.N_diag);
            icl_trans.mat_diag_sum = sum(icl_trans.mat_diag_matrix, 2);
            icl_term = icl_trans.mat_diag_sum;
            
            % update law
            theta_m_hat_dot_adaptive  = obj.gamma_m * Ym' * (ev + obj.cx*ex);
            theta_m_hat_dot_icl =  obj.kcl_m * obj.gamma_m * icl_term;
            theta_m_hat = theta_m_hat + (theta_m_hat_dot_adaptive+theta_m_hat_dot_icl)*dt;
            
            % Control Input
            
            F_ff = Ym*theta_m_hat;
            F_back = -obj.kx*ex - obj.kv*ev;
            F_back  = vec_ned_to_enu(F_back);
            % Geometric controller
            Fd = F_back + F_ff ;
            %% To do , this should put outside
            icl_trans.current_force = Fd;            
            
            error(1:3) = ex;
            error(4:6) = ev;
        end


        function [Md, error, J_est, icl_rot, Rd] = moment_ctrl(obj, iter, payload, Xd, icl_rot,icl_trans, dt)
            

            % states 
            R = reshape(payload.R(:,iter-1), 3,3);
            W = payload.W(: , iter-1);

            % Desire 
            b1c = [1 ; 0 ;  0];
            Rd = [b1c hat_map(obj.e3)*b1c obj.e3];
            Wd = [0; 0; 0];
            
            % eR and eW
            eR = 1/2*vee_map(Rd'*R - R'*Rd);
            eW = W - R'*Rd*Wd;
            
            % prepare the moment of inertia estimated last time
            J_est_last = payload.rotation_estimation(:, iter-1);

            % calculate the regression matrix
            inertia_Y_diag =    [0, -W(2)*W(3), W(2)*W(3);
                                W(1)*W(3), 0, -W(1)*W(3);
                                -W(1)*W(2), W(1)*W(2), 0];
            
            Fx = icl_rot.f_last(1);
            Fy = icl_rot.f_last(2);
            Fz = icl_rot.f_last(3);
            force_Y_diag = [   0    Fz  -Fy;
                               -Fz   0   Fx;
                               Fy    -Fx  0];

            Y_diag = [force_Y_diag inertia_Y_diag];
            Y_diag_transpose = Y_diag';

            % y_diag_cl_integral and y_diag_cl_integral transpose
            inertia_y_diag_cl_integral = [W(1) - icl_rot.W_last(1), -W(2)*W(3)*dt, W(2)*W(3)*dt;
                                        
                                          W(1)*W(3)*dt, W(2) - icl_rot.W_last(2), -W(1)*W(3)*dt;
                                         
                                           -W(1)*W(2)*dt, W(1)*W(2)*dt, W(3) - icl_rot.W_last(3)];
            
            force_y_diag_cl_integral = force_Y_diag*dt;

            y_diag_cl_integral = [force_y_diag_cl_integral inertia_y_diag_cl_integral];

            y_diag_cl_integral_transpose = y_diag_cl_integral';
            
            % angular velocity last time
            icl_rot.W_last = W;
            
            % integral of moment control input
            M_bar = icl_rot.current_moment*dt;
            
            % prepare the past data
            mat_diag_now = y_diag_cl_integral_transpose*(M_bar - y_diag_cl_integral*J_est_last);
            
            % summation of the past data
            icl_rot.mat_diag_matrix(:, icl_rot.index_diag+1) = mat_diag_now;
            icl_rot.index_diag = mod((icl_rot.index_diag+1), icl_rot.N_diag);
            icl_rot.mat_diag_sum = sum(icl_rot.mat_diag_matrix, 2);
            
            % moment of inertia update law
            theta_diag_hat_dot_adaptive = -obj.gamma_j * Y_diag_transpose*(eW + obj.cr*eR);
            theta_diag_hat_dot_icl = obj.kcl_j * obj.gamma_j * icl_rot.mat_diag_sum;
            
            theta_diag_hat_dot = theta_diag_hat_dot_adaptive + theta_diag_hat_dot_icl;
            
            % moment of inertia estimation
            theta_diag_hat = J_est_last + theta_diag_hat_dot*dt;
            
            J_est = theta_diag_hat;

            % moment feedforward control input
            M_ff = Y_diag*theta_diag_hat;

            Md = -obj.kr*eR - obj.ko*eW + M_ff;

            %Md = -obj.kr*eR - obj.ko*eW - M_ff ;
            error(1:3) = eR;
            error(4:6) = eW;

            icl_rot.W_last = W;
            icl_rot.f_last = icl_trans.current_force;
        
        end

    end
end