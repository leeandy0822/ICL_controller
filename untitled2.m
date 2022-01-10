tspan = [0 9];
y0 = 0;
[t,y] = ode45(@(t,y) 2*t, tspan, y0);

plot(t,y,'-o')
