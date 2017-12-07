load train_data.txt;
load test_data.txt;
load Data.txt;

pcs = 5;

data = Data;
X = train_data(:,1:70);

[coeff, score, eigen] = pca(X);

covar = cov(X);
[V, D] = eig(covar);

tr_x = X*coeff(:,1:pcs);
tr_y = train_data(:,71);
test_x = test_data(:,1:70)*coeff(:,1:pcs);
test_y_r = test_data(:,71);

test_y = Log_regression(tr_x, tr_y, test_x, 500);

Y = test_y_r;
errs = test_y - Y;
FN = sum(errs < 0);
FP = sum(errs > 0);
%sum(errs == 0)
TP = sum(Y(errs == 0) == 1);
TN = sum(Y(errs == 0) == 0);
SENS = TP/(TP + FN);
SPEC = TN/(TN + FP);
mis = (FP + FN)/(FP + FN + TP + TN);

[TP FP FN TN mis SENS SPEC]