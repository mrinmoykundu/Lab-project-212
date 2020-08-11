function [] = k_vs_E(Es,D_E,a,x_t)

k = zeros(1,length(Es))';

for i=2:length(Es)
    k(i) = (1/2*pi)*trapz(Es(1:i),D_E(1:i));
end

plot([flip(-k),k]/(pi/a), [flip(Es), Es],'b','LineWidth',2);

title('Wave number vs Energy');
xlabel('k (pi/a) [1/nm]');
ylabel('E[eV]');


end

