g = [0;0;-1;0;-1];
A=[];
b=[];
Aeq=[1 1 0 0 -1;0 1 1 -1 0;1 0 -1 1 -1];
beq = [0;0;0];
lb=[0;0;0;0;0];
ub=[10;10;10;30;30];
y = linprog(g,A,b,Aeq,beq,lb,ub);