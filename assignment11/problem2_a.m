load train_data.txt;

data = train_data;

X = data(:,1:70);
Y = data(:,71);

[coeff, score, eigen] = pca(X);

covar = cov(X);
[V, D] = eig(covar);