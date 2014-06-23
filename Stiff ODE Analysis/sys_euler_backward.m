function [t,y1] = sys_euler_backward(f1,f2,t0,tfin,y01,y02,n)
%SYS_EULER_BACKWARD Solves two dimensional linear ODEs with Backward Euler
%   Can only take linear equations, used specifically for problem 1 (b).
%   Iteratively solves two first order ODEs by using the Backward Euler
%   Method to implicitly find each step.

h = (tfin - t0)/n;  %Step size.

t = [t0 zeros(1,n)];  
y1 = [y01 zeros(1,n)];
y2 = [y02 zeros(1,n)];
%Initializing the vectors to be used in the loop.

for i =1:n
	t(i+1) = t(i) + h;
    
    y1(i+1) = (y1(i) + h*y2(i))/(1-h^2*10^4);
    y2(i+1) = y2(i) - h*10^4*((y1(i)+h*y2(i))/(1-h^2*10^4));
    %Works for the linear equation in part (b) of problem 1. These
    %equations are implicitly derived.
end
%Calculates t,y1,y2 vectors for the solution.
end