function [ vals ] = calc_scores( X, W )
%ERRORS Summary of this function goes here
%   Detailed explanation goes here

vals = zeros(size(X, 1),1);
for row=1:1:size(X,1)
    vals(row) = 1/(1+exp(-(W'*X(row,:)')));
end

end

