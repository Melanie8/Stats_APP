function [c_MM, k_MM, ERT] = wblmm(n, c, k)
% WBLMM Moments estimator for a given Weibull distribution.
    
% Get n random points from the Weibull distribution with scale parameter c
% and shape parameter k.
X = wblrnd(c,k,[1,n]);

% Plot
H = histfit(X);

% Mean, variance, coefficient of variation
m = mean(X);
v = var(X);
cv = sqrt(v)/m;
mq = sum(X.*X)/n;

% Bisection method
eps_abs = 1e-5;
eps_step = 1e-5;
x = 3;
y = 4;
while (y - x >= eps_step || ( abs( f(x,mq,m) ) >= eps_abs && abs( f(y,mq,m) )  >= eps_abs ) )
    z = (x + y)/2;
    if ( f(z,mq,m) == 0 )
       break;
    elseif ( f(x,mq,m)*f(z,mq,m) < 0 )
       y = z;
    else
       x = z;
    end
end
k_MM = x;
c_MM = m/gamma(1/x+1);

% Compute the total quadratic error
ERT = ((c_MM - c)^2) + ((k_MM - k)^2);

end 

function y = f(x,mq,m)
   y = mq-(m/gamma(1/x+1))^2*gamma(2/x+1);
end