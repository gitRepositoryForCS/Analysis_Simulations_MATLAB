function [Q R] = hh(Amat)
%function [Q R] = hh(Amat)
%where Amat = Q*R
%use this in Q 3(ii) on QR decomposition
[m n]=size(Amat);
Q = zeros(m,n); R = zeros(n,n);
for k=1:n
    a=Amat(k:m,k);
    e1=eye(m-k+1,1);
    if (a(1)==0)
         alpha=1*norm(a,2);
    else
          alpha=1*sign(a(1))*norm(a,2);
    end;
    v=a + alpha*e1;
    beta=v'*v;
    if beta~=0
        for j=k:n
            aj=Amat(k:m,j);
            gamma=v'*aj;
            Amat(k:m,j)=A(k:m,j)-2*gamma*v/beta;
        end
    end
end;