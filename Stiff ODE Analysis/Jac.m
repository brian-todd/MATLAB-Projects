function [J] = Jac(y,z)
%JAC Defintion for the Jacobian (part (c)).
a = 452013;
h = 1/100;

J(1,1) = 1;
J(1,2) = -h;
J(2,1) = 0;
J(2,2) = 1 + a*h*cos(z);
end