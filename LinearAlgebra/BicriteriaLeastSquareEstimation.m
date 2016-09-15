clc;
clear all;
m = 9;
n = 1001;
step = 0.002;
for i = 1:1001
    t(i) = -1+(i-1)*step;
end
B = vander(t);
 
[x y] = size(B);
for i = 1:9
    A(:,i) = B(:,y);
    y = y - 1;
end
A = A(:,1:9);
[Q,R] = qr(A,0);
% for i = 1:1001
%     Column = Q(:,i);
%     P0(i) = norm(Column);
% end
figure(1)
scale = Q(1001,:);
Q = Q * diag(1./scale);
plot(Q)
grid

figure(2)
for i = 1:9
    %Scalevector = Q(:,3);
    plot(t,Q(:,i)')
    hold on
end
grid
axis([-1.05 1.05 -1.1 1.1]);

