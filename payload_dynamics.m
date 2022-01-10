classdef payload_dynamics
    properties
        dt = 0.01;
        sim_t = 10;
        t
        iter

        % parameters
        m
        J
        g = 9.81

        % unit vector
        e1 = [1; 0; 0];
        e2 = [0; 1; 0];
        e3 = [0; 0; 1];
        
        % states
        x 
        v
        a

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
    end

    methods
        function dX = dynamics(obj, t , X , F)
            dX = zeros(6,1);
            dx = X(4:6);
            dv = obj.g*obj.e3 + (F/obj.m);
            dX(1:3) = dx;
            dX(4:6) = dv;
        end
    end
end
