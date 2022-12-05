classdef payload_dynamics
    properties

        traj_mode
        dt = 0.01;
        sim_t = 30;
        t
        cur_t % for gazebo
        iter
        freq
        
        % parameters
        m
        J
        g = 9.81;

        % grasp matrix
        p1
        p2
        p3
            
        % CoG vector 
        body2CoG =[0.08; 0.08; 0.00];

        % control grasp matrix
        B 

        % unit vector
        e1 = [1; 0; 0];
        e2 = [0; 1; 0];
        e3 = [0; 0; 1];

        % states
        x 
        v
        R
        Rd
        W
        dW

        % errors
        ex 
        ev
        eR
        eW
        
        % estimation value
        translation_estimation
        rotation_estimation

        % control input
        force
        moment
        u1
        u2
        u3

        %% For Gazebo simulation
        % position
        pos_x
        pos_y
        pos_z
        pos
        
        % orientation
        q_x
        q_y
        q_z
        q_w
        q
        eul

        % ros publisher
        msg
        pub
    end

    methods
        function dX = dynamics(obj, t , X , control)
            
            % state
            dX = zeros(18,1);

            R_now = reshape(X(7:15), 3, 3);
            W_now = X(16:18);
            
            % input
            f = control(1:3);
            M = control(4:6);

            % Next state 
            
            dv = obj.g*obj.e3 - (f/obj.m);
            dR = R_now*hat_map(W_now);
            dOmega = obj.J\(-vec_cross(W_now, obj.J*W_now) + M);
            
            dx = X(4:6);
            % Output 
            dX(1:3) = dx;
            dX(4:6) = dv;
            dX(7:15) = reshape(dR, 9, 1);
            dX(16:18) = dOmega;
        end
    end
end
