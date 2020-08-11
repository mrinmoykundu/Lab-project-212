function [A, B] = Numerov8(N,dx)
%%This function outputs hamiltonian matrix
%%Of 8'th order approximation

a1(1:N-3)= 2;
a2(1:N-2)= -27;
a3(1:N-1) = 270;
a4(1:N)= -490;
a5(1:N-1)= 270;
a6(1:N-2)= -27;
a7(1:N-3) = 2;
A = (diag(a1,3) + diag(a2,2)+diag(a3,1)...
    + diag(a4,0) + diag(a5,-1)+diag(a6,-2)...
    + diag(a7,-3))/(180*dx^2);


a1(1:N-3)= 1;
a2(1:N-2)= -6;
a3(1:N-1) = 150;
a4(1:N)= 20140;
a5(1:N-1)= 150;
a6(1:N-2)= -6;
a7(1:N-3) = 1;
B=(diag(a1,3) + diag(a2,2)+diag(a3,1)...
    + diag(a4,0) + diag(a5,-1)+diag(a6,-2)...
    + diag(a7,-3))/20160;

end

