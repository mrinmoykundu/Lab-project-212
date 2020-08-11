function [] =plot_PDF(psis,modes,x_t,m,if_cool)
format long

global h_bar
global E_max
global N
dx = h_bar/(sqrt(2*m*E_max)); %
N = round(2*(x_t/dx  + 2*pi));

x = linspace(-x_t,x_t,2*N);

lgd = [];

for i = modes
    mode = i;
    psi = psis(:,mode)*sqrt(1/Integration_(psis(:,mode).^2,dx));
    
    
    %Interpolation for better result
    detailed_x_grid = linspace(1,N,2*N);
    polished_psi = interp1(1:N,psi,detailed_x_grid,'spline');
    
    
    plot(x,polished_psi.^2);
    hold on;
    if if_cool
        lgd = [lgd ;strcat('psi^2(',num2str(i),')')];
    else
        lgd = [lgd ;strcat('psi^2(',num2str(i/2),')')];
    end
    
end

title('Probability Density Function');

xlabel('x(nm)');
ylabel('psi^2');
xlim([-x_t,x_t]);

legend(lgd);
%ylim([min(V)-10, max(V)+10]);
hold off
end

