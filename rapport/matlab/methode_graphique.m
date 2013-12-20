function methode_graphique(c,k)
% Using linear regression to estimate the parameters of a Weibull
% distribution
%   
close all
n = 1000;
X = sort(wblrnd(c,k,n,1));
F = (1:n-1)'/n;
U = log(-log(1-F));
d = [log(X(1:n-1)) ones(n-1,1)]\U;
k1 = d(1)
c1 = exp(d(2)/-k1)

figure
plot(log(X(1:n-1)),U,'Color','red','LineWidth',2)
hold on
plot(log(X), d(1)*log(X) + d(2),'Color','green','LineWidth',2)

ERT1 = (k1-k)^2 + (c1-c)^2

B = 500;
ERT = zeros(B,1);
K = zeros(B,1);
C = zeros(B,1);
for i=1:B
    X = sort(wblrnd(c,k,n,1));
    d = [log(X(1:n-1)) ones(n-1,1)]\U;
    K(i) = d(1);
    C(i) = exp(d(2)/-K(i));
    ERT(i) = (K(i)-k)^2 + (C(i)-c)^2;
end

varE = var(ERT)
varK = var(K)
varC = var(C)
meanE = mean(ERT)
meanK = mean(K)
meanC = mean(C)

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

