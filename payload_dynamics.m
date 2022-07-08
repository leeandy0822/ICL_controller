classdef payload_dynamics
    properties
        dt = 0.01;
        sim_t = 30;
        t
        iter

        % parameters
        m
        J
        g = 9.81;

        length = 1.0
        width = 0.8;
        height = 0.2;

        % grasp matrix
        p1 = [0.5 ; 0 ; -0.1];
        p2 = [-0.5 ; 0.4; -0.1];
        p3 = [-0.5 ; -0.4 ; -0.1];
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
        
        q1
        q2
        q3

        a1
        a2
        a3
        % errors
        ex 
        ev
        eR
        eW
        
        % estimation value
        mass_estimation
        inertia_estimation

        % control input
        force
        moment
        u1
        u2
        u3
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
            dx = X(4:6);
            dv = obj.g*obj.e3 + (f/obj.m);
            dR = R_now*hat_map(W_now);
            dW = obj.J\(-vec_cross(W_now, obj.J*W_now) + M);

            % Output 
            dX(1:3) = dx;
            dX(4:6) = dv;
            dX(7:15) = reshape(dR, 9, 1);
            dX(16:18) = dW;
        end
    end
end
