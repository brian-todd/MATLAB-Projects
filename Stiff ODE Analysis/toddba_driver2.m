%Brian Todd
%4/8/2013
%Math 471
%Final Project - Part (1)
%-------------------------------------------------------------------------%
% ODE (1) -> y'' + 10^4*y = 0 , y(0) = 1,y'(0) = 1.
%We can transform this into a system and solve them seperately.
%---> y1' = y2  (1)   
%---> y2' = -10^4*y1  (2)  
%Use Forward Euler Method.

tic
clear
format long 

EPS = 5*10^-4;
nmax = 8.7*10^6;

f1 = @(y1,y2,t) y2;
f2 = @(y1,y2,t) -10^4*y1;
%Definitions of the system.

%Compare to the analytical solution.
tline = 0:1/nmax:1;
g = @(tline) cos(100*tline);
ysol = g(tline);

t0 = 0; tfin = 1; y01 = 1; y02 = 0;
%Declarations of initial values and intervals.

[t1, y1] = sys_euler_forward(f1,f2,t0,tfin,y01,y02,nmax);

error1 = abs((ysol(end) - y1(end)));
if error1 < EPS
	flag = 1;
else
    flag = 0;
end  %Error condition for the Forward Euler Method on the system.

if flag == 1
    fprintf('Iterations needed for Forward Euler Method is %.2g\n',nmax)
else 
    fprintf('The solutions did not converge within the error bound\n')
end

plot(t1,y1)

%-------------------------------------------------------------------------%
% Error Analysis
%Create a vector of errors and compare the doubles to make sure that they
%follow the error trend of Euler's Method.
nmax = 10000;

[~, y1] = sys_euler_forward(f1,f2,t0,tfin,y01,y02,nmax);  %Forward Euler.

tline = 0:1/nmax:1;
g = @(tline) cos(100*tline);
ysol = g(tline);

errF(1) = abs((ysol(end) - y1(end)));
%Error calculations for nmax  = 100.

nmax = 20000;

[~, y1] = sys_euler_forward(f1,f2,t0,tfin,y01,y02,nmax);  %Forward Euler.

tline = 0:1/nmax:1;
g = @(tline) cos(100*tline);
ysol = g(tline);

errF(2) = abs((ysol(end) - y1(end)));
%Error calculations for nmax = 200.

nmax = 40000;

[~, y1] = sys_euler_forward(f1,f2,t0,tfin,y01,y02,nmax);  %Forward Euler.

tline = 0:1/nmax:1;
g = @(tline) cos(100*tline);
ysol = g(tline);

errF(3) = abs((ysol(end) - y1(end)));
%Error calculations for nmax = 400.

nmax = 80000;

[~, y1] = sys_euler_forward(f1,f2,t0,tfin,y01,y02,nmax);  %Forward Euler.

tline = 0:1/nmax:1;
g = @(tline) cos(100*tline);
ysol = g(tline);

errF(4) = abs((ysol(end) - y1(end)));

errRatio = [errF(3)/errF(4) errF(2)/errF(3) errF(1)/errF(2)]';
fprintf('The ratio of errors is %.015f\n',errRatio);

toc
%-------------------------------------------------------------------------%
%Results
% The Forward Euler method allows the ODE to converge in about 8.7*10^6
% iterations. As is expected for the Forward Euler Method, when the number
% of iterations is doubled, the error is halved. This problem is
% interesting because when our number of iterations is too small, we see a
% plot that seems to be undergoing some type of negative damping. However,
% this affect dissipates as we add more iterations. This would be an
% indicator that our ODE is stiff, meaning that the method does not work
% particularly well unless we have a very small step size. 