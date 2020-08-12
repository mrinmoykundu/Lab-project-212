function [D_E] = density_of_states(Es)

D_E = 1./gradient(Es);

plot(D_E,Es,'LineWidth',2);

title('Energy vs Density of states]');
xlabel('D(E)[1/(eV*nm)]');
ylabel('E[eV]');

ylim([min(Es) max(Es)]);

end

