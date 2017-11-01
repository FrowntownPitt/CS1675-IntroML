%%% kNN classifier for pima
%%% *************************************************************
%%% Milos Hauskrecht
%%% CS1675 Intro to Machine Learning, University of Pittsburgh
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% load the train and test data (both are normalized)
load pima_train.txt;
load pima_test.txt;

mu = mean(pima_train);
sig = std(pima_train);

pima_train = (pima_train - mu)./sig;
pima_test =  (pima_test  - mu)./sig;

tr_data = pima_train;
test_data = pima_test;

data_col= size(tr_data,2)
n_features = data_col - 1

%%% create x
x = tr_data(:,1:n_features);
%% create y vector
y=tr_data(:,data_col);
 
%% builds x for the the test set
x_test = test_data(:,1:n_features);
%% builds y vector for the test set
y_test=test_data(:,data_col);

%%%% NEW knn classifier ode in Matlab
%%%% learn the 3NN classifier using the Euclidean metric
knn_model=fitcknn(x,y, 'NumNeighbors', 7, 'distance', 'euclidean');
%%% classify examples in the test set
y_pred=predict(knn_model,x_test);

%%%% OLD knn classifier code in Matlab
%%%% y_pred=knnclassify(x_test,x,y,3,'euclidean')

error= sum(abs(y_pred-y_test))/size(y_test,1)
accuracy=1-error
