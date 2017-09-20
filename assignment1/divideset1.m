function [ training_set, testing_set ] = divideset1( dataset, p_train )
%divideset1 splits dataset (matrix) into train/test sets with p_train prob
%   takes the dataset (represented as a matrix) and the probability p_train
%   of selecting the data entry (a row in the matrix) into the training 
%   set. The function returns two non-overlapping datasets: the 
%   training and testing data, such that every entry is selected to the 
%   training set randomly with probability p_train.

rand_vals = rand(size(dataset,1),1);

training_set = dataset(rand_vals(:) <= p_train,:);
testing_set  = dataset(rand_vals(:) > p_train,:);


end

