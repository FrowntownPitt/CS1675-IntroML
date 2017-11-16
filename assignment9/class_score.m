function [ score ] = class_score( idx, class, n )
%CLASS_SCORE Scores clusters by mismatch

for i=0:n-1
    scores(i+1) = max(sum(class(idx==i) == 1), sum(class(idx==i) == 0));
end

score = sum(scores);

end

