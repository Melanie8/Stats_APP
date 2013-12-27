function [mu, sigma] = mynormfit (Y)
m1 = mean(Y);
m2 = mean(Y.^2);
mu = m1;
sigma = sqrt(m2 - m1.^2);
end