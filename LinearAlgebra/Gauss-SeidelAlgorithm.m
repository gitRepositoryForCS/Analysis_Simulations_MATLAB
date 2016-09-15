function x = GaussSeidel(A, b, x0, N)%function x = GaussSeidel(A, b, x0, N)%Performs a single iteration of Gauss-Seidel 
%Modify this code so that it performs N iterations 
%x0 is the value of x from each previous iteration n = numel(x0);x = zeros(size(x0));for i = 1:n
sum = 0;for j = 1:i-1      sum = sum + A(i,j)*x(j);for j = i+1:nend      sum = sum + A(i,j)*x0(j);x(i) = (b(i) – sum)/A(i,i);end end