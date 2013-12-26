function methode_graphique()
% Using linear regression to estimate the parameters of a Weibull
% distribution

% Parameters to be estimated
c = 2;
k = 2;

% Results for one sample
close all
n = 1000;                   %sample size
X = sort(wblrnd(c,k,n,1)); 	%sorting makes it easier to compute F
X = X(2:n-1);            	%removing first and last value
F = (2:n-1)'/n;            	%empirical version of F(X)
U = log(-log(1-F));   
% with exact F, the following log-linear relationship holds : 
% U = k*log(X) - k*log(c)
d = [log(X) ones(n-2,1)]\U; %linear regression solve 
k1 = d(1)
c1 = exp(d(2)/-k1)

%linear regression plot
figure
plot(log(X),U,'.r','LineWidth',2)
hold on
plot(log(X),d(1)*log(X) + d(2),'g','LineWidth',2)
set(gca,'FontSize',14);
title ('Droite de regression lineaire');

% total squared error
ERT1 = (k1-k)^2 + (c1-c)^2

% Replications to compute the variance and mean of the estimator
% We can vary the number of values we keep from the sample to perform the
% linear regression. We seem to get less bias when rejecting the extremes,
% at least for k's estimator, c's estimator seems to be doing fine anyways.
B = 500;
ERT = zeros(B,1);
K = zeros(B,1);
C = zeros(B,1);
n2 = n-2;        %we keep the n2 central values (try n-2,n-20,n-200)
F = (n/2-n2/2+1:n/2+n2/2)'/n;
U = log(-log(1-F));
for i=1:B
    X = sort(wblrnd(c,k,n,1));
    X = X(n/2-n2/2+1:n/2+n2/2);
    d = [log(X) ones(n2,1)]\U;  %linear regression
    K(i) = d(1);
    C(i) = exp(d(2)/-K(i));
    ERT(i) = (K(i)-k)^2 + (C(i)-c)^2;
end

%output values
varE = var(ERT)
varK = var(K)
varC = var(C)
meanE = mean(ERT)
meanK = mean(K)
meanC = mean(C)


%various boxplots and histograms
figure
boxplot(K)
set(gca,'FontSize',14,'xticklabel',{[]});
title ('Boxplot  pour  K');

figure
boxplot(C)
set(gca,'FontSize',14,'xticklabel',{[]});
title ('Boxplot  pour  C');

figure
boxplot(ERT)
set(gca,'FontSize',14,'xticklabel',{[]});
title ('Boxplot  pour  ERT');

figure
hist(K)
set(gca,'FontSize',14);
title ('Histogramme  pour  K');

figure
hist(C)
set(gca,'FontSize',14);
title ('Histogramme  pour  C');

figure
hist(ERT)
set(gca,'FontSize',14);
title ('Histogramme  pour  ERT');

end

