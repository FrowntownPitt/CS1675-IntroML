load housing_test.txt;
load housing_train.txt;

test = housing_test;
train = housing_train;

w_train = LR_solve(train(:,1:13), train(:,14));

y_train = LR_predict(train(:,1:13), w_train);

mse_train = sum((y_train - train(:,14)).^2)/length(train(:,14))

y_test = LR_predict(test(:,1:13), w_train);

mse_test = sum((y_test - test(:,14)).^2)/length(test(:,14))

w_train