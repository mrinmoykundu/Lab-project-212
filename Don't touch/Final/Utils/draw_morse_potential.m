function [V,X,Es,psis] = draw_morse_potential(m,Depth,a,r_e)

global h_bar
global E_max
global N 
dx = h_bar/(sqrt(2*m*E_max)); 
x_t=1;
N = round(2*(x_t/dx  + 2*pi));
[V,X]=morse_potential(Depth,a,r_e);

%% 4th order approximation
%[A, B] = Numerov4();

%% 8th order approximation
[A, B] = Numerov8(N,dx);
%% Total Hamiltoniana

H = -h_bar^2/(2*m) * (B \ A) + diag(V);
states=50;
[Es, psis] = FindEigens(H,states);


end



