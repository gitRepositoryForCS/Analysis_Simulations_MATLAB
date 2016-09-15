clc;
clear all;
rand('seed',1);
A = round(100*rand(5,5)-50);
disp(A);
[m,n] = size(A);
Q = zeros(m,n);
R = zeros(n,n);

for j = 1:n
    residue = A(:,j);
    for i = 1:j-1
        R(i,j) = Q(:,i)'*A(:,j);
        residue = residue - R(i,j) * Q(:,i);
    end
    R(j,j) = norm(residue);
    Q(:,j) = residue/R(j,j);
end

Q
R

[MQ,MR] = qr(A)