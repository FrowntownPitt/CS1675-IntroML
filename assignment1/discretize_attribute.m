function [ binned ] = discretize_attribute( attribute, k )
%DISCRETIZE_ATTRIBUTE puts attributes into k discrete bins
%   takes a vector of attribute values, a number k (number of bins) and 
%   assings each value to one of the k bins.

    minval = min(attribute);
    maxval = max(attribute);
    
    bindiv = (maxval - minval)/k;
    
    binned = fix((attribute-minval)/bindiv);

end