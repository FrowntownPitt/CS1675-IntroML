function [ expanded ] = extendx( x )
%EXTENDX matrix input x, expands to include linear and d-2 polynomial

expanded = [ones(size(x,1),1) x];
for i=1:size(x,2)
    for j=i:size(x,2)
        expanded = [expanded 2*x(:,i).*x(:,j)];
    end
end
%expanded = [ones(length(x),1) sum(x,2) sum(sum(x,2).*x,2)];

end

