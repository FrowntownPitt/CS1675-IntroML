function [ score ] = AUROC_score( X, Y )
%AUROC_SCORE Summary of this function goes here
%   Detailed explanation goes here

[X,Y,T,AUC] = perfcurve(Y, X, 1);

score = AUC;

end

