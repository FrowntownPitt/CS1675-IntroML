load pima_train.txt;
load pima_test.txt;

X_train = pima_train(:,1:8);
Y_train = pima_train(:,9);

[w, b] = svml(X_train, Y_train, 1);

results = zeros(size(X_train,1),1);
for i=1:length(results)
    results(i) = apply_svml(X_train(i,:), w, b);
end

errs = results - Y_train;
FN = sum(errs < 0);
FP = sum(errs > 0);
%sum(errs == 0)
TP = sum(Y_train(errs == 0) == 1);
TN = sum(Y_train(errs == 0) == 0);

SENS_train = TP/(TP + FN);
SPEC_trian = TN/(TN + FP);
mis_train = (FP + FN)/(TP + TN + FP + FN);
confmat_train = [TP FP; FN TN];

% ------ test

X_test = pima_test(:,1:8);
Y_test = pima_test(:,9);

results = zeros(size(X_test,1),1);
for i=1:length(results)
    results(i) = apply_svml(X_test(i,:), w, b);
end

errs = results - Y_test;
FN = sum(errs < 0);
FP = sum(errs > 0);
%sum(errs == 0)
TP = sum(Y_test(errs == 0) == 1);
TN = sum(Y_test(errs == 0) == 0);

SENS_test = TP/(TP + FN);
SPEC_test = TN/(TN + FP);
mis_test = (FP + FN)/(TP + TN + FP + FN);
confmat_test = [TP FP; FN TN];


%------ ROC analysis
scores = zeros(size(pima_test,1),1);
labels = (pima_test(:,9) == 1);
for i=1:length(scores)
    scores(i) = w'*X_test(i,:)' + b;
end

[X,Y,T,AUC] = perfcurve(labels, scores, 1);
plot(X,Y);

xlabel('False positive rate')
ylabel('True positive rate')
title('ROC for Classification by Logistic Regression')