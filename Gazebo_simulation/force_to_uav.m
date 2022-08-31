function force_to_uav(u,uav,payload,iter,option)
    thrust = rosmessage('geometry_msgs/Vector3');
    yaw_R = rotz(rad2deg(uav.eul(1)));
    payload_R = reshape(payload.R(:,iter-1),[3,3]);

    relative_acc = [payload.a.X ; payload.a.Y ; 0] - [uav.a.X ; uav.a.Y ;0];
    gravity = [0 ; 0 ; 9.8];
    uav_mass = 1.6;

    payload_force = yaw_R'*payload_R*u';
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
    send(uav.pub, uav.msg);

end
