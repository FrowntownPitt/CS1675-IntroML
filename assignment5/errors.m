function [ TP, TN, FP, FN ] = errors( X, W, Y )
%ERRORS Summary of this function goes here
%   Detailed explanation goes here

vals = zeros(size(X, 1),1);
for row=1:1:size(X,1)
    vals(row) = 1/(1+exp(-(W'*X(row,:)')));
end
vals(vals <  .5) = 0;
vals(vals >= 0.5) = 1;

errs = vals - Y;
FN = sum(errs < 0);
FP = sum(errs > 0);
%sum(errs == 0)
TP = sum(Y(errs == 0) == 1);
TN = sum(Y(errs == 0) == 0);

end

