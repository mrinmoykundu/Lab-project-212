function [V, x] = linear_potential(N,max_strength,per_well_width,x_t)
%%Linear potential well

%max_strength is the heigth of the potential
%per_well_width is the percent of well width with respect to the
%whole field
V = zeros(1,N);
x = linspace(-x_t,x_t,N);

temp = (1-per_well_width)/2;
for i = 0:N
    if(i < N*temp)
        V(i+1) = max_strength/(temp*N) * i;
    elseif (i > N*(1-temp))
        V(i) = -max_strength/(temp*N)* i + ...
            max_strength/temp;
    end
end

end