function [] = Time_Dep_Im_Part_Anim(psi,E,x_t,cycle,speed)

global h_bar ;
global N;
%global dx;
%psi = psi * sqrt(1/Integration_(psi.^2,dx));
    
%figure;
x = linspace(-x_t,x_t,N);

t_range = abs(cycle*pi*h_bar/E);

for t = linspace(0,t_range,t_range*100)
    psi_ = psi*cos(-E*t/h_bar);
    plot(x,psi_,'Linewidth',2);
    
    
    lim = max( abs(min(psi)) ,  abs(max(psi)) );
    
    title(strcat('Real part of psi, t =', num2str(t), 'fs'));
    xlabel('x(nm)');
    ylabel('psi');
    
    %xlim([-x_t-0.5 x_t+0.5]);
    ylim([-lim lim]);
    pause(speed); %0.05
end

end