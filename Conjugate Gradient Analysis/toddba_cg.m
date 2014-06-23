function [x] = toddba_cg(A,b,n)
%Solves an mxm symmetric, positive definite matrix by the 
%method of conjugate gradients
tic
EPS = 10^-12;  %epsilon for stopping cond.

x = zeros(n,1);  
res = b;
p = res;
reso = res'*res;
%Initializations, res is normally b - Ax; however, x is the zero vector
%here, rendering res to b.

for i=1:50000
    Ap = A*p; %Simplifies later computations, 
    
    alpha = (res'*res)/(p'*Ap);  %Step length
    x = x + alpha*p;  %Approx. sol.
    res = res-alpha*Ap;  %Residuals
    resn = res'*res;
    
    residualnorm = norm(res); %norm for stopping condition
    
    if residualnorm<EPS
        break;
    end  %Stopping condition, breaks loop if residual norm is small enough
    
    improv = resn/reso;  %Improvement
    p = res + improv*p;  %Search direction
    
    reso = resn;
end
%This loop iteratively applies the conjugate gradient method, it has a
%stopping condition based on the residuals approaching EPS.
toc
fprintf('%d iterations \n',i)  %Number of iterations
end