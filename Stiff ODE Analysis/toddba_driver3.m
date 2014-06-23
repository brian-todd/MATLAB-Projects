%Brian Todd
%4/8/2013
%Math 471
%Final Project - Part (1)
%-------------------------------------------------------------------------%
% ODE (1) -> y'' + 10^4*y = 0 , y(0) = 1,y'(0) = 1.
%We can transform this into a system and solve them seperately.
%---> y1' = y2  (1)   
%---> y2' = -10^4*y1  (2)  
%Use Backward Euler Method.

tic
clear
format long 

EPS = 5*10^-4;
nmax = 8.53*10^6;

f1 = @(y1,y2,t) y2;
f2 = @(y1,y2,t) -10^4*y1;
%Definitions of the system.

%Compare to the analytical solution.
tline = 0:1/nmax:1;
g = @(tline) cos(100*tline);
ysol = g(tline);

t0 = 0; tfin = 1; y01 = 1; y02 = 0;
%Declarations of initial values and intervals.

[t1, y1] = sys_euler_backward(f1,f2,t0,tfin,y01,y02,nmax);

error1 = abs((ysol(end) - y1(end)));
if error1 < EPS
    flag = 1;
else 
    flag = 0;
end  %Error condition for the Backward Euler Method on the system. 

if flag == 1
    fprintf('Iterations needed for Backward Euler Method is %.3g\n',nmax)
else 
    fprintf('The solutions did not converge within the error bound\n')
end

plot(t1,y1)
title('Backward Euler Method')

%-------------------------------------------------------------------------%
% Error Analysis
%Create a vector of errors and compare the doubles to make sure that they
%follow the error trend of Euler's Method.
nmax = 10000;

[~, y1] = sys_euler_backward(f1,f2,t0,tfin,y01,y02,nmax);  %Forward Euler.

tline = 0:1/nmax:1;
g = @(tline) cos(100*tline);
ysol = g(tline);

errB(1) = abs((ysol(end) - y1(end)));
%Error calculations for nmax  = 10000.

nmax = 20000;

[~, y1] = sys_euler_backward(f1,f2,t0,tfin,y01,y02,nmax);  %Forward Euler.

tline = 0:1/nmax:1;
g = @(tline) cos(100*tline);
ysol = g(tline);

errB(2) = abs((ysol(end) - y1(end)));
%Error calculations for nmax = 20000.

nmax = 40000;

[~, y1] = sys_euler_backward(f1,f2,t0,tfin,y01,y02,nmax);  %Forward Euler.

tline = 0:1/nmax:1;
g = @(tline) cos(100*tline);
ysol = g(tline);

errB(3) = abs((ysol(end) - y1(end)));
%Error calculations for nmax = 40000.

nmax = 80000;

[~, y1] = sys_euler_backward(f1,f2,t0,tfin,y01,y02,nmax);  %Forward Euler.

tline = 0:1/nmax:1;
g = @(tline) cos(100*tline);
ysol = g(tline);

errB(4) = abs((ysol(end) - y1(end)));
%Error calculations for nmax = 80000.

errRatio = [errB(3)/errB(4) errB(2)/errB(3) errB(1)/errB(2)]';
%Display results on the screen.

fprintf('The ratio of errors is %.015f\n',errRatio);

toc
%-------------------------------------------------------------------------%
%Results
% The Backward Euler Method converges to the solution using approximately
% 8.53*10^6 iterations. As is expected, our solution converges in fewer
% iterations when we are using Backward Euler as opposed to Forward Euler 
% because it is a more stable method for stiff equations, such as the one we
% dealt with. Another interesting observation is how the equation
% reacts when we have a smaller number of iterations. The equation appears
% to undergo some form of negative damping until we reach a small enough
% step size. This observation, along with the Backward Euler being more
% effective, indicate that this is a stiff equation. Additionally, the
% error decreases by half every time we double the amount of iterations,
% which is expected for Euler's Method.