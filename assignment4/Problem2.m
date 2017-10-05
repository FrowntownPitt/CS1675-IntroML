load housing_train.txt;

w = LR_solve(housing_train(:,1:13), housing_train(:,14));

LR_predict(housing_train(:,1:13), w);