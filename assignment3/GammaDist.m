function [ result ] = GammaDist( lambda, a, b )
%GAMMADIST Summary of this function goes here
%   Detailed explanation goes here

result = (1/(b^a * gamma(a))) * lambda^(a-1) * exp(-lambda/b);

end

