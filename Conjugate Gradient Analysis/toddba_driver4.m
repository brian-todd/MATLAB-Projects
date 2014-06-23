%Driver 4
%Analyze the convergence of the conjugate gradient method when A only has n
%distinct eigenvalues and A is mxm, where n << m. This solves problem 3a.
%It is important to note that the diagonal matrices are SPD.
%-------------------------------------------------------------------------%
%Test 1 - 50x50 matrix, with 3 distinct eigenvalue. The only nonzero terms
%         exist on the diagonal. b is the vector consisting of ones.

n = 50; %Size of the matrix

A = zeros(n);
b = ones(n,1);

for i=1:n-1
    for j=1:n-1
        if (i == j)
            A(i,j) = 1;
        end
    end
end %Creates a diagonal matrix of ones.

A(1,1) = 5;
A(n,n) = 10;
%Matrix has three distinct eigenvalues 1,5,10



toddba_cg(A,b,n);

% Results
% When we apply the method of conjugate gradients with a small number of
% eigenvalues (n<<m), our smethod converged to a solution in 6 iteratiions.
% This converged very quickly with these eigenvalues.

%-------------------------------------------------------------------------%
%Test 2 - 50x50 matrix with 50 distinct eigenvalues, random SPD

n = 50;
b = ones(n,1);

v = 1:50;
D = diag(v);
[U, ~] = qr(rand(n));
A = U'*D*U;
%Creates a random SPD matrix with eigenvalues 1:50.

toddba_cg(A,b,n);

% Results
% Using a large n = m amounts of eigenvalues, we have a much different
% picture of convergence. This matrix required 62 iterations to solve the
% system. This is significantly greater than our other test which had a
% matrix of the same size, but with less eigenvalues.

%-------------------------------------------------------------------------%
%Test 3 - 100x100 matrix with only one distinct eigenvalues

n = 100;

A = eye(n);
b = ones(n,1);
%Produces the identity matrix

toddba_cg(A,b,n);

% Results
% Not surprisingly, this only needed a single iteration to solve the
% problem. 

%-------------------------------------------------------------------------%
%Test 4 - 100x100 matrix with 5 eigenvalues

n = 100;
A = zeros(n);
b = ones(n,1);

for i=1:n
    for j=1:n
        if (i == j) 
            A(i,j) = 1;
        end
    end
end     %This forms a matrix with 1s on the diagonal.

A(10,10) = 10;
A(20,20) = 20;
A(30,30) = 30;
A(40,40) = 40;
%We now have a matrix with ones on the diagonal, plus a few other term
%and five distinct eigenvalues.

toddba_cg(A,b,n);

% Results
% The algorithm converges in only 9 iterations for a matrix containing five
% distinct eigenvalues

%-------------------------------------------------------------------------%
%Conlcusions
%
% From these four tests we can see that there is a general trend. When the
% number of eigenvalues (n) is significantly less than the size (m) of the 
% matrix,then the solution will rapidly converge in approximately ~n 
% iterations. 