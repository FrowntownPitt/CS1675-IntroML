load pima.txt

'Part a'
maxs = max(pima,[],1);
mins = min(pima,[],1);
ranges = [maxs(1:8); mins(1:8)]

pause

'Part b'
means = mean(pima,1);
means = means(1:8)

variance = var(pima,1);
variance = variance(1:8)

pause

'Part c'
classcorr = corrcoef(pima);
classcorr = classcorr(:,9)

pause

'Part d'
correlations = corrcoef(pima);
correlations(correlations >= 1.0) = 0.0;
[t, indx] = max(correlations);
[m, indy] = max(t);
maxcorr = m
index = [indy; indx(indy)]

pause

'Part f'
for i=1:7
    hist(pima(:,i),20)
    figure()
end
hist(pima(:,i+1), 20)

pause

close all

for i=1:8
    for j=i+1:8
        scatter_plot(horzcat(pima(:,i),pima(:,j)))
        xlabel(i)
        ylabel(j)
        pause
    end
end

close all