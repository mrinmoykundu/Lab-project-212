function [V,X,Es,psis]=draw_linear...
    (m,x,max_strength,per_well_width)

global h_bar
global E_max
global N
dx = h_bar/(sqrt(2*m*E_max));
N = round(2*(x/dx  + 2*pi));

[V,X]=linear_potential(N,max_strength,per_well_width,x);


%% 4th order approximation
%[A, B] = Numerov4();

%% 8th order approximation
[A, B] = Numerov8(N,dx);
%% Total Hamiltonian

H = -h_bar^2/(2*m) * (B \ A) + diag(V);
states=50;
[Es, psis] = FindEigens(H,states);


end


