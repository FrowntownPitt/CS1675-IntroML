% Logistic regression using batch gradient descend
% inputs: 1. the input data
%         2. the output data
%         3. number of steps
% returns: final weights
%%% annealed learning: 2/sqrt(k)

function [ test_y ] = Log_regression(tr_x, tr_y, test_x, K)
%{
load Data.txt;
data = Data;
data = data(randperm(size(data,1),size(data,1)),:);
div = 190;
tr_x = data(1:div,1:size(data,2)-1);
tr_y = data(1:div,size(data,2));
test_x = data(div+1:259,1:size(data,2)-1);
test_y_r = data(div+1:259,size(data,2));
K = 500;
%}

col_ones = ones(size(tr_x, 1), 1);
tr_x = horzcat(col_ones, tr_x);           % add a column of ones on the left to X
W = ones(size(tr_x, 2), 1);            % initialize W to 1 to start with 

for k = 1:1:K                       %%% number of steps
    sum_err = 0;                    %%% initialize batch error function gradient
    for row = 1:1:size(tr_x, 1)
        x = tr_x(row,:)';
        y = tr_y(row,:);
        f = 1/(1 + exp(-(W'*x)));
        err = (y - f) * x;          % error (on-line gradient)
        sum_err = sum_err + err;    % update batch error function gradient
    end
    alpha = 2/k;
    W = W + (alpha * sum_err);
end


col_ones = ones(size(test_x, 1), 1);
test_x = horzcat(col_ones, test_x);

test_y = zeros(size(test_x,1),1);
for row = 1:1:size(test_x, 1)
    test_y(row) = 1/(1 + exp(-(W'*test_x(row,:)')));
end

test_y(test_y < 0.5) = 0;
test_y(test_y >= 0.5) = 1;

end