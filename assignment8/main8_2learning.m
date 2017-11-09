load pneumonia.tex;

data = pneumonia;

fever = data(data(:,5) == 1,1:4);
fever_p_t = sum(fever(:,1) == 1)/size(fever,1);
fever2 = data(data(:,5) == 0,1:4);
fever_p_f = sum(fever2(:,1) == 1)/size(fever2,1);


pale = data(data(:,5) == 1,1:4);
pale_p_t = sum(pale(:,2) == 1)/size(pale,1);
pale2 = data(data(:,5) == 0,1:4);
pale_p_f = sum(pale2(:,2) == 1)/size(pale2,1);


c = data(data(:,5) == 1,1:4);
c_p_t = sum(c(:,3) == 1)/size(c,1);
c2 = data(data(:,5) == 0,1:4);
c_p_f = sum(c2(:,3) == 1)/size(c2,1);


wbc = data(data(:,5) == 1,1:4);
wbc_p_t = sum(wbc(:,4) == 1)/size(wbc,1);
wbc2 = data(data(:,5) == 0,1:4);
wbc_p_f = sum(wbc2(:,4) == 1)/size(wbc2,1);