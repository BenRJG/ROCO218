clear all % Removes Variables
close all %Closes any windows (such as plots)
clc       % Clears command window


%       \   Ym
%      / \  ^
%    L/ Yp\ |
%    /  ^  \|m
%  \/   |-^-O---> Xm
%   \   | ?/
%    \  | /
%     \ |/
%      \/________>Xp
% ===========
% |||||||||||
% ===========
%   O     O

% m  => Pendulum mass
% L  => Length to center of mass
% o  => Angle to vertical
% up => Displacement of pivot
% u  => Coefficient of viscosity

syms L m u; % Pendulum Variables
syms a b c d; % Substitute Variables

% Input variables
L = 0.64 %  m
m = 0.314 % kg
u = 0.05

% Contstant & pendulum equation
g = 9.81; % m/s^2 gravity constant
I = (m*L^2)/12; % Pendulum Equation

% Substitution variables
a = -u/(I + m*L^2)
b = m*g*L/(I + m*L^2)
c = m*L/(I + m*L^2)

% Matrices
A_Inv = [0 1; b a]
A_NonInv = [0 1; -b a]
B = [c; a*c]
C = [1 0]
D = 0

% Eigen Values of pendulum
EVI = EigenValues(A_Inv);
EVI

EVNI = EigenValues(A_NonInv);
EVNI

tspan = [0; 0.1; 30]
y0 = [pi; 0.1]

% VisualSim(A_NonInv,B,y0,tspan,L,"Non-Inverted Pendulum Simulation")
% VisualSim(A_Inv,B,y0,tspan,L,"Inverted Pendulum Simulation") 

P = 8*[-1 -1.1];

K = place(A_Inv,B,P)

PL = 20 * [-1 -1.1];

LG = place(A_Inv,C',PL)

% Plot calculations
%[t,y] = ode45(@(t,y)Equation(A_Inv,y,B,K),[0 1],y0)
%[t,y,xout] = ssmodel(A_Inv,B,C,D,K,0:0.01:1,y0);
%[t,y,xout] = ssmodel2(A_Inv,B,C,D,K,LG,0:0.01:1,y0);

% Plot simulation graph
%PenPlot(t,y)

VisualSim(A_Inv,B,C,D,K,LG,y0,tspan,-L,"Inverted Pendulum Simulation") 

