function [payload, traj_handle] = simulation(payload, traj_handle, ctrl, icl_trans, icl_rot)

    dt = payload.dt;
    h = waitbar(0,'please wait');
    
    for i= 2:length(payload.t)
        str=['Calculating...',num2str(round(i/length(payload.t)*100,1)),'%'];
        waitbar(i/length(payload.t),h,str)
        t_now = payload.t(i);
        % desire trajectory
        traj_handle.traj(:,i) = traj_handle.traj_generate(t_now,payload.traj_mode);
        Xd = traj_handle.traj(1:9, i);
 

        % Add the CoG effect state
        W = payload.W(:,i-1);
        dW = payload.dW(:,i-1);
        R = reshape(payload.R(:,i-1),3,3);
        e3 = [0 0 1]';

        %% Controller
        [Fd, force_error, translation_est, icl_trans] = ctrl.force_ctrl(i,payload , Xd,  icl_rot,icl_trans,dt);
        Fd
        % Fd is three dimensional vector
        f = Fd'*R*e3;
        
        b1d = [1 ; 0 ; 0];
        b3d = Fd/norm(Fd);
        b2d = vec_cross(b3d, b1d);
        b2d = b2d / norm(b2d);
        b1d_proj = vec_cross(b2d, b3d);
        Rd = [b1d_proj b2d b3d];

        [Md, moment_error, rotation_est, icl_rot] = ctrl.moment_ctrl(i, payload, Xd, icl_rot, icl_trans,Rd,dt);
    
        icl_trans.current_force = f;
        icl_rot.current_moment = Md;

        % Add the CoG effect state
         
        alpha_relative = hat_map(dW)*payload.body2CoG + hat_map(W)*hat_map(W)*payload.body2CoG;
        fprintf("Translation force : %.2f %.2f %.2f\n", alpha_relative(1), alpha_relative(2), alpha_relative(3))
        Fd_new = Fd + payload.m*R*alpha_relative;
        Md_new = Md + hat_map(payload.body2CoG)*R'* Fd;

        
        %% Calculate next step dynamics
        X0 = [vec_enu_to_ned(payload.x(:,i-1)); vec_enu_to_ned(payload.v(:,i-1));
            reshape(reshape(payload.R(:, i-1), 3, 3), 9, 1); payload.W(:, i-1)];
    
        control = [Fd_new ; Md_new];
        error = [force_error moment_error];
        [T, X_new] = ode45(@(t, x) payload.dynamics(t, x, control), [0, dt], X0, control);
    
        %% record
        payload.x(:,i) = vec_ned_to_enu(X_new(end,1:3));
        payload.v(:,i) = vec_ned_to_enu(X_new(end,4:6));
        payload.R(:, i) = X_new(end, 7:15);
        payload.W(:, i) = X_new(end, 16:18);
        payload.Rd(:, i) =  reshape(payload.R(:, i), 9, 1);
        payload.ex(:,i) = error(1:3);
        payload.ev(:,i) = error(4:6);
        payload.eR(:,i) = error(7:9);
        payload.eW(:,i) = error(10:12);
        payload.translation_estimation(:,i) = translation_est;
        payload.rotation_estimation(:,i) = rotation_est;
        payload.force(:,i-1) = Fd;
        payload.moment(:,i-1) = Md;
    end

end

            