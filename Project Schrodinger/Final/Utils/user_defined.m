function [V,x] = user_defined(fstr,x_t)


global N;
x = linspace(-x_t,x_t,N);

if ischar(fstr)
    %disp 'converting function string to function handle ...'
    func =str2func(['@(x)' fstr]);
end

V = func(x);
end

