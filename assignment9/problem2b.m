load clustering_data.txt;
data = clustering_data;

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

        b(x,1) = cluster_score(data, C1, idx1);
        b(x,2) = cluster_score(data, C2, idx2);
    end
    
    best(comp,:) = [min(b(:,1)) min(b(:,2))];
end

better = sum(best(:,1) < best(:,2))