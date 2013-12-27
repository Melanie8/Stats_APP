Y = getY();
n = numel(Y);
mu = sum(Y) / n;
s2 = sum((Y - mu).^2) / (n-1);
s = sqrt(s2);
Ys = sort(Y);
if mod(n, 2) == 0
    median = (Ys(n/2) + Ys(n/2+1)) / 2;
else
    median = Ys((n+1)/2);
end
range = Ys(n) - Ys(1);
cv = s / mu;

p = sum(Y >= 12) / n;

%% Table directly importable in LaTeX
fp = fopen('val.tex','w');
fprintf(fp, '$n$                      & \\np{%d}\\\\\n', n);
fprintf(fp, 'Moyenne                  & \\np{%d}\\\\\n', mu);
fprintf(fp, 'M\\''ediane                & \\np{%d}\\\\\n', median);
fprintf(fp, '\\''Ecart-type             & \\np{%d}\\\\\n', s);
fprintf(fp, '\\''Etendue                & \\np{%d}\\\\\n', range);
fprintf(fp, 'Coefficient de variation & \\np{%d}\\\\\n', cv);
fprintf(fp, 'Proportion de r\\''eussite & \\np{%d}\\\\\n', p);
fclose(fp);