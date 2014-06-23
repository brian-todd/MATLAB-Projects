%Driver 7
%Find a generalized idea of when CG will converge to a solution for an nxn
%matrix in less than n iterations. This is the solution to 3b.
%-------------------------------------------------------------------------%
%Test 1 - Examining eigenvalue distributions.

%First we obseve closely clustered eigenvalues.
n = 100;
b = ones(n,1);

v = 1:.001:1.099;
D = diag(v);
[U, ~] = qr(rand(n));
A = U'*D*U;
%This assigns to A a random SPD matrix with 100 eigenvalues 

toddba_cg(A,b,n);
%This converged in only 16 iterations, which is significantly less than n.


%Now, we observe when the amount of distinct eigenvalues << n, with the
%same size and b vector. 

v = [ones(n-2,1)' 99 100];
D = diag(v);
[U, ~] = qr(rand(n));
A = U'*D*U;
%This creates a random SPD matrix with ones accross the diag except for the
%last two terms, this provides us with 3 distinct eigenvalues.

toddba_cg(A,b,n);
%This converges in only 6 iterations, again, significantly less than n.

% Results
% When strictly viewing the spectrum of the eigenvalues, we can see that CG
% converges in less than n iterations consistenly for matrices that have
% comparatively few eigenvalues, closely spaced eigenvalues.
%-------------------------------------------------------------------------%
%Test 2 - Demonstrate convergance rate for identity matrices 

n = 1000;
A = eye(n);
b = ones(n,1);
%Eigenvalues are strictly one, and there is only one distinct eigenvalue.

toddba_cg(A,b,n);

% Results
% This trivial test shows that CG converges in one iteration, though this
% result is to be expected it still demonstrates where CG converges in less
% than n iterations. 
%-------------------------------------------------------------------------%
%Test 3 - Uniformly distributed eigenvalues on a small interval.

n = 500;
b = ones(n,1);

v = unifrnd(0,5,n,1);
D = diag(v);
[U, ~] = qr(rand(n));
A = U'*D*U;
%Generates a uniform, random SPD matrix with 500 eigenvalues.

toddba_cg(A,b,n);

% Results 
% This test indicates that uniform distributions of eigenvalues will
% converge quickly if the interval they are on is sufficiently small. 
%-------------------------------------------------------------------------%
% Conclusions
% The spectrum of eigenvalues affects the convergence rate of the CG in
% several different examples, many of which are studied in other drivers.
% When we have a matrix that has a number of eigenvalues values that is
% much smaller than the size of the matrix(n), then it will converge in
% less than n iterations. Similarly,the same effect can be observed when we
% have a set of eigenvalues that are closely packed together. A trivial
% example can also be found when all of the eigenvalues are taken to 1, and
% forming an identity matrix. Another powerful example (which is studied in
% driver 6) is when th eigenvalues are spread uniformly throughout an
% interval. If this interval is taken to be sufficiently smaller than the
% size of the matrix, then CG converges in less than n iterations.