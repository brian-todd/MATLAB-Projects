%Brian Todd
%4/17/2013
%Math 471
%Part (c)
%-------------------------------------------------------------------------%
clear 
tic
format long 

N = 200;  %Time steps.
M = 64;  %Spatial Discretization points.
alpha = 0:(2*pi/(M-1)):2*pi;  %Alpha vector.

x0 = [(4 + cos(3.*alpha)).*cos(alpha); (4 + cos(3.*alpha)).*sin(alpha)]';
%Initial shape. 
x = x0;
t = [0 4];   h = (t(2) - t(1))/N;  %Step size declaration.

for k = 1:N
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
end
%This loop determines how our xlength vector looks at t = 4. Now, we must
%apply the trapezoidal rule on it.

a = 0; b = 2*pi; h = (b-a)/N;  %Declarations for Trapezoidal Rule 
                               %step size.                               
T_sum = h*sum(xlength);

%-------------------------------------------------------------------------%
% Results
% _____________________________________________
%|   N        Error             Error Ratio   |
%|  6400        -                     -       |
%|  1600      .773047056         2.333699972  |
%|   800     1.804059893         2.143730071  |
%|   400     3.867417443         2.069797346  |
%|   200     8.004770363              -       |
% ____________________________________________|
%
% After comparing all of the results, we see that there is an error ratio
% of approximately 2. This indicates that when the number of iterations is
% doubled than the error will decrease by half, which is to say that this
% algorithm is O(n). The most expensive operations arise from the fdiff
% function which has an FFT and IFFT. Other opertaions that have a high
% cost include all of the vector operations, which operate at n^2 for each
% one. 