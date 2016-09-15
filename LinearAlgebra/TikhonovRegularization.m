t = (-500:500)'/500;
V = [t.^0 t.^1 t.^2 t.^3 t.^4 t.^5];
[Q,R]= qr(V,0);
scale = Q(1001,:);
Q = Q * diag(1./scale);
plot(Q)
grid