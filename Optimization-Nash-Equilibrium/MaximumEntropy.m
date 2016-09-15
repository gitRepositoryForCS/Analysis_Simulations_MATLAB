%Get parameters for equations
A = 3.71; %6885.76/1856
alpha = [2.5 2.6 3.0 3.25 3.45 3.5 3.85 3.95];
% Find mu1 and mu2 seperately
sum1 = @(u) A*(exp(u*alpha(1))+exp(u*alpha(2))+exp(u*alpha(3))+
exp(u*alpha(4))+exp(u*alpha(5))+exp(u*alpha(6))+exp(u*alpha(7))+
exp(u*alpha(8)))-(alpha(1)*exp(u*alpha(1))+alpha(2)*exp(u*alpha(2))+alpha(3)*exp(
u*alpha(3))+alpha(4)*exp(u*alpha(4))+alpha(5)*exp(u*alpha(5))+alpha(6)*exp(u
*alpha(6))+alpha(7)*exp(u*alpha(7))+alpha(8)*exp(u*alpha(8)));
mu2 = fzero(sum1,0);
sum2 = @(u) u-1+log(exp(mu2*alpha(1))+exp(mu2*alpha(2))+exp(mu2*alpha(3))+exp(
mu2*alpha(4))+exp(mu2*alpha(5))+exp(mu2*alpha(6))+exp(mu2*alpha(
7))+exp(mu2*alpha(8)));
mu1 = fzero(sum2,0);
for i = 1 : 8
    p(i) = exp(-1+mu1+mu2*alpha(i));
end
format compact
for i = 1 : 8
    disp([num2str(p(i)) ' vs ' num2str(p(i)*1856)]);
end