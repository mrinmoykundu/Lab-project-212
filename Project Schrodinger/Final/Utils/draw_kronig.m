function [V,X,Es,psis] = draw_kronig(num_well,width,E_field)
format long
global h_bar
global E_max
global N 

x_t=1;
h_bar = 0.659375; % eV fs
m =  5.69375; %electron mass in new unit
% Grid parameter, to be high for accuracy
% But too high entails round off error
E_max = 10000; %100000 works well for most of cases


% dx and N is determined from E_max, x_t
dx = h_bar/(sqrt(2*m*E_max)); %
N = round(2*(x_t/dx  + 2*pi)); % Number of grid point

strength = num_well^2;
[V,X] =kronig_penny_potential(strength,num_well,width,1);

%% Application of electric field
%E = -2; % -5 to 5 works well
x = linspace(-x_t,x_t,N);
E_field = E_field*x;

V = V + E_field;
%% 8th order approximation
[A, B] = Numerov8(N,dx);


%% Total Hamiltonian

H = -h_bar^2/(2*m) * (B \ A) + diag(V);
states=2*num_well;
[Es, psis] = FindEigens(H,states);






end

