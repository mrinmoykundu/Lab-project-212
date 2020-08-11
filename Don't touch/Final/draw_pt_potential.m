function [V,X,Es,psis] = draw_pt_potential(m,lambda,x_t)

global h_bar
global E_max
global N 
dx = h_bar/(sqrt(2*m*E_max)); 

N = round(2*(x_t/dx  + 2*pi));
[V,X]=poschl_teller_potential(lambda,x_t);

%% 4th order approximation
%[A, B] = Numerov4();

%% 8th order approximation
[A, B] = Numerov8(N,dx);
%% Total Hamiltoniana

H = -h_bar^2/(2*m) * (B \ A) + diag(V);
states=50;
[Es, psis] = FindEigens(H,states);


end


