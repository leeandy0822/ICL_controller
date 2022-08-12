function force_to_uav(u,uav,payload)
    thrust = rosmessage('geometry_msgs/Vector3');
    yaw_R = rotz(rad2deg(uav.eul(1)));
    force_temp = 1/norm(u)*yaw_R'*payload.R*u';

    uav.msg.Roll = -asin(force_temp(2));
    uav.msg.Pitch = atan(force_temp(1)/force_temp(3));
    thrust.Z = norm(u);
    uav.msg.Thrust = thrust;
    send(uav.pub, uav.msg);

end
