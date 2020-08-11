function [V,x] = Double_infinite_potential_well...
    (max_strength, well_width, barrier_width,x_t)


global N;

x = linspace(-x_t,x_t,N);

% well_width, barrier_width is in percent
%% Double infinite potential well
V = zeros(1,N);

V(1: round(N*(0.5 - (barrier_width/2) - well_width)) ) = max_strength;
V(round(N*(0.5 + (barrier_width/2) + well_width)) : end ) = max_strength;

V(round(N*(0.5 - (barrier_width/2))) : ...
    round(N*(0.5 + (barrier_width/2)) ) ) = max_strength;


end

