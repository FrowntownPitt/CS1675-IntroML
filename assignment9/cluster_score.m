function [ score ] = cluster_score( X, C, idx )
%CLUSTER_SCORE Scores clusters by Mean Euclidean Distance
%   Detailed explanation goes here

score = mean(sum((C(idx,:)-X).^2,2).^0.5);

end

