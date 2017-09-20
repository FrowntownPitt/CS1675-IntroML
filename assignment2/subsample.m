function [ newdata ] = subsample( data, k )
%subsample Randomly selects k instances from data

n = randperm(length(data),k);

newdata = data(n(1:k));

end

