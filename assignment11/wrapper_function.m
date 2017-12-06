function [ features ] = wrapper_function( data, params )
%WRAPPER_FUNCTION Summary of this function goes here
%   Detailed explanation goes here

% [test_y] = Bag_classifier(tr_x,tr_y,test_x,'[@SVML_base,5,[]]');
% test_single 	= feval(base_classifier, tr_x(indices,:), tr_y(indices), test_x, alg_params);
% [base_classifier, k_max, alg_params] = process_params(params);

% '[@func,[params]]'
%load Data.txt;
%data = Data;
numfeats = size(data,2)-1;
%params = '[@DT_base_simple,[]]';

[base_classifier, alg_params] = process_params(params);

indices = crossvalind('Kfold', size(data,1), 3);

feats = 1:size(data,2)-1;
err = 1;
features = [];

for allfeats=1:numfeats
    for f=1:length(feats)
        new_err = 0;
        % do 3-fold crossval, calculate running error. 
        for i=1:3
            tr_x = data(indices==i,1:numfeats);
            tr_y = data(indices==i,numfeats+1);
            test_x = data(indices~=i,1:numfeats);
            test_y = data(indices~=i,numfeats+1);

            % evaluate with previously selected features and this new feature
            tr_x = tr_x(:,horzcat(features,feats(f)));
            test_x = test_x(:,horzcat(features,feats(f)));

            test_single = feval(base_classifier, tr_x(:,:), tr_y, test_x(:,:), alg_params);

            new_err = new_err + sum(test_y == test_single)/length(test_single);
        end

        errs(f) = new_err/3;

    end

    % find best error, add that to the feature set.
    [min_err, I] = min(errs);
    if min_err < err
        err = min_err;
        features = horzcat(features, feats(I));
        feats = feats(feats~=I);
    else
        break;
    end
    
    errs = [];
end


end

