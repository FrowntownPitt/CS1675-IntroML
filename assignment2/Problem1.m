load mean-study-data.txt

msd = mean_study_data;

'Part 1'
mean_msd = mean(msd)
std_msd  = std(msd)

pause;

'Part 3'

subsamples = zeros(1000,1);

for i=1:1000
    subsamples(i) = mean(subsample(msd,25));
end

h = histogram(subsamples, 20);

hold on;

mean_subsamples = mean(subsamples)
std_subsamples = std(subsamples)

plot([mean_msd mean_msd], [0 (max(h.Values)*1.1)]);
plot([mean_msd-std_msd mean_msd-std_msd], [0 (max(h.Values))]);
plot([mean_msd+std_msd mean_msd+std_msd], [0 (max(h.Values))]);
xlim([mean_msd-std_msd*1.1, mean_msd+std_msd*1.1]);

pause;

%--------------------------------------

'Part 5'

subsamples = zeros(1000,1);

for i=1:1000
    subsamples(i) = mean(subsample(msd,40));
end

h = histogram(subsamples, 20);

mean_subsamples = mean(subsamples)
std_subsamples = std(subsamples)

pause;

close all;