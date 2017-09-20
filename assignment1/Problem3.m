load pima.txt;

[normalized, mu, sigma] = normalize(pima(:,3));

'normalized 1:5'
normalized(1:5)

binned = discretize_attribute(pima(:,3),10);

'discretized 1:5'
binned(1:5)