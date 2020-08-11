function [V,X,Es,psis]=draw_coulumbo(constant,m)


global E_max
global N 
h_bar=0.659375;

x = 1; % Half Length in nm
dx = h_bar/(sqrt(2*m*E_max)); %
N = round(2*(x/dx  + 2*pi))

[V,X] = Coulumbo_potential(constant,x);
size(V)

%% 8th order approximation
[A, B] = Numerov8(N,dx);

%% Total Hamiltonian

H = -h_bar^2/(2*m) * (B \ A) + diag(V);
states=16;
[Es, psis] = FindEigens(H,states);

Es(2)
Es(4)


end

