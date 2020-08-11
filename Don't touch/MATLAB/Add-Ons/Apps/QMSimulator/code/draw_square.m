function [V,X,Es,psis] = draw_square(x,m,max_strength,per)
global h_bar
global E_max
global N 
dx = h_bar/(sqrt(2*m*E_max)); %
N = round(2*(x/dx  + 2*pi));

[V,X]=Square_potential_well(max_strength,per,x);

%% 4th order approximation
%[A, B] = Numerov4();

%% 8th order approximation
[A, B] = Numerov8(N,dx);
%% Total Hamiltonian

H = -h_bar^2/(2*m) * (B \ A) + diag(V);
states=50;
[Es, psis] = FindEigens(H,states);


