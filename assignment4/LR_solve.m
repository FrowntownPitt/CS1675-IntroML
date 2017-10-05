function [ w ] = LR_solve( X, y )
%LR_solve matrix data X, result vector y, returns weights vector w

w = X\y;

end

