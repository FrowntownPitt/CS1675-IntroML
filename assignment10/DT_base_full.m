function [ test_y ] = DT_base_full( tr_x, tr_y, test_x, params )

Mdl = fitctree(tr_x,tr_y);

test_y = predict(Mdl, test_x);

return;