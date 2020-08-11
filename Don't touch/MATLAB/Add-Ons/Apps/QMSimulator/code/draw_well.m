function [] = draw_well(m,xup,xlow,pop)

h_bar = 1;% Consatant parameter

x_t = (xup-xlow)/2;

% Grid parameter, to be high for accuracy
% But too high entails round off error
E_max = 100000; %100000 works well for most of cases

% dx and N is determined from E_max, x_t
dx = h_bar/(sqrt(2*m*E_max)); %
N = round(2*(x_t/dx  + 4*pi));% Number of grid point


%% Potentail declaration

%V is a 1D array containing potential energy from grid point 1 to N
%Can be a customised function 

if pop==1
    V = Square_potential_well(N,100,1);
elseif pop==2
        V = Double_infinite_potential_well(N,1000,0.5,0.05);
elseif pop==3
    omega = 1; %in fs-1
base =30;
 V = Harmonic_oscillator(N,x_t,m,omega*base);
elseif pop==4
    %%Linear potential well
% V = zeros(1,N);
% for i = 1:N
%     if(i < N/4 )
%         V(i) = 4/N * i;
%     elseif (i > 3*N/4)
%         V(i) = -4/N * i + 4;
%     end
% end
else
    %Coulumbo's potential
propotional_constant = 100;
V = Coulumbo_potential(N,x_t,propotional_constant);
end





end

