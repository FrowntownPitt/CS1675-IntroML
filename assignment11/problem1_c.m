load train_data.txt;
load test_data.txt;

tr_x = train_data(:,1:size(train_data,2)-1);
tr_y = train_data(:,size(train_data,2));
test_x = test_data(:,1:size(test_data,2)-1);
test_y_r = test_data(:,size(test_data,2));

data = horzcat(tr_x, tr_y);

features = wrapper_function(data, '[@Log_regression,10]')

% 11, 30, 32, 8

if length(features) < 4
    features = [11 30 32 8];
    %features = [19 3 52 30 9];
    %features = [29,32,30,9,1];
end

test_y_full = Log_regression(tr_x, tr_y, test_x, 500);
test_y_wrap = Log_regression(tr_x(:,features), tr_y, test_x(:,features), 500);

Y = test_y_r;

errs = test_y_wrap - Y;
FN = sum(errs < 0);
FP = sum(errs > 0);
%sum(errs == 0)
TP = sum(Y(errs == 0) == 1);
TN = sum(Y(errs == 0) == 0);
SENS = TP/(TP + FN);
SPEC = TN/(TN + FP);
mis = (FP + FN)/(FP + FN + TP + TN);

[TP FP FN TN mis SENS SPEC]


errs = test_y_full - Y;
FN = sum(errs < 0);
FP = sum(errs > 0);
%sum(errs == 0)
TP = sum(Y(errs == 0) == 1);
TN = sum(Y(errs == 0) == 0);
SENS = TP/(TP + FN);
SPEC = TN/(TN + FP);
mis = (FP + FN)/(FP + FN + TP + TN);

[TP FP FN TN mis SENS SPEC]