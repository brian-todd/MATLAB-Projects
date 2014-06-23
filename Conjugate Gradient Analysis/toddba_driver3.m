%Driver 3
%This is for problem 2b, tests the conjugate gradient method. Results are 
%commented on at the bottom of the file. 
%-------------------------------------------------------------------------%
%Matrix A, nxn, and vector b nx1. Determined for some size n, which creates
%a SPD matrix with n on the diagonals and ones above and below them. Also,
%creates a b vector of all ones. 

n = 100; %Determined by the user.

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
%Solve the system using Gaussian Elimination with partial pivoting, measure
%time.

Aug = [A,b];
x = zeros(n,1);

tic

for i=1:n-1
    for j=i+1:n
        if abs(Aug(j,i)) > abs(Aug(i,i))
            U = Aug(i,:);
            Aug(i,:) = Aug(j,:);
            Aug(j,:) = U;
        end
    end
    for j=i+1:n
        const1 = -Aug(j,i)/Aug(i,i);
        
        Aug(j,:) = Aug(j,:)+const1*Aug(i,:);
        b(j) = b(j)+const1*b(i);
    end
end
%This performs the Gaussian elimination, which inlcudes all of the
%operations on the vector b.

x(n) = Aug(n,n+1)/Aug(n,n);
for i=n-1:-1:1
    const2 = 0;
    for j = i+1:n
        const2 = const2 + Aug(i,j)*x(j);
    end
    x(i) = (Aug(i,n+1)-const2)/Aug(i,i);
end
%This loop performs the necessary back substitution to solve for the vector
%x.

toc

%This tends to be accurate up until the 15th digit, where a truncation
%error occurs

%-------------------------------------------------------------------------%
%Call function toddba_cg(A,b,n) determine the time it takes to solve the
%system using the method of Conjugate Gradients. 

toddba_cg(A,b,n);


%-------------------------------------------------------------------------%
%Results
%Below is a table outlining the amount of time it took for each of the
%methods of these symmetrical, tridiagonal matrices.
%
%                     All times in seconds!
%
%     n         Time CG         Time GEPP           Ratio (GEPP/CG)
%     2500      2.070652       128.547424           62.080651
%     1500       .574951        24.267937           42.208704
%     1000       .101239         6.093751           60.191734
%     500        .015210          .407932           26.819986
%     250        .006185          .062337           10.078738
%     100        .003013          .008636            2.866246
%     50         .002713          .003917            1.443789
%     10         .000812          .000164             .201970
%
% Comments
% The Gaussian Elimination with Partial Pivoting (GEPP) is an order of
% magnitude faster for the smaller matrices (up to about n = 45). However,
% after getting past these comparatively smaller values, the Conjugate
% Gradient(CG) method performs significantly faster than GEPP. The
% difference begins to strongly manifest itself as the size of the linear
% system increases. By the final test at n = 2500, CG demonstrates that it
% can solve the linear system ~62x faster than GEPP. This is due in large
% part to the fact that GEPP is typically of O(n^3), while CG is closer to
% O(n^2). The additional operations make GEPP a much more costly algorithm,
% but it converges for many matrices, unlike CG, which requires special
% symmetric, positive definite matrices.