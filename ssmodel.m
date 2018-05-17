function [t,Y,xout] = ssmodel(A,B,C,D,K,t,x0)

% Length of matrix (e.g 0:30 = 31)
sig = length(t);

% Output Initial Conditions (all 0's
Y = zeros(1,sig);
U = zeros(1,sig);
xout = zeros(2,sig)

% Initial Conditions
xout(:,1) = x0;
X = x0;

% Initial input and output
U(1) = C(1)*X(1) + C(2)*X(2);
Y(1) = C(1)*X(1) + C(2)*X(2) + D(1)*U(1)

for i = 2:sig %Loop from 2 till sig
    U(i) = -K(1)*X(1) - K(2)*X(2);
    
    xdot(1) = A(1,1)*X(1) + A(1,2)*X(2) + B(1)*U(i);
    xdot(2) = A(2,1)*X(1) + A(2,2)*X(2) + B(2)*U(i);    
    
    h = t(i) - t(i-1)
    
    X(1)= X(1)+h*xdot(1);
    X(2)= X(2)+h*xdot(2);
    
    xout(:,i) = X;
    
    Y(i) =C(1)*X(1) + C(2)*X(2) + D(1)*U(i);


end
U
