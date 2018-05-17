function xHatDot = Equation2(A,xHat,B,LG,y)

xHatDot= A*xHat + B*U + LG(y-C*xHat);