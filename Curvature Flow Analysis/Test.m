%Brian Todd
%4/14/2013
%Math 471
%Part (a)
%-------------------------------------------------------------------------%


tic
format long 
%{
n = 100;  %Time steps.
M = 1024;  %Spatial Discretization points.
alpha = 0:(2*pi/(M-1)):2*pi;  %Alpha vector. 

y = sin(alpha);

plot(alpha,real(fdiff(y,M)),'-g')
hold
plot(alpha,cos(alpha),'-r')

toc
%}
%{
%Input    - f is the integrand input as a string 'f'
%         - a and b are upper and lower limits of integration
%         - M is the number of subintervals
%Output   - s is the trapezoidal rule sum
 
h=(b-a)/M;
s=0;
 
for k=1:(M-1)
   x=a+h*k;
   s=s+feval(f,x);
end
 
s=h*(feval(f,a)+feval(f,b))/2+h*s;


template <class ContainerA, class ContainerB>
double trapezoid_integrate(const ContainerA &x,  const ContainerB &y) {
    if (x.size() != y.size()) {
        throw std::logic_error("x and y must be the same size");
    }
    double sum = 0.0;
    for (int i = 1; i < x.size(); i++) {
        sum += (x[i] - x[i-1]) * (y[i] + y[i-1]);
    }
    return sum * 0.5;
}



function s=Trapezoid(f,a,b,M)
 
%Input    - f is the integrand input as a string 'f', which must accept vector inputs
%         - a and b are upper and lower limits of integration
%         - M is the number of subintervals
%Output   - s is the trapezoidal rule sum
 
h=(b-a)/M;
x=a:h:b;
fval=feval(f,x);
s=h*sum(fval(1:end-1)+fval(2:end))/2;
%}


clc
M=32;
m=100;
o=2*M;
alpha=0;
h=2*pi/M;
for i=1:M;
    X(i)=(4+cos(3*alpha))*(cos(alpha)); 
    X(i+M)=(4+cos(3*alpha))*(sin(alpha));
    alpha=alpha+h;
end

%  for i=1:n
%  X(i)=cos(alpha);
%  alpha=alpha+h;
%  end 
%  alpha=0;
% for i=1:n
%  Y(i)=-sin(alpha);
%  alpha=alpha+h;
%  end 
% X1(1:n)=X(1:n);
for j=1:3%*m
    Xp(:,j)=X;
    Xo=X;
%     X1=f_diff(X1,n);
    for k=1:M
    X(k)=X(k);
    X(k)=X(k+M);
    end
    X1=real(fdiff(X1,M));% finding the diff of Xo to get x1a and x2a
    Y1=real(fdiff(X1,M));% finding double diff of X to get x1aa and x2aa
    X2=real(fdiff(X2,M));
    Y2=real(fdiff(X2,M));
    alpha=0;
%    Finding f(x,t)=xdot from the given equation
   clear Z; 
   for l=1:M
       mod=sqrt((X1(l))^2+(X2(l))^2);
       Z(l)=((X2(l)*Y1(l))-(X1(l)*Y2(l))/(mod^4))*(X2(l)); 
       Z(l+M)=((X2(l)*Y1(l))-(X1(l)*Y2(l))/(mod^4))*(-X1(l));
       alpha=alpha+h;
    end
    X=Xo+0.01*Z;

% l=1:n;
plot(Xo(1:M),Xo(M+1:2*M))
end
% 
% i=1:o/2;
% plot(X(i),X(i+o/2))

