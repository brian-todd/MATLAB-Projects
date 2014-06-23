%Driver 1
%This test is designed to put multiple SPD matrics through the
%toddba_cg(A,b) function. This is to ensure that the function works
%properly and returns a value similar to A\b.
%-------------------------------------------------------------------------%
%Generate a random nxn matrix that is symmetric, positive definite (SPD).
%Also, define size of matrix.

n = 1000;

v = rand(n,1); %Random vector of eigenvalues

D = diag(v);
[U, ~] = qr(rand(n));
A = U'*D*U;
%This generates a symmetric, positive definite matrix. 

%Test that the eigenvalues of M are greater than or equal to zero and that
%the norm(A-A') == 0.
if ((all(eig(A)) >= 0) && (norm(A - A')))
    flag = true;
else 
    flag = false;
    return;
end

%-------------------------------------------------------------------------%
%Testing for the toddba_cg(A,b) function. Takes the randomly generated SPD
%matrix implemented above and solves it, then we compare the norm of the
%residuals. Takes a random b vector.

b = rand(n,1);
x = toddba_cg(A,b,n);

r = norm(b - A*x)

%-------------------------------------------------------------------------%
%Results
%These results are derived from randomized matrices created in this file.

%   n       Iterations      Real Residuals                time  
%   10         20           3.216123055415433e-16        .000773  
%   15         30           1.090621077026094e-15        .001011 
%   50         61           4.305747561376406e-15        .002760
%   100        112          4.097567963771439e-14        .005824
%   500        330          3.452221993550386e-13        .014502
%   1000       431          5.076006494555033e-13        .109779

%It seems as though the error in our calculation increases with the size of
%the matrix. Additionally, all of these terms fall beneath a minimally
%acceptable residual of 10^-12, which implies that this algorithm
%accurately solves linear systems.