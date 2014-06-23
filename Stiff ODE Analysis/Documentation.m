%Brian Todd
%4/19/2013
%Math 471
%-------------------------------------------------------------------------%
%
%                       Final Project - Part 1
%
%Functions
%
% backward_euler - Solves a first order ODE using the Backward Euler's
%                  Method. Iteratively finds a solution vector of points
%                  that give the solution to an ODE. Used specifically in
%                  problem 1.
%
% forward_euler - Solves a first order ODE using the Forward Euler's
%                 Method. Iteratively finds a solution vector of points
%                 that give the solution to an ODE. Used specifically in
%                 problem 1.
%
% sys_forward_euler - Solves a system of first order ODEs using the
%                     Forward Euler Method. Iteratively finds vector
%                     solutions, used in files toddba_driver2,
%
% sys_backward_euler - Solves a system of first order ODEs using the
%                      Backward Euler Method. Iteratively finds vector
%                      solutions, used in files toddba_driver3.
%
% nonl_sys_forward_euler - Performs the forward Euler method on a nonlinear
%                          nonlinear system of equations. Iteratively
%                          determines a matrix of solutions. Used in the
%                          files toddba_driver4.
%
% nonl_sys_backward_euler - Performs Backward Euler Method specifically for
%                           the ODE in part (c). Iteratively determines the
%                           solution and is used in toddba_driver5.
%
%Scripts
%
% toddba_driver1 - Solves the ODE in part (a). Uses Backward and
%                  Forward Euler's Method to determine a solution vector. 
%                  Analyzes the results in a comment section in the file.
%
% toddba_driver2 - Solves the ODE in part (b) using only the Forward
%                  Euler method. I chose to break up the files for this
%                  part in order to save computational time per file.
%
% toddba_driver3 - Solves the ODE in part (b) using only the
%                  Backward Euler Method. Also, compiles ratios of errors.
%                  Part (b) was done in two parts to save time per file.
%
% toddba_driver4 - Solves the ODE in part (c) using the Forward Euler
%                  method. Interprets it as a matrix and gives the solution 
%                  as a vector. Also, includes error analysis.
%                  
% toddba_driver5 - Solves the ODE in part (c) using Backward Euler Method.
%                  However, the system cannot be analytically solved, so
%                  the points are determined by Newton's Method. An error
%                  analysis is also included. 
%
%-------------------------------------------------------------------------%