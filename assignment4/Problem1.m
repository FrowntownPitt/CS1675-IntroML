load housing.txt;

% A - 1 binary value, CHAS (4)

targetcorr = corrcoef(housing);
corrs14 = targetcorr(:,14)

[maxcorr, maxcorrI] = max(corrs14(1:13))
[mincorr, mincorrI] = min(corrs14(1:13))

for i=1:13
    figure();
    scatter(housing(:,i), housing(:,14));
    %pause;
end

%pause;

close all;

corrs = corrcoef(housing);
corrs(corrs >= 1.0) = 0.0;

corrs = tril(corrs);

corrs = abs(corrs);
[t, indx] = max(corrs)
[m, indy] = max(t)


for i=1:14
    for j=i+1:14
        scatter_plot(horzcat(housing(:,i), housing(:,j)));
        xlabel(i)
        ylabel(j)
        pause;
    end
end

close all;