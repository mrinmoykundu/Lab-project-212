function [V,x] = morse_potential(Depth,a,r_e)

global N;
x = linspace(0,r_e*5,N);
V = Depth*(1-exp(-a*(x-r_e))).^2 - Depth ;


end
