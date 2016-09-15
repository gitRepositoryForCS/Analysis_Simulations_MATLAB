m =7;n=6;
Amat= zeros(m,n);
for i=1:m
    for j =1:n
    Amat(i,j)=rem(2*i-j,5)+1;
    end
Bmat = Amat;
U = diag(ones(1,m)); %Identity matrix
k=2;
while( k<7)
    %for k=1:n
    a=Amat(k:m,k);
    u=U(k:m,k);
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
            Amat(k:m,j)=Amat(k:m,j)-2*gamma*v/beta;
            uj=U(k:m,j);
            gamma=v'*uj;
            U(k:m,j)=U(k:m,j)-2*gamma*v/beta;
        end
    end
    k=k+2;
end;
R = Amat; Q = U';