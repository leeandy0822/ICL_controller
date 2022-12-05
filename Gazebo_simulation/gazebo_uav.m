classdef gazebo_uav
    properties
        % position
        x
        
        % orientation
        q
        eul
        R
        m

        % acceleration
        a 

        % ros subscriber
        sub

        % ros publisher
        msg
        pub

        % time
        t
    end

end
