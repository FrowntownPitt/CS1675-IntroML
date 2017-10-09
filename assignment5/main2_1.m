load pima.txt;

class0 = pima(pima(:,9) == 0, :);
class1 = pima(pima(:,9) == 1, :);

for a=1:8
    figure()
    histogram_analysis(class0(:,a));
end