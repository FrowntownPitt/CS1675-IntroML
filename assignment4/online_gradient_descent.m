
for i=1:train_trials%length(train_n)
    ind = mod(i,length(train_n(:,:)))+1;
    alpha = 2/i;
    fxw = LR_predict(train_n(ind,1:13),w);
    w = (w' + alpha*(train_n(ind,14) - fxw)*train_n(ind,1:13))';
    if mod(i, 50) == 0
        y_test = LR_predict(test_n(:,1:13), w);
        y_train = LR_predict(train_n(:,1:13),w);
        mse_train = sum((y_train - train_n(:,14)).^2)/length(train_n(:,14));
        mse_test  = sum((y_test - test_n(:,14)).^2)/length(test_n(:,14));
        %g = add_to_progress_graph(g, i, mse_train, mse_test);
    end
end