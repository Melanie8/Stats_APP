X = [11 12.25 10 12.25 11 11 14 12 12 12 12.25 14 11 10 10];
n = numel(X);
mu = sum(X) / n;
s2 = sum((X - mu).^2);
s = sqrt(s2);
Xs = sort(X);
if mod(n, 2) == 0
    median = (Xs(n/2) + Xs(n/2+1)) / 2;
else
    median = Xs((n+1)/2);
end
range = Xs(n) - Xs(1);
cv = s / mu;

%% Table directly importable in LaTeX
fp = fopen('q2.tex','w');
fprintf(fp, 'Moyenne                  & \\np{%d}\\\\\n', mu);
fprintf(fp, 'M\\''ediane                & \\np{%d}\\\\\n', median);
fprintf(fp, '\\''Ecart-type             & \\np{%d}\\\\\n', s);
fprintf(fp, '\\''Etendue                & \\np{%d}\\\\\n', range);
fprintf(fp, 'Coefficient de variation & \\np{%d}\\\\\n', cv);
fclose(fp);