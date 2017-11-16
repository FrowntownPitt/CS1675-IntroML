load clustering_data.txt;
load class_labels.txt;
data = clustering_data;
class = class_labels;

k = 2;
n = floor(size(data,1)/k);

for comp=1:100
    for x=1:30
        rnd = randperm(size(data,1));
        for i=1:k
            centroids(i,:) = mean(data(rnd(n*(i-1)+1:n*i),:),1);
        end

        [idx1, C1, sumd1, D1] = kmeans(data,2,'Start',centroids);
        [idx2, C2, sumd2, D2] = kmeans(data,2);

        b1 = class_score(idx1-1, class, 2);
        b2 = class_score(idx2-1, class, 2);

        b(x,1) = mean([b1(1) b1(2)]);
        b(x,2) = mean([b2(1) b2(2)]);
    end

    best(comp,:) = [max(b(:,1)) max(b(:,2))];
    %best(comp,:) = [min(b(:,1)) min(b(:,2))];
end

better = sum(best(:,1) >= best(:,2))