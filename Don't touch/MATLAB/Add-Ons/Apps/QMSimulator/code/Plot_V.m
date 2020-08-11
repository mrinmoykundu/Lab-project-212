function [] = Plot_V(x,V,Es,lf_cul,lgd)

%If lgd is 1, provide legend, otherwise not

global N;


plot(x,V,'LineWidth',2,'DisplayName',...
    'Potential');
hold on;
if lf_cul
    for i = 1:length(Es)
        plot(x,Es(i)*ones(1,N),'DisplayName',...
            strcat('E(',num2str(i),')=',num2str(Es(i)),'eV'));
        hold on;
    end
else % For Coulumbo
    for i = 2:2:length(Es)
        plot(x,Es(i)*ones(1,N),'DisplayName',...
            strcat('E(',num2str(i/2),')=',num2str(Es(i)),'eV'));
        hold on;
    end
end

title('Potential energy');
xlabel('x(nm)');
ylabel('Potential Energy(eV)');
%xlim([-x_t,x_t]);
%ylim([min(V)-1, max(V)+1]);

xlim([min(x) max(x)]);
ylim([min(Es)-10, max(Es)+10]);

if lgd
    legend();
end
hold off;
end

