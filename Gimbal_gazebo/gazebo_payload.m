classdef gazebo_payload
    properties

        traj_mode
        total_step
        cur_t % for gazebo
        last_t
        t % for plot
        
        % parameters
        m
        J
        g = 9.81;

        % grasp matrix
        p1
        p2
        p3
        p4
            
        % CoG vector 
        body2CoG =[0.08; 0.08; 0.00];

        % control grasp matrix
        B 

        % unit vector
        e1 = [1; 0; 0];s
        e2 = [0; 1; 0];
        e3 = [0; 0; 1];

        % states
        x 
        xd
        v
        a
        R
        q
        eul
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
        u4

        % ros publisher
        msg
        pub
    end

    
end
