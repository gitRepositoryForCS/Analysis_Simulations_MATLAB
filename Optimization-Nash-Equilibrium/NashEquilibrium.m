MAXITER = 5000;
ALPHA = 0.01;
x = 20 + 50*rand(1,2);
plot(x(1),x(2),'ro');
hold on;
xlim([0 80]); ylim([0 80]);
for i = 1: MAXITER
    z = OptimalResponseFunc(x);
    x = (1-ALPHA)*x + ALPHA*z;
    plot(x(1),x(2),'g.');
end
plot(x(1),x(2),'bp');

function z = OptimalResponseFunc(x)
nif = @(y) (-1*NikaidoIsoda(x,y));
options = optimset;
options = optimset(options, 'MaxIter', 20000, 'MaxFunEvals', 80000);
x0 = 20 + 50*rand(1,2); % initial value in fminsearch
% ADD YOUR FMINSEARCH COMMAND BELOW THIS LINE
function psi = NikaidoIsoda(x,y)
t1 = payoff1([y(1) x(2)]) - payoff1(x);
t2 = payoff2([x(1) y(2)]) - payoff2(x);
psi = t1 + t2;
function phi1 = payoff1(x)
alpha = 80;
rho = 0.5;
lamda1 = 55;
qty = x(1)+x(2);
phi1 = (alpha - rho*qty)*x(1) - lamda1*sqrt(x(1));