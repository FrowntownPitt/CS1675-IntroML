function [ train, test ] = kfold_crossvalidation( data, k, m )
%KFOLD_CROSSVALIDATION returns the training and testing data sets
%   takes the data, k (the number of folds) and m (the target fold) as 
%   inputs, and returns the training and testing data sets, such that the 
%   testing set corresponds to m-th fold under the k-th fold cross-
%   validation scheme

size = length(data)/k;

remainder = (size - floor(size))*k;
size = floor(size);

if m < remainder
    x = m*(size+1) - size;
    y = x + size;
else
    x = remainder*(size+1) +(m-remainder-1)*size + 1;
    y = x + size - 1;
end

test = data(x:y);

if m == 1
    train = data(y+1:length(data));
elseif m==k
    train = data(1:x-1);
else
    train = vertcat(data(1:x-1), data(y+1:length(data)));
end

end

