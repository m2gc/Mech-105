function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
% Making sure correct amount of inputs
if nargin<2, error('not enough inputs, at least two are necessary'),end
% Checking to make sure x and y are the same length
lx = length(x);
ly = length(y);
if lx==~ly, error('input values are not the same length'),end
% Sum of intervals
i = length(x)-1;
% Realistic values
xmin = min(x);
xmax = max(x);
ymin = y(length(y)-(length(y)-1));
ymax = y(length(y));
% Seperating odd and even y values
if mod(ymin,2)==0
yodd = sum(y(2:2:end));
yeven = sum(y(1:2:end));
else
    yodd = sum(y(1:2:end));
    yeven = sum(y(2:2:end));
end
% Checking to confirm that x is equally spaced
if any(diff(x)<0), error('independent variable, x, unequally spaced'),end
if mod(i,2) == 0
Simpson = (xmax-xmin) * (ymin+(4*yodd)+(2*yeven)+ymax)/(3*i);
I = Simpson;
% Trapezoidal equation for odd number of intervals
else
    Trap = (xmax-xmin)*(y(length(y)-1)+ymax)/2;
    I=Trap;
    warning('Trapezoidal Rule Applied')
end
end