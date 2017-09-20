% 2x

syms x

a = 2*x;
da = diff(a);

b = x + 2*x^3;
db = diff(b);

c = exp(x);
dc = diff(c);

d = sin(x^2);
dd = diff(d);

e = 1/x;
de = diff(e);

f = 1/(x+x^2);
df = diff(f);

g = log(x^5);
dg = diff(g);

h = sym(5);
dh = diff(h);

syms i n
j = log(symprod(x^i, i, 1, n));
dj = simplify(diff(j));