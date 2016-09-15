clear;
clc;
load('BPgraph.mat');
delta = zeros(N);
for i=1:25
    for j = 1:25
        delta(i,i)= delta(i,i)+W(i,j);
    end
end
%Compute Laplacian of the given graph
L = delta-W;
%Compute the Fiedler eigenvector
[V, ~] = eigs(L, 2, 'sm');
disp('Fiedler Vector');
fielder_vector = V(:,1)
for i=1:25
    if fielder_vector(i)<0
         P(i,1) = 0;
    else
         P(i,1)=1;
    end
end
showgraph(C,W,P);