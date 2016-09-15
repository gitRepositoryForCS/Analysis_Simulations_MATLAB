function l = Q4(a,b,N)
A = zeros(N);
E=0.000001; !
for i=1:N
    A(i,i)= a;
    if i ~=1 && i~=N
         A(i,i-1)=b;
         A(i,i+1)=b;
    end
    if i ==1
        A(i,i+1)=b;
    end
    if i ==N
        A(i,i-1)=b;
    end
end
A=[1, 2, 3; 4, 5, 6; 1, 2, 3];
n = length(A);
y = [];
x = [];
for i = 1:n % starting vector
    x(i) = 1;
end;
l = 0;
blad = E; % starting value of error
num =100;
% while blad>=E
while num>0
    for i = 1:n % A*x
        y(i) = 0;
    for j = 1:n
        y(i) = y(i) + A(i,j)*x(j);
    end;
end;
blad = l;
l = 0; % Rayleigh
m = 0;
for i = 1:n
    l = l + x(i)*y(i);
    m = m + x(i)*x(i);
end;
l = l/m; % eigenvalue
blad = abs(l - blad); % error
x = y;
num=num-1;
end;
l
y
end
