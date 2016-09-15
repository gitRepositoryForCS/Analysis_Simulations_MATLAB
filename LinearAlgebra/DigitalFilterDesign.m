%*********** 5th order filter ************
clear all;
clc;
%*********** band outputs ************
for i = 1:5
    H(i,:) = 0;
end
for i = 6:10
    H(i,:) = 1;   
end
for i = 11:15
    H(i,:) = 0;   
end
%*********** frequency band step ************
step = pi/32;
for i = 1:16
    w(i) = step.*i;
end
%*********** Get A ************
for i = 1:16
    for j= 1:5
        A1(i,j) = cos((j-1)*w(i));
    end
end
%*********Pseudoinverse method********************
a1 = A1\H;

% Ainverse2 = pinv(A2);
% a2 = Ainverse2 * H;

%*********Compare 2 filters********************
wfreq = 0:0.1:pi;
%wfreq = w(1)
h5th = a1(1)+a1(2)*cos(wfreq)+a1(3)*cos(2*wfreq)+a1(4)*cos(3*wfreq)+a1(5)*cos(4*wfreq);
figure(1)
plot(wfreq, h5th, w,H)
title('Filters Comparation')
legend('5th order filter','ideal filter')
grid


