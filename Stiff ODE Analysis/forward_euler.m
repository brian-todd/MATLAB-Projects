function [t,y] = forward_euler(f, t0, y0, tfin, n)
%FORWARD_EULER Solves a differential equation with Forward Euler Method.
%   Uses the Forward Euler Method to approximate a solution to a 
%   differential equation that is of the form y' = f(t,y). Requires a 
%   function, initial points for t and y, as well as a final point for t. 
%   Also, requires iterations n.

h = (tfin - t0)/n;  %Calculate step size.

t = [t0 zeros(1,n)];  
y = [y0 zeros(1,n)];
%Initialize t and y as vectors.

for i =1:n
	t(i+1) = t(i) + h;
	y(i+1) = y(i) + h*f(t(i),y(i));
end
%Calculates t and y vectors for the solution.
end