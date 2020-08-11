function [val] = Integration_(Y,h)
format long
% X = linspace(1.6,3.8,13);
% Y = exp(X);
%
% h = abs(X(2) - X(1));
%
% %Trapezoidal
% integral1 = h*( (Y(1)+Y(end))/2 + sum(Y(2:end-1)))
%
% %Simpson's 1/3
% integral2 = 0;
%
% for i=1:2:length(X)-1
%     integral2 = integral2 + Y(i) + 4*Y(i+1) + Y(i+2);
% end
% integral2 = h*(integral2/3)
%
% %Simpson's 3/8
integral3 = 0;
for i=1:3:length(Y)-3
    integral3 = integral3 + Y(i) + 3*Y(i+1) + 3*Y(i+2) + Y(i+3);
end
val = 3*h*(integral3/8);
end