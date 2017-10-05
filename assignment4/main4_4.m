load housing_train.txt;
load housing_test.txt;

train = housing_train;
test  = housing_test;

train_ex = extendx(train(:,1:13));

w = train_ex\train(:,14)

test_ex = extendx(test(:,1:13));

y_test  = test_ex *w;
y_train = train_ex*w;

mse_test  = immse(y_test, test(:,14))
mse_train = immse(y_train, train(:,14))