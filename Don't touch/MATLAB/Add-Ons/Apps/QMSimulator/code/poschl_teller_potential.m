function [V,x] = poschl_teller_potential(lambda,x_t)
global N;
x = linspace(-x_t,x_t,N);

V = -lambda*(lambda+1)*sech(x*8)/2;

end

