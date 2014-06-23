%Driver 6
%Determine what effects the spectrum of eigenvalues has on the Conjugate
%Gradient Method when they are evenly spread throuhgout an interval [a,b],
%this is the solution to 3b.
%-------------------------------------------------------------------------%
%Test 1 - 50x50 matrix with 50 disinct, evenly spaced eigenvalues on an
%interval [1,50]

n = 50;
b = ones(n,1);

v = unifrnd(1,50,n,1);
D = diag(v);
[U, ~] = qr(rand(n));
A = U'*D*U;
%This creates a uniform random SPD matrix with eigenvalues between [1,50].

toddba_cg(A,b,n);

% Results
% The CG method took 54 iterations for this matrix.
%-------------------------------------------------------------------------%
%Test 2 - 100x100 uniform random SPD matrix with 100 distinct eigenvalues 
%         that are uniform across [1,2].

n = 100;
b = ones(n,1);

v = unifrnd(1,2,n,1);
D = diag(v);
[U, ~] = qr(rand(n));
A = U'*D*U;
%Uniform random SPD matrix with eigenvalues in [1,2].

toddba_cg(A,b,n);

% Results
% This test took 32 iterations to converge in a 100x100 matrix with 100
% eigenvalues.

%-------------------------------------------------------------------------%
%Test 3 - 100x100 uniform random matrix, with [1,20]

n = 100;
b = ones(n,1);

v = unifrnd(1,20,n,1);
D = diag(v);
[U, ~] = qr(rand(n));
A = U'*D*U;
%Uniform random SPD matrix with eigenvalues in [1,20].

toddba_cg(A,b,n);

% Results
% This test, with nonuniformly spaced eigenvalues arrived at a solution
% after only 85 iterations. 
%-------------------------------------------------------------------------%
% Conclusions 
% In this driver, the rate of convergence depends on the size of the
% interval relative to the size of the matrix. When the size of the
% interval is small relative to the matrix, then matrices with uniformly 
% distributed eigenvalues tend to converge in less than n iterations.
% However, when the size of the interval is comparable to that of the
% matrix, then the rate of convergence for CG is approximately the same,
% ~n.