load housing_test.txt;
load housing_train.txt;

g = init_progress_graph();
g.pause=0.1;

train_trials = 100000000;

test  = housing_test;
train = housing_train;

mu = mean(train);
sigma = std(train);

train_n = (train-mu)./sigma;
test_n  = (test -mu)./sigma;

w = zeros(length(train_n(1,:))-1,1);

y_test = LR_predict(test_n(:,1:13), w);
y_train = LR_predict(train_n(:,1:13),w);
mse_train = sum((y_train - train_n(:,14)).^2)/length(train_n(:,14));
mse_test  = sum((y_test - test_n(:,14)).^2)/length(test_n(:,14));
g = add_to_progress_graph(g, 0, mse_train, mse_test);

online_gradient_descent();

y_test = LR_predict(test_n(:,1:13), w);
y_train = LR_predict(train_n(:,1:13),w);
mse_train = sum((y_train - train_n(:,14)).^2)/length(train_n(:,14))
mse_test  = sum((y_test - test_n(:,14)).^2)/length(test_n(:,14))

w

%{
main4_3
-----------------------
1000 steps, 2/t
mse_train =

   34.2648


mse_test =

   68.2374


w =

    0.2343
    2.0068
    0.4363
   -0.3487
    8.5354
    1.3580
   -5.4657
    1.0777
   -4.7237
    0.4721
    2.4667
    2.6942
   -0.3014

-----------------------
1000 steps, 0.01
mse_train =

    0.2895


mse_test =

    0.1909


w =

   -0.0639
    0.0383
    0.0038
    0.0401
   -0.1707
    0.2284
   -0.0005
   -0.1767
    0.1175
   -0.0507
   -0.1213
    0.0385
   -0.4389

----------------------
1000 steps, 1/sqrt(t)
mse_train =

   3.6578e+55


mse_test =

   4.2665e+55


w =

   1.0e+27 *

   -6.4243
    0.9073
   -0.0581
    0.2486
    1.3197
    1.3353
   -1.4385
    0.6557
    1.5798
    0.4124
   -0.1403
   -0.0589
    0.7674

----------------------
1000 steps, 2/t^2
mse_train =

    0.8247


mse_test =

    0.9502


w =

   -0.1014
   -0.1454
    0.2605
   -0.0703
   -0.1729
    1.0100
    0.1962
   -0.1858
   -0.3084
   -0.2002
   -0.2226
    0.0840
   -0.2942

-----------------------
1000 steps, 1/t^3
mse_train =

    0.5577


mse_test =

    0.5534


w =

   -0.0684
   -0.0823
    0.0154
   -0.0452
   -0.1091
    0.5398
   -0.1313
    0.0170
   -0.1616
   -0.1405
   -0.1121
    0.0449
   -0.3686

-----------------------
1000 steps, .05
mse_train =

    0.9875


mse_test =

    0.8354


w =

    0.4199
   -0.1958
    0.2318
   -0.1120
   -0.3059
    0.2222
    0.2016
   -0.2337
    0.0543
   -0.2419
   -0.0677
    0.0768
   -0.3127

-----------------------
10000 steps, 2/t
mse_train =

    5.3167


mse_test =

    8.4973


w =

    0.3515
    0.2848
   -0.6689
    0.1589
    4.0562
    1.1946
   -1.8628
    0.5803
   -2.6102
    0.9293
    1.3450
    0.5061
   -0.2189


-----------------------
10000 steps, 0.05
mse_train =

    2.2434


mse_test =

    2.2665


w =

    1.3530
    0.1545
    0.0313
    0.0834
   -0.5613
   -0.2316
    0.2040
    0.0009
    0.0972
   -0.0325
   -0.1901
    0.0558
   -0.6242

%}