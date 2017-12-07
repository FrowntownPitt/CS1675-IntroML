load train_data.txt;
load Data.txt;

data = Data;
X = train_data(:,1:70);

[coeff, score, eigen] = pca(X);

covar = cov(X);
[V, D] = eig(covar);

newData = data(:,1:70)*coeff(:,1:2);

figure();
hold on;
class0 = newData(data(:,71)==0,:);
class1 = newData(data(:,71)==1,:);
scatter(class0(:,1),class0(:,2))
scatter(class1(:,1),class1(:,2))