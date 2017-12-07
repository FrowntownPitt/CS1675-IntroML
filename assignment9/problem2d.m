load clustering_data.txt;
load class_labels.txt;
data = clustering_data;
class = class_labels;

clear idx_save;

k=2;
n = 40;

for x=1:30
    rnd = randperm(size(data,1));
    for i=1:k
        centroids(i,:) = mean(data(rnd(n*(i-1)+1:n*i),:),1);
    end
    
    [idx, C, sumd, D] = kmeans(data,2,'Start',centroids);

    idx_save(x,:) = idx;
    scores(x) = class_score(idx-1, class, 2);
    
end
idx_save = idx_save';
[score_best, index] = max(scores);
%idx_best = idx_save(:,index);
idx_best = idx_save(:,14);

for p=1:1000
    idx_perm = idx_best(randperm(length(idx_best)));
    dist(p) = class_score(idx_perm-1, class, 2);
end

hist(dist)