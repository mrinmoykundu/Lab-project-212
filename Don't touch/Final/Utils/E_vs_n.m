function [index] = E_vs_n(Es, Samples, type)


ns = Samples;
Es = Es(Samples)';

% E is proportional to n^(index)
[~,index,~] = regression(log(ns), log(Es) );


%% Interpolation for better result
% n = length(Samples);
% detailed_n_grid = linspace(1,n,100);
% polished_Es = interp1(1:n,Es,detailed_n_grid,'spline');
%
% plot(detailed_n_grid,polished_Es);

if type == '.'
    plot(ns,Es,'.-.','MarkerSize',15);
else
    plot(ns,Es,'.-.','MarkerSize',15);
end

xlabel('State,n');
ylabel('Energy,eV');
title("Energy vs quantum number,n");

lgd = strcat('E is proportional to n^i, i =',num2str(real(index)));
legend(lgd);

end

