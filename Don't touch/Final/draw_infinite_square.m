function [V,X,Es,psis] = draw_infinite_square (x,m,...
    max_strength,per_well_width, barrier_width)

global h_bar
global E_max
global N 
dx = h_bar/(sqrt(2*m*E_max)); %
N = round(2*(x/dx  + 2*pi));

[V,X] = Double_infinite_potential_well...
    (max_strength, per_well_width, barrier_width,x);
[A, B] = Numerov8(N,dx);
%% Total Hamiltonian

H = -h_bar^2/(2*m) * (B \ A) + diag(V);
states=50;
[Es, psis] = FindEigens(H,states);

end


