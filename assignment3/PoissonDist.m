function [ result ] = PoissonDist( x, lambda )
%POISSON Summary of this function goes here
%   Detailed explanation goes here

result = exp(-lambda)*(lambda^x)/factorial(x);

end

