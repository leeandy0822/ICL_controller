clear all, close all, clc;

t = 1:0.01:60;

x = [5*sin(t); 2*cos(t); 0.3*sin(t)];
v = [5*cos(t) ; -2*sin(t) ; 0.3*cos(t)];
a = [-5*sin(t) ; -2*cos(t) ; -0.3*sin(t)];




figure(1);
plot3(x(1,:),x(2,:),x(3,:))
grid on
hold on

for i = 3000:50:length(t)
    quiver3(x(1,i),x(2,i),x(3,i),v(1,i)/5,v(2,i)/5,v(3,i)/5,'r',"LineWidth",0.4); 
end
