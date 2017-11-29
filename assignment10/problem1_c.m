load hw10_train.txt;
load hw10_test.txt;

tr_x = hw10_train(:,1:65);
tr_y = hw10_train(:,66);
test_x = hw10_test(:,1:65);
test_y = hw10_test(:,66);

err_test = zeros(10,1);
err_train = zeros(10,1);

for i=1:10
    for j=1:20
        [t_y] = Bag_classifier(tr_x,tr_y,test_x,sprintf('[@DT_base_simple,%d,[]]',i));
        err_test(i) = err_test(i) + sum(t_y == test_y)/size(test_y,1);
        [tr_y2] = Bag_classifier(tr_x,tr_y,tr_x,sprintf('[@DT_base_simple,%d,[]]',i));
        err_train(i) = err_train(i) + sum(tr_y2 == tr_y)/size(tr_y,1);
    end
    err_test(i) = err_test(i)/20;
    err_train(i) = err_train(i)/20;
end

[err_test'; err_train']
plot([1:10],err_test')
hold on
plot([1:10],err_train')