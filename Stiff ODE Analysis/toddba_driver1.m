%Brian Todd
%4/8/2013
%Math 471
%Final Project - Part (1)
%-------------------------------------------------------------------------%
% ODE (1) -> y' + 10^6*y = 0 , y(0) = 1.
tic
clear

format long 
EPS = 5*10^-4;
nmax = 10^6;  %Number of discretization points.

f = @(t,y) -(10^6)*y;  %We take the form of y' = f(t,y).
t0 = 0; tfin = 1; y0 = 1;  %Declarations.

%Compare to the analytical solution.
tline = 0:1/nmax:1;
g = @(tline) exp(-10^6*tline);
ysol = g(tline);

[t1, y1] = forward_euler(f,t0,y0,tfin,nmax);  %Forward Euler.

error1 = abs((ysol(end) - y1(end)));
if error1 < EPS
	flag1 = 1;
else
    flag1 = 0;
end  %Error conditions for Forward Euler Method.

[t2, y2] = backward_euler(f,t0,y0,tfin,nmax);  %Backward Euler.
	
error2 = abs((ysol(end) - y2(end)));
if error2 < EPS
	flag2 = 1;
else
    flag2 = 0;
end  %Error conditions for Backward Euler Method.

%Use flags to determine if one, both, or neither converge.
if (flag1 == 1 && flag2 == 1)
    fprintf('Iterations needed for Forward Euler Method is %.0g\n',nmax)
    fprintf('Iterations needed for Backward Euler Method is %.0g\n',nmax)
elseif (flag1 == 1 && flag2 == 0)
     fprintf('Iterations needed for Forward Euler Method is %.0g\n',nmax)
elseif (flag1 == 0 && flag2 == 1)
     fprintf('Iterations needed for Backward Euler Method is %.0g\n',nmax)
else
    fprintf('The solutions did not converge within the error bound\n')
end

subplot(2,1,1)
plot(t1,y1)
title('Forward Euler Method')
subplot(2,1,2)
plot(t2,y2)
title('Backward Euler Method')

%-------------------------------------------------------------------------%
% Error Analysis
%Create a vector of errors and compare the doubles to make sure that they
%follow the error trend of Euler's Method.

nmax = 1000;

[~, y1] = forward_euler(f,t0,y0,tfin,nmax);  %Forward Euler.
[~, y2] = backward_euler(f,t0,y0,tfin,nmax);  %Backward Euler.

tline = 0:1/nmax:1;
g = @(tline) exp(-10^6*tline);
ysol = g(tline);

errF(1) = abs((ysol(end) - y1(end)));
errB(1) = abs((ysol(end) - y2(end)));
%Error calculations for nmax  = 1000.

nmax = 2000;

[~, y1] = forward_euler(f,t0,y0,tfin,nmax);  %Forward Euler.
[~, y2] = backward_euler(f,t0,y0,tfin,nmax);  %Backward Euler.

tline = 0:1/nmax:1;
g = @(tline) exp(-10^6*tline);
ysol = g(tline);

errF(2) = abs((ysol(end) - y1(end)));
errB(2) = abs((ysol(end) - y2(end)));
%Error calculations for nmax = 2000.

nmax = 4000;

[~, y1] = forward_euler(f,t0,y0,tfin,nmax);  %Forward Euler.
[~, y2] = backward_euler(f,t0,y0,tfin,nmax);  %Backward Euler.

tline = 0:1/nmax:1;
g = @(tline) exp(-10^6*tline);
ysol = g(tline);

errF(3) = abs((ysol(end) - y1(end)));
errB(3) = abs((ysol(end) - y2(end)));
%Error calculations for nmax = 4000.

nmax = 8000;

[~, y1] = forward_euler(f,t0,y0,tfin,nmax);  %Forward Euler.
[~, y2] = backward_euler(f,t0,y0,tfin,nmax);  %Backward Euler.

tline = 0:1/nmax:1;
g = @(tline) exp(-10^6*tline);
ysol = g(tline);

errF(4) = abs((ysol(end) - y1(end)));
errB(4) = abs((ysol(end) - y2(end)));
%Error calculation for nmax = 8000.

[errF(3)/errF(4) errF(2)/errF(3) errF(1)/errF(2)]'
[errB(3)/errB(4) errB(2)/errB(3) errB(1)/errB(2)]'
%Ratio of errors.

toc
%-------------------------------------------------------------------------%
%Results
% Forward Euler Method converges if the number of iterations is on the order
% of 10^6. It is not surprising that this is the case, considering the huge
% 10^6 term that is attached to the function. The solution of the equation
% is exp(-10^6*t), which is rather difficult to evaluate and contributes to
% the huge number of iterations. By design, this is a stiff equation, which
% makes it difficult to evaluate for anything but a small step size with
% Forwad Euler. The plot makes this equation look as though it is
% undergoing huge amounts of damping, which gives it the unigue
% perpendicular shape. 
% Additionally, by changing the nmax value, we can see that when
% you double the amount of iterations your error value is halved. However, 
% this is very difficult to see when we have our 10^6 term in the function.
% In order to observe this action, a lower ordered term must be used.