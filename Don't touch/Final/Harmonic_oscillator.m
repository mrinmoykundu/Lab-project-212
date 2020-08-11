function [V,x] = Harmonic_oscillator(m,x_t,omega)
%Harmonic oscillator


global N;

x = linspace(-x_t,x_t,N);

V = 1/2*m*omega^2*x.^(2);


end

