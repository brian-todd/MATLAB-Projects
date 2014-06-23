function [xprime] = fdiff(x,M)
%FDIFF Calculates partial derivatives for the second part of the project.
%   Copmutes the FFT of a a vector, then uses an inverse FFT to copmute the
%   derivative of the vector.

%Contruction of our vector of of i values.
im_vec = size(M);
for k = 0:M/2
    im_vec(k+1) = k;
end
L = 1;  %Counter.
for k = (M/2 + 1):M - 1
    im_vec(k+1) = (M/2 + L - M);
    L = L+1;
end
im_vec = 1i.*im_vec;
%These loops give us a vector of imaginary values that we will multiply
%with our vector of FFT coefficients.

fx = fft(x);  %Fast Fourier Transform.
xprime = ifft(im_vec.*fx);  %Inverse FFT, computes the derivative.
end