classdef gazebo_distributor

    properties

        k = 0.12;

    end

    methods
        function distributed(self, u, uav1, uav2, uav3, uav4, payload, iter, option)

            u1 = u(1:3)';
            u2 = u(4:6)';
            u3 = u(7:9)';
            u4 = u(10:12)';
            uav1 = self.force_to_uav(u1, uav1, payload, iter, option);
            uav2 = self.force_to_uav(u2, uav2, payload, iter, option);
            uav3 = self.force_to_uav(u3, uav3, payload, iter, option);
            uav4 = self.force_to_uav(u4, uav4, payload, iter, option);
            
            % Compensate Neighbor Force
            % 1 -> 3, 4
            % 2 -> 3, 4
            % 3 -> 1, 2
            % 4 -> 1, 2
            roll1 = uav1.msg.Roll;
            roll2 = uav2.msg.Roll;
            roll3 = uav3.msg.Roll;
            roll4 = uav4.msg.Roll;

            pitch1 = uav1.msg.Pitch;
            pitch2 = uav2.msg.Pitch;
            pitch3 = uav3.msg.Pitch;
            pitch4 = uav4.msg.Pitch;

            roll_compensate1 = -self.k*(roll1 - roll3) - self.k*(roll1 - roll4);
            roll_compensate2 = -self.k*(roll2 - roll3) - self.k*(roll2 - roll4);
            roll_compensate3 = -self.k*(roll3 - roll1) - self.k*(roll3 - roll2);
            roll_compensate4 = -self.k*(roll4 - roll1) - self.k*(roll4 - roll2);
           
            pitch_compensate1 = -self.k*(pitch1 - pitch3) - self.k*(pitch1 - pitch4);
            pitch_compensate2 = -self.k*(pitch2 - pitch3) - self.k*(pitch2 - pitch4);
            pitch_compensate3 = -self.k*(pitch3 - pitch1) - self.k*(pitch3 - pitch2);
            pitch_compensate4 = -self.k*(pitch4 - pitch1) - self.k*(pitch4 - pitch2); 

            uav1.msg.Roll = uav1.msg.Roll + roll_compensate1;
            uav1.msg.Pitch = uav1.msg.Pitch + pitch_compensate1;

            uav2.msg.Roll = uav2.msg.Roll + roll_compensate2;
            uav2.msg.Pitch = uav2.msg.Pitch + pitch_compensate2;  

            uav3.msg.Roll = uav3.msg.Roll + roll_compensate3;
            uav3.msg.Pitch = uav3.msg.Pitch + pitch_compensate3;  

            uav4.msg.Roll = uav4.msg.Roll + roll_compensate4;
            uav4.msg.Pitch = uav4.msg.Pitch + pitch_compensate4;         
            
            send_to_ros(self, uav1, uav2, uav3, uav4);

 
        end
        % Caculate the force uav should apply
        function [uav] = force_to_uav(~,u,uav,payload,iter,option)
            thrust = rosmessage('geometry_msgs/Vector3');
            yaw_R = rotz(rad2deg(uav.eul(1)));
            payload_R = reshape(payload.R(:,iter-1),[3,3]);
        
            relative_acc = [payload.a.X ; payload.a.Y ; 0] - [uav.a.X ; uav.a.Y ;0];
            gravity = [0 ; 0 ; 9.8];
            uav_mass = 1.57;
        
            payload_force = yaw_R'*u';
            relative_force = uav.R'*uav_mass*(gravity + relative_acc);
            if option == "stop"
                relative_force = [0 ; 0 ; 0];
            end
            final_force = payload_force + relative_force;
            final_force_dir = final_force / norm(final_force);
        
        
            uav.msg.Roll = -asin(final_force_dir(2));
            uav.msg.Pitch = atan(final_force_dir(1)/final_force_dir(3));
            thrust.Z = norm(final_force);
            uav.msg.Thrust = thrust;

        end

        function send_to_ros(~,uav1, uav2, uav3, uav4)
            send(uav1.pub, uav1.msg);
            send(uav2.pub, uav2.msg);
            send(uav3.pub, uav3.msg);
            send(uav4.pub, uav4.msg);

        end


    end
end