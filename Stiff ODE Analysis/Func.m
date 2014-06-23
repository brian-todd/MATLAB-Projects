function [F] = Func(y,z,i)
%FUNC Definition for the Nonlinear system ( part(c)).
a = 452013;
b = 123456;
h = 1/100;

y(1) = 1;
z(1) = 0;

F(1,1) = y - y(i) - h*z;
F(2,1) = z - z(i) + h*(a*sin(z) + b);
end