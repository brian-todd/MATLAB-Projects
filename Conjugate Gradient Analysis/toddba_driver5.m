%Driver 5
%Investigate the convergence of CG by observing the convergence rate for CG
%if the eigenvalues are clustered closely together or if they are spread,
%this is a part of problem 3b.
%-------------------------------------------------------------------------%
%Test 1 - Clustered eigenvalues about 1.

n = 50;
b = ones(n,1);
A = zeros(n);

for i=1:n
    for j=1:n
        if (i == j) 
            A(i,j) = 1;
        end
    end
end     %This forms a matrix with 1:50 on the diagonal.

%Now we will take a few terms on the diagonal that will serve as our
%eigenvlaues, we will cluster them accordingly.

A(2,2) = 1.00001;
A(3,3) = 1.00002;

toddba_cg(A,b,n);

% Results
% Converged in 3 iterations, the same as the number of the eigenvalues. An
% important note is that this operated much faster than a matrix of the
% same size and same number of eigenvalues in driver 4.

%-------------------------------------------------------------------------%
%Test 2 - Clustered 100 distinct eigenvalues about one on a 100x100 matrix.

n = 100;
b = ones(n,1);

v = 1:.0001:1.0099;
D = diag(v);
[U, ~] = qr(rand(n));
A = U'*D*U;
%Eigenvalues are all across the diagonal, they are closely wrapped in this
%random SPD matrix.

toddba_cg(A,b,n);

% Results
% Converged in only 10 iterations for a 100x100 amtrix with 100 distinct
% eigenvalues that are close togehter. This test shows a very small amount
% of iterations to arrive at the desired solution. 

%-------------------------------------------------------------------------%
%Test 3 - 100x100 matrix where eigenvalues are NOT clustered. 

n = 100;
A = zeros(n);
b = ones(n,1);

for i=1:n
    for j=1:n
        if (i == j) 
            A(i,j) = i;
        end
    end
end
%Matrix with 1:100 on the diagonal, also featured in driver 4.

toddba_cg(A,b,n);

% Results
% When the eigenvalues are not clustered it will take 107 iterations to
% solve this system, as is also demostrated in other drivers. 

%-------------------------------------------------------------------------%
%Conclusions
%
% These three tests seem to indicate that if a linear system has a spectrum
% that is clustered closely together, than it will converge at a faster
% rate (less iterations) than normal. Typically CG converges in about 
% m iterations, where m is the size of the matrix. However, when they are
% clustered together, the convergence occurs extremely quickly, regardless
% of the size of the matrix. This is most obviously seen in test 2, where a
% 100x100 matrix is quickly solved in only 10 iterations. Comparing this to
% test 3, where our matrix did not have clustered eigenvalues and took over
% 100 iterations to complete. 