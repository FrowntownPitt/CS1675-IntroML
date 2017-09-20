load mean-study-data.txt;

msd = mean_study_data;

results_train = zeros(10,2);
results_test  = zeros(10,2);

for i=1:10
    [train, test] = kfold_crossvalidation(msd, 10, i);
    results_train(i,:) = [mean(train); std(train)]';
    results_test(i,:)  = [mean(test);  std(test)]';
end