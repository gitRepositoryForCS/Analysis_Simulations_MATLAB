b = [0.3427 0.3859 0.4120 0.4219 0.4125 0.3811 0.3256 0.2443 0.1360 0.0000]';
t = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
B = vander(t);
[x y] = size(B);
for i = 1:5
    A(:,i) = B(:,y);
    y = y - 1;
end
A = A(:,1:5);   %A is automatically set to x * y(same size as B)
%*********Pseudoinverse method********************
Ainverse = pinv(A);
x1 = Ainverse * b
%*********QR Decomposition********************
[Q R] = qr(A);
C = Q'*b;
[m n] = size(R);
Cprime = C(1:n,1);
R = R(1:n,1:n);
x2 = inv(R)*Cprime
%*********Matlab Backslash********************
x3 = A\b
