clear all, close all, clc;

rosinit("http://leeandy-MSI:11311");
core = ros.Core;
node = ros.Node('/Test1');
pub = ros.Publisher(node, '/robotname', 'std_msgs/String', 'DataFormat','struct');
sub = ros.Subscriber('/robotname', "DataFormat", "struct");
msg = rosmessage(pub);
msg.Data = 'robot1';
n = 0;
while(n<200)
    pause(0.5);
    send(pub, msg);
    receive(sub, 10);
    n= n+1;
end
clear('pub','node')
clear('master');