%Driver 8
%Determine when CG converges to a solution in more than n values, for an
%nxn matrix. This is a solution to 3b.
%-------------------------------------------------------------------------%
%Test 1 - Test how the convergence rate of CG is affected when the
%eigenvalues are very small (close to zero).

n = 100;
b = ones(n,1);

v = [.000001 .0000005 .0000000003 .00002 zeros(n-4,1)'];
D = diag(v);
[U, ~] = qr(rand(n));
A = U'*D*U;
%Random SPD matrix with 4 eigenvalues that are close to zero.

x = toddba_cg(A,b,n);

norm(x-A\b)
%See how accurate the solution is compared to matlabs function.

% Results
% This takes over 50000 iterations (the max allowed by my function) and
% still does not return an accurate solution for n =100, as indicated by a 
% on the order of e+26.
%-------------------------------------------------------------------------%
%Test 2 - Huge eigenvalues(e+23) on a 100x100 random SPD matrix.

n = 100;
b = ones(n,1);

v = [2e+23 2.5e+23 1e+23 4e+23 ones(n-4,1)'];
D = diag(v);
[U, ~] = qr(rand(n));
A = U'*D*U;
%Random SPD matrix with very large eigenvalues.

x = toddba_cg(A,b,n);

norm(x-A\b)
%Observe the accuracy of the solution 

% Results 
% This test again takes more than the maximum of 50000 iterations to
% complete the algorithm. Additionally, the residual indicated the solution
% was not very accurate, as it was on the order of e-04. This is certainly
% closer than our last test though.
%-------------------------------------------------------------------------%
%Conclusions
%
% These tests indicate to us how the spectrum of eigenvalues causes CG to
% converge in greater than n iterations. The first test indicated that
% extremely small eigenvalues cause CG to converge in an extremely large
% number of iterations ( >50000). The same can be said about extremely
% large eigenvalues, though the residuals were smaller for large
% eigenvalues. It is possible that this is due to a loss in orthogonality
% for our matrix that arose from the rounding erros of these numbers. When
% a loss in orthogonality occurs, it takes more than n iterations. 