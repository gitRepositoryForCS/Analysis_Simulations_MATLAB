a1 = 4.1; a2 = 21.5; b1 = 5.2; b2 = 12.8;
warning off all;
for xp = 1:30
    disp(xp);
    for yp = 1:20
        dBx = inline(['-(' num2str(yp) '-y)./((' num2str(xp) '-x).^2 + (' num2str(yp) '-y).^2)']);
        dBy = inline(['-(' num2str(xp) '-x)./((' num2str(xp) '-x).^2 + (' num2str(yp) '-y).^2)']);
        Bx(xp,yp) = dblquad(dBx,a1,a2,b1,b2);
        By(xp,yp) = dblquad(dBy,a1,a2,b1,b2);
    end
end
[xp yp] = meshgrid(1:30,1:20);
quiver(xp,yp,Bx',By');
hold on;
xlim([0 31]);ylim([0 21]);
fill([a1 a1 a2 a2],[b1 b2 b2 b1], 'm');