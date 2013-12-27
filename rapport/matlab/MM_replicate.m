function [means, vars] = MM_replicate(n, c, k, B)
% MM_REPLICATE Replicates B samples and performs wblMM() on them.

% Matrices to contain the MMs and ERTs
c_MMs = zeros(1,B);
k_MMs = zeros(1,B);
ERTs = zeros(1,B);

% Find the nr MMs and ERTs
for i=1:B
    i
    [c_MMs(1,i) k_MMs(1,i) ERTs(1,i)] = wblmm(n, c, k);
end

c_MM_mean = mean(c_MMs);
c_MM_var = var(c_MMs);
k_MM_mean = mean(k_MMs);
k_MM_var = var(k_MMs);
ERT_mean = mean(ERTs);
ERT_var = var(ERTs);

means = [c_MM_mean k_MM_mean ERT_mean];
vars = [c_MM_var k_MM_var ERT_var];

%% Graphs
figure;
boxplot(c_MMs);
set(gca,'FontSize',14);
title('Boxplot  pour  c_M_M');
ylabel('c_M_M','fontsize',14);

figure;
boxplot(k_MMs);
set(gca,'FontSize',14);
title('Boxplot  pour  k_M_M');
ylabel('k_M_M','fontsize',14);

figure;
boxplot(ERTs);
set(gca,'FontSize',14);
title('Boxplot  pour  ERT_M_M');
ylabel('ERT_M_M','fontsize',14);

figure;
hist(c_MMs);
set(gca,'FontSize',14);
title ('Histogramme  pour  c_M_M');
xlabel('c_M_M','fontsize',14);
ylabel('nbre  de  c_M_M','fontsize',14);

figure;
hist(k_MMs);
set(gca,'FontSize',14);
title ('Histogramme  pour  k_M_M');
xlabel('k_M_M','fontsize',14);
ylabel('nbre  de  k_M_M','fontsize',14);

figure;
hist(ERTs);
set(gca,'FontSize',14);
title ('Histogramme  pour  ERT_M_M');
xlabel('ERT_M_M','fontsize',14);
ylabel('nbre  de  ERT_M_M','fontsize',14);

end