sys = tf([1 4 5],[1 3 2 0]);
figure(1)
%rlocus(sys)
for k = -2:0.1:50
    root0 = rand(1);
    s0 = -root0 - i*(-1-k);
    s = newton_root3(s0,k);
    hold on;
    if s ~= 0
         plot(s,'rx')
    end
    s0 = -root0 + i*(-1-k);
    s = newton_root3(s0,k);
    hold on;
    if s ~= 0
         plot(s,'rx')
    end
    s0 = i*(-1-root0);
    s = newton_root3(s0,k);
    hold on;
    if s ~= 0
         plot(s,'rx')
    end
end
hold on
rlocus(sys)
legend('Red x is roots result')
title('Compare roots vs "rlocus" command')
hold off;
function y = newton_root3(s0,k)
while(1)
    clear s;
    clear s1;
    s1 = s0 - (s0.^3+(3+k).*(s0.^2)+(2+4*k).*s0+5*k)./(3*(s0.^2)+2*(3+k).*s0+2+4*k);
    s2 = s1 - (s1.^3+(3+k).*(s1.^2)+(2+4*k).*s1+5*k)./(3*(s1.^2)+2*(3+k).*s1+2+4*k);
    if (norm(abs(s2-s1)) > norm(abs(s1-s0)))
         y = 0;
    break;
    end
    if (norm(abs(s2-s1)) < 0.01)
         y = s2;
         break;
    end
    s0 = s2;
    end
end