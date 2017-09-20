function [ normalized, mu, sigma ] = normalize( attribute )
%NORMALIZE Summary of this function goes here
%   takes an unnormalized vector of attribute values and returns the vector
%   of values normalized according to the data mean and standard deviation.
    
    mu = mean(attribute);
    
    sigma = std(attribute);
    
    normalized = (attribute - mu)/sigma;

end

