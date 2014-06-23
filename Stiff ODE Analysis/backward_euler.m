function [t,y] = backward_euler(f, t0, y0, tfin, n)
%BACKWARD_EULER Solves a diff eq using the Backward Euler Method 
%	Provides an Euler approximation to an ODE using the backward 
%   method, requires a function, initial t and y positions, and 
%   a final position as well the number of iterations.

h = (tfin - t0)/n;  %Calculates step size.

t = [t0 zeros(1,n)];  
y = [y0 zeros(1,n)];
%Initialize t and y as vectors.

for i =1:n
	t(i+1) = t(i) + h;
    y(i+1) = y(i)/(1 + h*10^6);  %Implicit solution for Backward Euler.
end
%Calculates t and y vectors for the solution. Specfically for the first
%problem in part (1).
end