function [V,x] = lennard_jones_potential(Depth,r_e,x_t)

global N;
x = linspace(0.001,2*x_t,N);



V = Depth*((r_e./x).^12 - 2*(r_e./x).^6);


% figure;
% plot(x,V);
% ylim([-Depth , 10]);

end

