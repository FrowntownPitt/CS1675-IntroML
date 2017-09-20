load pima.txt

'Part A'

ind0 = pima(:,9) == 0;
ind1 = pima(:,9) == 1;

class0 = pima(ind0,:);
class1 = pima(ind1,:);


mean0 = mean(class0)
std0 = std(class0)

mean1 = mean(class1)
std1 = std(class1)

% -------------------------------------

'Part b'

testcount = 0;
traincount = 0;

for i=1:20
    [train, test] = divideset1(pima, 0.66);
    testcount = testcount + size(test,1);
    traincount = traincount + size(train,1);
end


testcount = testcount / 20
traincount = traincount / 20

testcount + traincount

testchance = testcount/size(pima,1)
trainchance = traincount/size(pima,1)


% -------------------------------------

'Part c'

testcount2 = 0;
traincount2 = 0;

for i=1:20
    [train2, test2] = divideset2(pima, 0.66);
    testcount2 = testcount2 + size(test2,1);
    traincount2 = traincount2 + size(train2,1);
end


testcount2 = testcount2 / 20
traincount2 = traincount2 / 20

testcount2 + traincount2

testchance2 = testcount2/size(pima,1)
trainchance2 = traincount2/size(pima,1)