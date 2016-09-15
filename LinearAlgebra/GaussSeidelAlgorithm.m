clear all;
clc;

A = [-5 0 2 0 -1; 0 9 0 3 0; 2 0 5 0 2; 0 -2 0 4 0; -1 0 7 0 7];
b = [8 4 -8 -4 0]';
x0 = [0 0 0 0 0]';
err = 100;

%function x = GaussSeidal(A, b, x0, N)
n = numel(x0);
x = zeros(size(x0));
while (1)
    xold = x;
    for i =1:n
        sum = 0;
        for j = 1:i-1
            sum = sum + A(i,j)*x(j);    %Note the first part is different as Jacobi method
        end
        for j = i+1:n
            sum = sum + A(i,j)*xold(j); %Note the second part is same as Jacobi method
        end
        x(i) = (b(i) - sum)/A(i,i);
    end
    if(norm(x-xold) < err)
        x
        break;
    end
end