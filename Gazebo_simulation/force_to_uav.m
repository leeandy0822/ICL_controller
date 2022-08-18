function force_to_uav(u,uav,payload,iter)
    thrust = rosmessage('geometry_msgs/Vector3');
    yaw_R = rotz(rad2deg(uav.eul(1)));
    payload_R = reshape(payload.R(:,iter-1),[3,3]);
    force_temp = 1/norm(u)*yaw_R'*payload_R*u';

    uav.msg.Roll = -asin(force_temp(2));
    uav.msg.Pitch = atan(force_temp(1)/force_temp(3));
    thrust.Z = norm(u);
    uav.msg.Thrust = thrust;
    send(uav.pub, uav.msg);

end
