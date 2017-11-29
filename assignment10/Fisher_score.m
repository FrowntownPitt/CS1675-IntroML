function [ score ] = Fisher_score( X, Y )

x_0 = X(Y == 0);
x_1 = X(Y == 1);

score = (mean(x_0) - mean(x_1))^2/(std(x_0)^2 + std(x_1)^2);

end

