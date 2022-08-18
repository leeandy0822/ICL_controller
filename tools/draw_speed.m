clear all, close all, clc;

t = 1:0.01:120;
c = ones(length(t),1);

x = [5*sin(t); 2*cos(t); 2*c'];
v = [5*cos(t) ; -2*sin(t) ; 0*c'];
a = [-5*sin(t) ; -2*cos(t) ; 0*c'];


x = [ 3*sin(t) ;  3*cos(t);   2*c'];
v = [ 0.1*3*cos(0.1*t) ; -3*0.1*sin(0.1*t) ;  0*c'];
a = [-3*0.1*0.1*sin(0.1*t) ; -3*0.1*0.1*cos(0.1*t) ;0*c'];

x = [2*sin(0.02*pi*t) ; 4*cos(0.02*pi*t)-4; 1*c'];
v = [2*0.02*pi*cos(0.02*pi*t) ; -4*0.02*pi*sin(0.02*pi*t) ; 0*c'];
a = [-2*0.02*0.02*pi*pi*sin(0.02*pi*t) ; -4*0.02*0.02*pi*pi*cos(0.02*pi*t) ; 0*c'];

figure(1);
plot3(x(1,:),x(2,:),x(3,:))
grid on
hold on

for i = 3000:50:length(t)
    quiver3(x(1,i),x(2,i),x(3,i),v(1,i)/5,v(2,i)/5,v(3,i)/5,'r',"LineWidth",0.4); 
end
