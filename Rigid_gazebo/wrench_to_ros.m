function wrench_to_ros(uav)
   thrust = rosmessage('geometry_msgs/Vector3');
   Inertia = diag([0.0347563,0.0458929,0.0977]);
   w_dot = Inertia^-1*uav.control(2:4);

   thrust.Z = uav.control(1);
   uav.msg.Thrust.Z = uav.control(1);
   uav.msg.Torque.X = w_dot(1);
   uav.msg.Torque.Y = w_dot(2);
   uav.msg.Torque.X = w_dot(3);

   send(uav.pub, uav.msg);
end