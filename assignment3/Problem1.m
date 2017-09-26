load coin.txt;

theta = sum(coin(:) == 1);
total = theta + sum(coin(:) == 0);

ml_estimate = theta/total;

%----------------------

prior = [1 1]

figure();

hold on;

map_estimate = (prior(1) - 1)/(prior(1) + prior(2) - 2);

plot([0:.01:1], betapdf([0:0.01:1], prior(1), prior(2)));
plot([map_estimate map_estimate], [0 max(betapdf([0:0.01:1], prior(1), prior(2)))]); 

prior(1) = prior(1) + theta;
prior(2) = prior(2) + (total-theta);

map_estimate = (prior(1) - 1)/(prior(1) + prior(2) - 2);

plot([0:.01:1], betapdf([0:0.01:1], prior(1), prior(2)));
plot([map_estimate map_estimate], [0 max(betapdf([0:0.01:1], prior(1), prior(2)))]);

%----------------------
 
pause;

hold off;

%----------------------
%----------------------

prior = [4 2]

figure();

hold on;

map_estimate = (prior(1) - 1)/(prior(1) + prior(2) - 2);

plot([0:.01:1], betapdf([0:0.01:1], prior(1), prior(2)));
plot([map_estimate map_estimate], [0 max(betapdf([0:0.01:1], prior(1), prior(2)))]); 

prior(1) = prior(1) + theta;
prior(2) = prior(2) + (total-theta);

map_estimate = (prior(1) - 1)/(prior(1) + prior(2) - 2);

plot([0:.01:1], betapdf([0:0.01:1], prior(1), prior(2)));
plot([map_estimate map_estimate], [0 max(betapdf([0:0.01:1], prior(1), prior(2)))]);

%----------------------
 
pause;

close all;