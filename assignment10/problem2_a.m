load Data.txt;

X = Data(:,1:70);
Y = Data(:,71);

scores = zeros(70,2);
scores(:,2) = 1:70;

for i=1:70
    scores(i) = Fisher_score(X(:,i),Y);
end

scores = sortrows(scores,1, 'descend');
top20 = scores(1:20,:);