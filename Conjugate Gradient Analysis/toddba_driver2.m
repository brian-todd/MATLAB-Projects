%Driver 2
%Test the the algorithm for Conjugate Gradient method on a tridiagonal
%matrix and plot the computed residuals, actual residuals, and error
%estimate. 
%-------------------------------------------------------------------------%
%Matrix A, nxn, and vector b nx1. Determined for some size n, which creates
%a SPD matrix with n on the diagonals and ones above and below them. Also,
%creates a b vector of all ones. 

n = 1000; %Determined by the user.

A = zeros(n);
for i=1:n-1
    for j=1:n-1
        if (i == j) 
            A(i,j) = i;
            A(i+1,j) = 1;
            A(i,j+1) = 1;
        end
    end
end
A(n,n) = n;
b = ones(n,1);

%-------------------------------------------------------------------------%
% Function toddba_cg2(A,b,n), plots 

x = toddba_cg2(A,b,n);
r = norm(b - A*x);

%-------------------------------------------------------------------------%
% Comments on the results
%
% The residual that we calculate above with r = norm(b - A*x) is on the
% order of 10e-14, which is an accurate numerical approximation. It is also
% importat to note that this file did not use a stopping condition based on
% the residuals or any calculated amount, which suggests that it could have
% had a smaller computed residual norm (indicated in part a). Both of the
% norms experience a slight anomaly around 60th iteration, where they
% become larger. This is possible when when they lose
% orthogonality, though it is unlikely that is the case here. I would guess
% that this arises randomly from the computations, and is just a slight
% fluctuation in the trend. Similar anomalies occur elsewhere with the
% computed residual norm, though they are small and brief. This fluctuation
% does not occur again, to any noticable degree, in the actual residual
% norms.
%
%
% a) The computed residual norms are indicated by the blue line. The most
%    striking feature of this curve is that it has a generally decreasing   
%    nature across the domain. There does not appear to be any bound, which
%    implies we would be able to compute extremely small residuals for this
%    method.
%
% b) The actual residual norms are shown by the red line. This curve very
%    closely approximates the computed residual norms up until about the
%    250th iteration, at which point they begin to dramatically diverge
%    from one another. The actual residual norms level off somewhere in the
%    neighborhood of c*e-14, where c<1. This appears to be the highest
%    level of acurracy that is achieved with the algorithm that I wrote. 
%
% c) The plot of the estimate for convergence appears to be linear on our
%    logarithmic y-axis, which is to be expected, given that the equation
%    follows a a^i curve. This estimate can be used as a tool to determine
%    when a certain system can converge. This curve indicates that the
%    ratio of the errors is decreasing for each additional iteration, as is
%    expected, and implies that the algorithm approaches convergence as a
%    greater number of iterations occur.