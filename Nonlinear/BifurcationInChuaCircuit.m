%beta = 28
[t,x] = ode45(@chua,[0 300],[0 0 0.7]);
plot(x(:,1),x(:,2));
xlabel('x label')
ylabel('y label')
legend('beta = 28')
grid on !
[t,x] = ode45(@chua,[0 300],[0 0 0.7]);
plot(x(:,1),x(:,3));
xlabel('x label')
ylabel('z label')
legend('beta = 28')
grid on !
[t,x] = ode45(@chua,[0 300],[0 0 0.7]);
plot(x(:,2),x(:,3));
xlabel('y label')
ylabel('z label')
legend('beta = 28')
grid on !
%beta = 55
[t,x] = ode45(@chua,[0 300],[0 0 0.7]);
plot(x(:,1),x(:,2));
xlabel('x label')
ylabel('y label')
legend('beta = 55')
grid on !
[t,x] = ode45(@chua,[0 300],[0 0 0.7]);
plot(x(:,1),x(:,3));
xlabel('x label')
ylabel('z label')
legend('beta = 55')
grid on !
[t,x] = ode45(@chua,[0 300],[0 0 0.7]);
plot(x(:,2),x(:,3));
xlabel('y label')
ylabel('z label')
legend('beta = 55’)
grid on