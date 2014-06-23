%Brian Todd
%4/17/2013
%Math 471
%Part (b)
%-------------------------------------------------------------------------%
clear 
tic
format long 

n = 100;  %Time steps.
M = 16;  %Spatial Discretization points.
alpha = 0:(2*pi/(M-1)):2*pi;  %Alpha vector.

x0 = [(4 + cos(3.*alpha)).*cos(alpha); (4 + cos(3.*alpha)).*sin(alpha)]';
%Initial shape. 
x = x0;  t = [0 4];  h = (t(2) - t(1))/n;  %Declarations.
t = zeros(M,1);  time = zeros(100,1);

for k = 1:100
    tic
    t(k+1) = t(k) + h;  %Time step.
    
    x1alpha = real(fdiff(x(:,1)',M));
    x2alpha = real(fdiff(x(:,2)',M));
    x1alpha2 = real(fdiff(x1alpha,M));
    x2alpha2 = real(fdiff(x2alpha,M));
    %Calculate the first and second derivative of each for each
    %x1a,x2a,x1aa,x2aa.

    xlength = sqrt(x1alpha.^2 + x2alpha.^2);  %Length, vector of scalars.
    xnorm = [(1./xlength).*x2alpha; -(1./xlength).*x1alpha]; %Normal vector
    
    xhold = ((x2alpha.*x1alpha2 - x1alpha.*x2alpha2)./(xlength.^3));
    %Mkes multiplying easier.
    f = [xhold'.*xnorm(1,:)' xhold'.*xnorm(2,:)'];
    %This is the function we use in x' = f(x,t) for Euler's Method.
    
    %Forward Euler.
    x = x + h.*f;    
    time(k) = toc;
end
time_per_time = sum(time)/k;


%-------------------------------------------------------------------------%
%Results 
% ----------------------------------------------
% |    M                 Time/Time Step        |
% |    16                2.29028347e-04        |
% |    32                2.76607410e-04        |
% |    64                3.31042892e-04        |
% |    128               5.00501176e-04        |
% |    256               7.09748562e-04        |
% |____________________________________________|
%
% The amount of time required per time step seems to increase as the as we
% increase the amount of spatial discretization points. The time cost for 
% the algorithm can be taken to be approximately .02275375. This number is
% derived from finding the average time difference across all of the
% points. 