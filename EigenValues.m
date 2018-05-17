function y = EigenValues(A) %creating funtion
%defining function
syms T;

t = det(A-T*[1 0; 0 1]);



T = solve((t==0),T);

y=double(T);