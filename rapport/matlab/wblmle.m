function [c_MLE, k_MLE, ERT] = wblmle(n, c, k)
% WBLMLE Maximum likelihood estimator for a given Weibull distribution.
%   The function generates n sample points from the Weibull distribution
%   with parameters c and k. It then generates 101 candidates for c an k
%   in a range of [0.7c:1.3c] and [0.7k:1.3k].
%   It computes 
%   Input:
%       - n : number of points taken randomly from a Weibull distribution
%       - c : scale parameter
%       - k : shape parameter
%   Output:
%       - c_MLE : c estimator of the scale parameter
%       - k_MLE : k estimator of the chape parameter
%       - ERT : total quadratic error
%
%   For best results, take c and k < 5.
    
% Get n random points from the Weibull distribution with scale parameter c
% and shape parameter k.
X = wblrnd(c,k,[1,n]);

% Grid of 101 candidate points where c_MLE and k_MLE.
cs = linspace(0.7*c, 1.3*c, 101);
ks = linspace(0.7*k, 1.3*k, 101);
grid = zeros(101);

for i=1:101
    c_MLE = cs(1,i);
    for j=1:101
        k_MLE = ks(1,j);
        grid(i,j) = wblloglike(X, c_MLE, k_MLE);
    end
end

% Find the maximum likelihood estimator
mle = (max(max(grid)));
[cind,kind] = find(grid == mle);
c_MLE = cs(cind);
k_MLE = ks(kind);

% Compute the total quadratic error
ERT = ((c_MLE - c)^2) + ((k_MLE - k)^2);

end 


