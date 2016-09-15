function Xdot =atoms(t,X)
    x = X(1); y = X(2); z = X(3);
    sigma = 10;
    beta = 2.666667;
    rho = 28;
    xdot = sigma*(y - x);
    ydot = x*(rho - z) - y;
    zdot = x*y - beta*z;
    Xdot = [xdot ydot zdot]';
end
[t,X]= ode45(@atoms, [0, 20], [5,5,5]);
[t1,X1]= ode45(@atoms, [0, 20], [5.001,5.001,5.001]);
plot(t,X(:,1),'-')
hold on
plot(t1,X1(:,1),'--r')
xlabel('t')
ylabel('x')