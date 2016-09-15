clear all;
clc;
N = 359;
t = (0:N)*2*pi/(N+1);
x = [cos(t') sin(t')];
figure(1)
subplot(2,2,1)
plot(x(:,1),x(:,2)),axis square;
title('Original x space')
grid
xlim([-1 1]),ylim([-1 1]);
%***************** A1 ********************
A1 = [1 2; -1 0];
y1 = A1*x';
subplot(2,2,2)
y1 = y1';
plot(y1(:,1),y1(:,2))
title('A1 projection space')
grid
%***************** A2 ********************
A2 = [0.707 -1; -0.5 1];
y2 = A2*x';
y2 = y2';
subplot(2,2,3)
plot(y2(:,1),y2(:,2))
title('A2 projection space')
grid
%***************** A3 ********************
A3 = [1 0.5; 2 1];
y3 = A3*x';
y3 = y3';
subplot(2,2,4)
plot(y3(:,1),y3(:,2))
title('A3 projection space')
grid
%***************** ||y1|| ********************
largestnormy1 = norm(y1(1,:));
smallestnormy1 = norm(y1(1,:));
for i = 1:length(y1)
    if norm(y1(i,:)) > largestnormy1
        largesty1 = y1(i,:);
        largestnormy1 = norm(largesty1);
        largestindexy1 = i;
    else
        if norm(y1(i,:)) < smallestnormy1
            smallesty1 = y1(i,:);
            smallestnormy1 = norm(smallesty1);
            smallestindexy1 = i;
        end
    end
end
subplot(2,2,2)
hold on
%quiver(0, 0, 2.2260, -0.5299)
plot([0,largesty1(1)], [0, largesty1(2)])
plot([0,smallesty1(1)], [0, smallesty1(2)])
%annotation('arrow',[0
0],[y1(largestindexy1,1),y1(largestindexy1,2)],'LineStyle','_','color');
hold off
%***************** ||y2|| ********************
largestnormy2 = norm(y2(2,:));
smallestnormy2 = norm(y2(2,:));
for i = 1:length(y2)
    if norm(y2(i,:)) > largestnormy2
        largesty2 = y2(i,:);
        largestnormy2 = norm(largesty2);
        largestindexy2 = i;
    else
        if norm(y2(i,:)) < smallestnormy2
            smallesty2 = y2(i,:);
            smallestnormy2 = norm(smallesty2);
            smallestindexy2 = i;
        end
    end
end
subplot(2,2,3)
hold on
plot([0,largesty2(1)], [0, largesty2(2)])
plot([0,smallesty2(1)], [0, smallesty2(2)])
hold off
%***************** ||y3|| ********************
largestnormy3 = norm(y3(1,:));
smallestnormy3 = norm(y3(1,:));
for i = 1:length(y3)
    if norm(y3(i,:)) > largestnormy3
        largesty3 = y3(i,:);
        largestnormy3 = norm(largesty3);
        largestindexy3 = i;
    else
        if norm(y3(i,:)) < smallestnormy3
            smallesty3 = y3(i,:);
            smallestnormy3 = norm(smallesty3);
            smallestindexy3 = i;
        end
    end
end
subplot(2,2,4)
hold on
plot([0,largesty3(1)], [0, largesty3(2)])
plot([0,smallesty3(1)], [0, smallesty3(2)])
hold off
%********************************************
% Q1-2
%********************************************
[U1,S1,V1]= svd(A1,0);
S1
largestnormy1
smallestnormy1
[U2,S2,V2]= svd(A2,0);
S2
largestnormy2
smallestnormy2
[U3,S3,V3]= svd(A3,0);
S3
largestnormy3
smallestnormy3
