classdef payload_dynamics
    properties

        traj_mode
        dt = 0.01;
        sim_t = 30;
        t
        iter
        freq
        
        % parameters
        m
        J
        g = 9.81;

        length = 1.0
        width = 0.8;
        height = 0.2;

        % grasp matrix
        
        p1 = [ 0 ; 2 ; 0]*0.15;
        p2 = [-1*sqrt(3)  ; -1 ; 0]*0.15;
        p3 = [ 1*sqrt(3) ; -1 ; 0]*0.15;
            
%         p1 = [0.16; 0.3; 0];
%         p2 = [-0.29; -0.1; 0];
%         p3 = [0.37; 0.04; 0];
        % CoG vector 
        body2CoG =[0.08; 0.08; 0.00];

        % control grasp matrix
        B 
        % real control grasp matrix by CoG drift
        B_real

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
        translation_estimation
        rotation_estimation

        % control input
        force
        moment
        u1
        u2
        u3

        % for optimization
        energy 
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
