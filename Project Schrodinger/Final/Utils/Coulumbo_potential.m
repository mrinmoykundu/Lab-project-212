function [V,x] = Coulumbo_potential(propotional_constant,x_t)
%% Coulumbo's potential


global N;
x = linspace(-x_t,x_t,N); 
% V = (-2.3e-28./abs(x));

V = (-(propotional_constant*1.44)./abs(x)); 

V(V==inf) = 100000;
V(isnan(V)) = 0;

end

