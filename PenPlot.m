function PenPlot(t,y)
% Plot simulation graph
plot(t,y)
hold on;
plot(t,y*0);
xlabel('Time (s)');
ylabel('Angle (radians)');
title('Angle of pendulum over time');