function [ test_y ] = DT_base_simple( tr_x, tr_y, test_x, params )

Mdl = fitctree(tr_x,tr_y, 'MaxNumSplits', 7);

test_y = predict(Mdl, test_x);

return;