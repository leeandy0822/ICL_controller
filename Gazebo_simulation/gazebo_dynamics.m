classdef gazebo_dynamics
    properties
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
        R

        % ros subscriber
        sub

        % ros publisher
        msg
        pub

        % time
        t
    end

end
