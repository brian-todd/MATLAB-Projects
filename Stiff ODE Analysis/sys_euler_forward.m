function [t,y1] = sys_euler_forward(f1,f2,t0,tfin,y01,y02,n)
%SYS_EULER_FORWARD Solves a second order ODE using Euler's Method 
%   Takes a second order ODE that has been transformed into a system and
%   solves the system of equations of the form y'n(t) = f(t,y). Takes in
%   two functions f1,f2 and t boundarys. Also, reads in the initial values
%   for y so this may be solved exactly (n is step size).

h = (tfin - t0)/n;  %Step size.

t = [t0 zeros(1,n)];  
y1 = [y01 zeros(1,n)];
y2 = [y02 zeros(1,n)];
%Initializing the vectors to be used in the loop.

for i =1:n
	t(i+1) = t(i) + h;
	y1(i+1) = y1(i) + h*f1(y1(i),y2(i),t(i));
    y2(i+1) = y2(i) + h*f2(y1(i),y2(i),t(i));
end
%Calculates vectors of solutions for y1,y2 and t. We take the vector y1 to
%be our solution. Works for linear problems.
end