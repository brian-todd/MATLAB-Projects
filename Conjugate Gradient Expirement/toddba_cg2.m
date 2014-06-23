function [x] = toddba_cg2(A,b,n)
%This function iteratively solves symmetric, positive definite matrices
%using the conjugate gradient method, and also plots the residuals and 
%error estimates on a semi-logarithmic plot. The time it takes to perform
%this is recorded.

%-------------------------------------------------------------------------%
%Method of Conjugate Gradients for Ax = b

format long
tic

x = zeros(n,1);  
res = b;
p = res;
reso = res'*res;
CA = sqrt(cond(A));
%Initializations, res is normally b - Ax; however, x is the zero vector
%here, rendering res as just b.

for i=1:500
    Ap = A*p; %Simplifies later computations, 
    
    alpha = (res'*res)/(p'*Ap);  %Step length
    x = x + alpha*p;  %Approx. sol.
    res = res-alpha*Ap;  %Residuals
    
    norm_res(i) = double(norm(res));
    norm_bAx(i) = double(norm(b-A*x));
    CN(i) = double(2*((CA-1)/(CA+1)).^i);
    
    resn = res'*res;
    improv = resn/reso;  %Improvement
    p = res + improv*p;  %Search direction
    
    reso = resn;
end
%This loop iteratively applies the conjugate gradient method, it has a
%stopping condition based on the residuals approaching EPS.

%-------------------------------------------------------------------------%
%Plots

semilogy(norm_res,'-b')   %Plots computed residual norms 
hold all
semilogy(norm_bAx,'-r')   %Plots actual residual norms
hold all
semilogy(CN,'-g')   %Plots the estimate theorem

toc

end