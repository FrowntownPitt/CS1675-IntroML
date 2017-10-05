function [ expanded ] = extendx( x )
%EXTENDX matrix input x, expands to include linear and d-2 polynomial

expanded = [ones(length(x),1) sum(x,2) sum(sum(x,2).*x,2)];

end

