%********************************************************
% HW Start
%********************************************************
% Method 1: 24 SVD for Y,I, Q
RGBOriginal = imread('konark.jpg');
RGB = double(RGBOriginal);
R = RGB(:,:,1)/255;
G = RGB(:,:,2)/255;
B = RGB(:,:,3)/255;
% Try im2double()
Y = 0.299*R + 0.587*G + 0.114*B;
I = 0.595716*R - 0.274453*G - 0.321263*B;
Q = 0.211456*R - 0.522591*G + 0.311135*B;
%************svd****************
[UY,SY,VY] = svd(Y);
[UI,SI,VI] = svd(I);
[UQ,SQ,VQ] = svd(Q);
N = 24;
CompressedY24 = UY(:,1:N)*SY(1:N,1:N)*VY(:,1:N)';%Transprot
CompressedI24 = UI(:,1:N)*SI(1:N,1:N)*VI(:,1:N)';%Transprot
CompressedQ24 = UQ(:,1:N)*SQ(1:N,1:N)*VQ(:,1:N)';%Transprot
CompressedYIQ24(:,:,1) = CompressedY24;
CompressedYIQ24(:,:,2) = CompressedI24;
CompressedYIQ24(:,:,3) = CompressedQ24;
CompressedR24 = CompressedY24 + 0.9563*CompressedI24 + 0.6210*CompressedQ24;
CompressedG24 = CompressedY24 - 0.2721*CompressedI24 - 0.6474*CompressedQ24;
CompressedB24 = CompressedY24 - 1.1070*CompressedI24 + 1.7046*CompressedQ24;
CompressedRGB24(:,:,1) = CompressedR24;
CompressedRGB24(:,:,2) = CompressedG24;
CompressedRGB24(:,:,3) = CompressedB24;
CompressedI24 = (CompressedI24 + 0.5957)./(2*0.5957);
CompressedQ24 = (CompressedQ24 + 0.5226)./(2*0.5226);
clear temp
temp = find(CompressedRGB24 < 0);
CompressedRGB24(temp) = 0;
temp = find(CompressedRGB24>1);
CompressedRGB24(temp)=1;
clear temp;
N = 52;
CompressedY52 = UY(:,1:N)*SY(1:N,1:N)*VY(:,1:N)';%Transprot
CompressedI52 = UI(:,1:N)*SI(1:N,1:N)*VI(:,1:N)';%Transprot
CompressedQ52 = UQ(:,1:N)*SQ(1:N,1:N)*VQ(:,1:N)';%Transprot
CompressedYIQ52(:,:,1) = CompressedY52;
CompressedYIQ52(:,:,2) = CompressedI52;
CompressedYIQ52(:,:,3) = CompressedQ52;
CompressedR52 = CompressedY52 + 0.9563*CompressedI52 + 0.6210*CompressedQ52;
CompressedG52 = CompressedY52 - 0.2721*CompressedI52 - 0.6474*CompressedQ52;
CompressedB52 = CompressedY52 - 1.1070*CompressedI52 + 1.7046*CompressedQ52;
CompressedRGB52(:,:,1) = CompressedR52;
CompressedRGB52(:,:,2) = CompressedG52;
CompressedRGB52(:,:,3) = CompressedB52;
CompressedI52 = (CompressedI52 + 0.5957)./(2*0.5957);
CompressedQ52 = (CompressedQ52 + 0.5226)./(2*0.5226);
clear temp
temp = find(CompressedRGB52 < 0);
CompressedRGB52(temp) = 0;
temp = find(CompressedRGB52>1);
CompressedRGB52(temp)=1;
clear temp;
I = (I + 0.5957)./(2*0.5957);
Q = (Q + 0.5226)./(2*0.5226);
%colormap(gray(256))
figure(1)
subplot(3,3,1);
imshow(Y),title('Original Y');
subplot(3,3,2);
imshow(I),title('Original I');
subplot(3,3,3);
imshow(Q),title('Original Q');
subplot(3,3,4);
imshow(CompressedY24),title('Compressed Y by 24');
subplot(3,3,5);
imshow(CompressedI24),title('Compressed I by 24');
subplot(3,3,6);
imshow(CompressedQ24),title('Compressed Q by 24');
subplot(3,3,7);
imshow(RGBOriginal),title('Original RGB');
subplot(3,3,8);
imshow(CompressedRGB24),title('Compressed RGB by 24');
figure(2)
subplot(3,3,1);
imshow(Y),title('Original Y');
subplot(3,3,2);
imshow(I),title('Original I');
subplot(3,3,3);
imshow(Q),title('Original Q');
subplot(3,3,4);
imshow(CompressedY52),title('Compressed Y by 52');
subplot(3,3,5);
imshow(CompressedI52),title('Compressed I by 52');
subplot(3,3,6);
imshow(CompressedQ52),title('Compressed Q by 52');
subplot(3,3,7);
imshow(RGBOriginal),title('Original RGB');
subplot(3,3,8);
imshow(CompressedRGB52),title('Compressed RGB by 52');

