%Brian Todd
%4/17/2013
%Math 471
%Part (a)
%-------------------------------------------------------------------------%
clear 
tic
format long 

N = 100;  %Time steps.
M = 32;  %Spatial Discretization points.
alpha = 0:(2*pi/(M-1)):2*pi;  %Alpha vector.

x0 = [(4 + cos(3.*alpha)).*cos(alpha); (4 + cos(3.*alpha)).*sin(alpha)]';
%Initial shape. 
x = x0;  t = [0 4];  h = (t(end) - t(1))/N;  %Declarations.
hold on
plot(x(:,1),x(:,2),'-r')

for k = 1:N+1
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
    
    if vpa(t(k),2) == 1
        plot(x(:,1),x(:,2),'-b') 
    elseif vpa(t(k),2) == 2
        plot(x(:,1),x(:,2),'-g')
    elseif vpa(t(k),2) == 3
        plot(x(:,1),x(:,2),'-m')
    elseif vpa(t(k),2) == 4
        plot(x(:,1),x(:,2),'-c')
    end
    %This switching statement is equivalent to plotting at t = [0 1 2 3 4];
end
hold off
%-------------------------------------------------------------------------%
%Results 
% The program draws out a closed curve that evolves slowly over all time
% steps. The initial curve eventually leads to a series of smaller curves
% that seem to come to a point outside the right bound of the curve.