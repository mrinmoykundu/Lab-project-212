function [A, B] = Numerov4(N,dx)
%%This function outputs hamiltonian matrix
%%Of 4'th order approximation

aal(1:N-1)= 1;
bbl(1:N)= -2;
ccl(1:N-1)= 1;
A=(diag(bbl,0) + diag(aal,-1)+diag(ccl,1))/dx^2;


aal(1:N-1)= 1;
bbl(1:N)= 10;
ccl(1:N-1)= 1;
B=(diag(bbl,0) + diag(aal,-1)+diag(ccl,1))/12;


end

