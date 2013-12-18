function [ LL ] = wblloglike(X, c, k)
% WBLLOGLIKE Log-likelihood function for the Weibull distribution.
%   Input:
%       - X : vector of the points to be evaluated
%       - c : scale parameter
%       - k : shape parameter
%   Output:
%       - LL : logarithmic likelihood estimator

% Size of the vector
n = length(X);

% logarithm of the likelihood function
LL = n*log(k)-n*k*log(c)+(k-1)*sum(log(X))-(1/c^k)*sum(X.^k);

end