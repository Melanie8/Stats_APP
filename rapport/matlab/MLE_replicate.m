function [means, vars] = MLE_replicate(n, c, k, B)
% MLE_REPLICATE Replicates B samples and performs wblmle() on them.

% Matrices to contain the MLEs and ERTs
c_MLEs = zeros(1,B);
k_MLEs = zeros(1,B);
ERTs = zeros(1,B);

% Find the nr MLEs and ERTs
for i=1:B
    [c_MLEs(1,i) k_MLEs(1,i) ERTs(1,i)] = wblmle(n, c, k);
end

c_MLE_mean = mean(c_MLEs);
c_MLE_var = var(c_MLEs);
k_MLE_mean = mean(k_MLEs);
k_MLE_var = var(k_MLEs);
ERT_mean = mean(ERTs);
ERT_var = var(ERTs);

means = [c_MLE_mean k_MLE_mean ERT_mean];
vars = [c_MLE_var k_MLE_var ERT_var];

%% Graphs
figure;
boxplot(c_MLEs);
set(gca,'FontSize',14);
title('Boxplot  pour  c_M_L_E');
ylabel('c_MLE','Fontsize',14);

figure;
boxplot(k_MLEs);
set(gca,'FontSize',14);
title('Boxplot  pour  k_M_L_E');
ylabel('k_M_L_E','Fontsize',14);

figure;
boxplot(ERTs);
set(gca,'FontSize',14);
title('Boxplot  pour  ERT_M_L_E');
ylabel('ERT_M_L_E','Fontsize',14);

figure;
hist(c_MLEs);
set(gca,'FontSize',14);
title ('Histogramme  pour  c_M_L_E');
xlabel('c_M_L_E','FontSize',14);
ylabel('nbre  de  c_M_L_E','Fontsize',14);

figure;
hist(k_MLEs);
set(gca,'FontSize',14);
title ('Histogramme  pour  k_M_L_E');
xlabel('k_M_L_E','FontSize',14);
ylabel('nbre  de  k_M_L_E','Fontsize',14);

figure;
hist(ERTs);
set(gca,'FontSize',14);
title ('Histogramme  pour  ERT_M_L_E');
xlabel('ERT_M_L_E','FontSize',14);
ylabel('nbre  de  ERT_M_L_E','Fontsize',14);

end