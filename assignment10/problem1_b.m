load hw10_train.txt;
load hw10_test.txt;

tr_x = hw10_train(:,1:65);
tr_y = hw10_train(:,66);
test_x = hw10_test(:,1:65);
test_y = hw10_test(:,66);

err_test_bag = zeros(10,1);
err_train_bag = zeros(10,1);
err_test_boost = zeros(10,1);
err_train_boost = zeros(10,1);

for i=1:10
    for j=1:20
        [t_y] = Bag_classifier(tr_x,tr_y,test_x,sprintf('[@DT_base_full,%d,[]]',i));
        err_test_bag(i) = err_test_bag(i) + sum(t_y == test_y)/size(test_y,1);
        [tr_y2] = Bag_classifier(tr_x,tr_y,tr_x,sprintf('[@DT_base_full,%d,[]]',i));
        err_train_bag(i) = err_train_bag(i) + sum(tr_y2 == tr_y)/size(tr_y,1);
        
        [t_y] = Boost_classifier(tr_x,tr_y,test_x,sprintf('[@DT_base_full,%d,[]]',i));
        err_test_boost(i) = err_test_boost(i) + sum(t_y == test_y)/size(test_y,1);
        [tr_y2] = Boost_classifier(tr_x,tr_y,tr_x,sprintf('[@DT_base_full,%d,[]]',i));
        err_train_boost(i) = err_train_boost(i) + sum(tr_y2 == tr_y)/size(tr_y,1);
    end
    err_test_bag(i) = 1-err_test_bag(i)/20;
    err_train_bag(i) = 1-err_train_bag(i)/20;
    
    err_test_boost(i) = 1-err_test_boost(i)/20;
    err_train_boost(i) = 1-err_train_boost(i)/20;
end

[err_test_bag'; err_train_bag'];
[err_test_boost'; err_train_boost'];

plot([1:10],err_test_bag')
hold on
plot([1:10],err_train_bag')
figure();
plot([1:10],err_test_boost')
hold on
plot([1:10],err_train_boost')