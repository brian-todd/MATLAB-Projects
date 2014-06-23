%Brian Todd
%Brian Todd
%4/19/2013
%Math 471
%-------------------------------------------------------------------------%
%
%                       Final Project - Part 2
%
% All analysis is done in each file.
%
%Functions
%
% fdiff - Reads in a vector and returns the derivative to it by using an
%         FFT coupled with an imaginary vector and an IFFT. This is used in
%         all of the drivers for Part 2, as it is how the derivatives are
%         created.
%
%Scripts
%
% toddba_driver1 - Solves the ODE presented in part (a) using 100 time
%                  steps and 32 spatial discretization points. Plots the
%                  points on a plane. 
%
% toddba_driver2 - Computes the CPU time per time step taken and is used to
%                  determine an overall time cost of the algorithm. 
%
% toddba_driver3 - Calculates the length of the curve at t = 4 (L(4)). Used
%                  to determine the numerical accuracy of the algorithm.
%
% toddba_driver4 - Runs the same simulation as toddba_driver1, except that
%                  it uses 64 spatial discretization points as opposed to
%                  32. 
%
%-------------------------------------------------------------------------%