load poisson.txt;

%-- A

x = [0:1:20];

lambda = 2;

p = zeros(length(x), 1);

for i=min(x):max(x)
    p(i+1) = PoissonDist(x(i+1), lambda);
end

scatter(x, p);

pause;


x = [0:1:20];

lambda = 6;

p = zeros(length(x), 1);

for i=min(x):max(x)
    p(i+1) = PoissonDist(x(i+1), lambda);
end

scatter(x, p);

pause;

%-- B

lambda = sum(poisson)/length(poisson)

%scatter([0:1:length(poisson)-1], poisson);

x = [0:1:length(poisson)];
p = zeros(length(x), 1);

for i=min(x):max(x)
    p(i+1) = PoissonDist(x(i+1), lambda);
end

scatter(x, p);
hold on;
plot([lambda lambda], [0 max(p)], '--');

'b'
pause;
hold off;

%-- C

x = [0:.1:10];

gammas = gampdf(x, 1, 2);

plot(x, gammas);

pause;

x = [0:.1:60];

gammas = gampdf(x, 3, 5);

plot(x, gammas);

pause;

%-- D

x = [0:.01:2];

plot(x, gampdf(x, 1 + sum(poisson)/length(poisson), 2/(length(poisson)*2+1)));

pause; 

x = [0:.01:2];

plot(x, gampdf(x, 3 + sum(poisson)/length(poisson), 5/(length(poisson)*2+1)));

pause; 

close all;