classdef controller
methods
    function [control, error , mass_est, J_est, icl] = crtl(obj, iter,payload,Xd_enu, b1d, icl, dt)
    
        % f, M
        control = zeros(4, 1);
        
        % xd, vd, ad, b1d, Wd
        xd_enu = Xd_enu(1:3, 1);
        vd_enu = Xd_enu(4:6, 1);
        ad_enu = Xd_enu(7:9, 1);
        Wd = [0; 0; 0];
        
        % now states
        x_enu = payload.x(:, iter-1);
        v_enu = payload.v(:, iter-1);
        R = reshape(payload.R(:, iter-1), 3, 3);
        W = payload.W(:, iter-1);
        e3 = payload.e3;
        
        % control gains
        kx = diag([4.0*payload.m; 4.0*payload.m; 4.0*payload.m]);
        kv = diag([5.0*payload.m; 5.0*payload.m; 5.0*payload.m]);
        kR = diag([8.81; 8.81; 8.81]);
        kW = diag([2.54; 2.54; 2.54]);
        
        % convert position and velocity from enu to ned
        x_ned = vec_enu_to_ned(x_enu);
        v_ned = vec_enu_to_ned(v_enu);
        xd_ned = vec_enu_to_ned(xd_enu);
        vd_ned = vec_enu_to_ned(vd_enu);
        ad_ned = vec_enu_to_ned(ad_enu);
        
        % error
        ex_ned = x_ned - xd_ned;
        ev_ned = v_ned - vd_ned;
        
        % prepare the mass estimated last time
        mass_est_last = payload.mass_estimation(:, iter-1);
        force_ff = feedforward_force_ctrl;
        [F_ff, mass_est] = (ad_ned, multirotor, ex_ned, ev_ned, mass_est_last, dt);
        
        % f
        f = (-kx*ex_ned - kv*ev_ned + F_ff);
        
        %Rd
        Rd = [vd_ned/norm(vd_ned) (hat_map(e3)*vd_dot)/(norm(hat_map(e3)*vd_dot)) e3];

        % eR , eW
        eR = 1/2*vee_map(Rd'*R - R'*Rd);
        eW = W - R'*Rd*Wd;

        % Set the last time J 
        J_est_last = payload.inertia_estimation(:, iter-1);

        moment_ff = feedward_moment_ctrl;
        [M_ff, J_est, icl] = moment_feedforward.feedforward_moment_use_adaptive_ICL(W, multirotor, eR, eW, J_est_last, icl, dt, iter, select_moment_adaptive_w_wo_ICL, SELECT_FILTER);
        

    
    













        