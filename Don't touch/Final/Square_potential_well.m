function [V, x] = Square_potential_well(max_strength, well_width,x_t)

global dx;
global N;
%square potential well with symmetrical shape
%well_width is in per cent of the total width

x = linspace(-x_t,x_t,N);
V = zeros(1,N);

V(1: round(N*(0.5 - (well_width/2)) )) = max_strength;
V(round(N*(0.5 + (well_width/2))) : end ) = max_strength;

% for i = 1:N
%     if i < N*(1-well_width)/2 || i > N*(1+well_width)/2
%         V(i) = max_strength;  %100
%     end
% end

end

