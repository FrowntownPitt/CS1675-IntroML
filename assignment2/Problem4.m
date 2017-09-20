x =  [2,3,4,5,6,7,8,9,10,11,12];
px = [1,2,3,4,5,6,5,4,3 ,2 ,1 ];

expected_value = sum(x.*(px./sum(px)));

((36-px(4-1))/36)^5

(sum(px(rem(x, 2) == 0))/36)^5

'Part d'
x = [-3:.1:3];
norm = normpdf(x, 0, 1);

plot(x, norm);

hold on;

norm = normpdf(x, 0.5, 1);
plot(x, norm);

norm = normpdf(x, 0, 2);
plot(x, norm);

pause;

close all;