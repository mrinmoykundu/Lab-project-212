function [V,X,Es,psis] =draw_harmonic(m,x,omega)

global h_bar
global E_max
global N 
dx = h_bar/(sqrt(2*m*E_max)); 
N = round(2*(x/dx  + 2*pi));
[V,X]=Harmonic_oscillator(m,x,omega);

%% 4th order approximation
%[A, B] = Numerov4();

%% 8th order approximation
[A, B] = Numerov8(N,dx);
%% Total Hamiltonian

H = -h_bar^2/(2*m) * (B \ A) + diag(V);
states=50;
[Es, psis] = FindEigens(H,states);


end


