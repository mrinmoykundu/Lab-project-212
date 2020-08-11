function [V,x] = kronig_penny_potential(strength,num_of_well,del_per_well,x_t)
%Band Structure

%del_per_well = b/a
global N;
%del_per_well is in percent
x_t=1;
x = linspace(-x_t,x_t,N);

L = round((N/num_of_well)/( 1 + del_per_well));
del = round(L*del_per_well);

V = zeros(1,N);

s = del;
for i = 1:round(N/(L+del))
    if(s+L > N)
        V(s:end) = strength;
    else
        V(s:s+L) = strength;
        s = s + L + del;
    end
end

end

