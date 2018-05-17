function VisualSim(A,B,C,D,K,LG,y0,T,L,Name)

tspan = T(1,1):0.01:T(3,1);

% Plot calculations
[t,y,xout] = ssmodel2(A,B,C,D,K,LG,tspan,y0);
Y = y';
x = Y(:, 1)*0;  % Cart Position
th = Y(:, 1);   % Pendulum Angle
tspan = T(1,1):T(2,1):T(3,1);
len = length(tspan);
kickFlag = zeros(1,len);

PenPlot(t,y);

AnimatePendulumCart(th, x,  L/2, tspan, 1, kickFlag, Name);
