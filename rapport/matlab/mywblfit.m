function [lambdak] = mywblfit (Y)
m1 = mean(Y);
m2 = mean(Y.^2);
m = fzero(@(m) (m1/gamma(1+1/m))^2*gamma(1+2/m) - m2, 10);
alpha = (m1 / gamma(1+1/m))^m;
lambdak = [alpha^(1/m), m];
end