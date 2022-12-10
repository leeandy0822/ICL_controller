classdef multirotor_dynamics
    properties
        % simulation time
        dt = 0.01;
        sim_t = 10;
        t
        iter
        % parameters
        m
        J
        d
        c_tau
        g = 9.81;
        allocation_matrix
        allocation_matrix_inv
        % unit vector
        e1 = [1; 0; 0];
        e2 = [0; 1; 0];
        e3 = [0; 0; 1];
        % states
        x
        v
        R
        W
        dW
        % errors
        ex
        ev
        eR
        eW
        % estimation value
        mass_estimation
        inertia_estimation
        % control input
        force_moment
        rotor_thrust
        body2CoG = [0.15; 0.05; 0];
        F_disturbance
        
        % distrubition
        distribution_matrix
        distribution_matrix_inv
        uav1_pos
        uav2_pos
        uav3_pos

        
    end
    methods
        function dX = dynamics(obj, t, X, F, alpha)
            dX = zeros(18, 1);
            R_now = reshape(X(7:15), 3, 3);
            W_now = X(16:18);
            f = F(1);
            M = F(2:4);
            
            dx = X(4:6);
            dv = obj.g*obj.e3 - (f/obj.m)*R_now*obj.e3 - R_now*alpha;
            dR = R_now*hat_map(W_now);
            dW = obj.J\(-vec_cross(W_now, obj.J*W_now) + M);
            
            dX(1:3) = dx;
            dX(4:6) = dv;
            dX(7:15) = reshape(dR, 9, 1);
            dX(16:18) = dW;
        end
    end
end
