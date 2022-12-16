function wrench_to_ros(uav)

  
   w_dot = uav.control(2:4);
   uav.msg.Thrust.Z = uav.control(1);
   uav.msg.Torque.X = w_dot(1);
   uav.msg.Torque.Y = w_dot(2);
   uav.msg.Torque.Z = w_dot(3);

   send(uav.pub, uav.msg);
end