%Brian Todd
%Math 471
%3/1/2013
%763 lines

%                          Midterm Project
%-------------------------------------------------------------------------%


%toddba_cg -- Function that computes the solution to Ax = b by using
%             Conjugate Gradient (CG) method. The stopping condition is 
%             an epsilon value for the norm of the residuals. Also, tracks 
%             the time to perform this task and counts iterations.

%toddba_cg2 -- Function that computes the solution to Ax = b after 500
%              iterations, measures the time to do so. Additionally, it
%              plots the computed residual norms, actual computed norms,
%              and the error estimate.

%Driver 1 -- Test cg(A,b) for 6 randomly generated symmetric, positive 
%            definite matrices.
%            (Solution 1)

%Driver 2 -- Solves Ax = b for a 1000x1000 matrix after 500 iterations,
%            where A is a tridiagonal matrix, produces a plot with three 
%            curves on it. 
%            (Solution 2a)

%Driver 3 -- Solves Ax = b  for a 1000x1000 matrix after 500 iterations,
%            compares computational time to that of Gauss Elimination with
%            partial pivoting. A is a tridiagonal matrix.
%            (Solution 2b)

%Driver 4 -- Solves various matrices and tests how CG reacts to systems
%            with few eigenvalues (relative to the size of the matrix).
%            Returns the number of iterations and comments on results.
%            (Solution 3a)

%Driver 5 -- Solves various SPD matrices and analyzes the convergence rate
%            of CG when the eigenvalues are closer together. The speed of 
%            convergence is measured in terms of iterations. 
%            (Solution 3b)

%Driver 6 -- Solves various SPD matrices to determine the effect of an
%            evenly distributed spectrum of eigenvalues on the convergence 
%            of CG, in terms of iterations.
%            (Solution 3b)

%Driver 7 -- Solves various SPD matrices to determine which situations
%            allows CG to converge in less than n iterations, for an nxn
%            matrix.
%            (Solutions 3b)

%Driver 8 -- Solves various SPD matrices to determine which situations
%            cause CG to converge in more than n iterations, for an nxn 
%            matrix.
%            (Solution 3b)