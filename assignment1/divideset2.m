function [ training_set, testing_set ] = divideset2( dataset, p_train )
%DIVIDESET2 splits dataset (matrix) into p_train ratio train/test sets
%   takes the dataset (represented as a matrix) and the probability p_train
%   and returns two non-overlapping datasets: the training and testing data
%   split by the ratio p_train

training_count = round(p_train * length(dataset));

indices = randperm(length(dataset), training_count);

t = zeros([length(dataset) 1]);

t(indices) = 1;

training_set = dataset(t(:) == 1,:);
testing_set = dataset(t(:) == 0,:);

end

