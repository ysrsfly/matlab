clc;clear;close all;
I = imread('zero_0.bmp');
level = graythresh(I);
I0 = imbinarize(I,level);
IE=edge(I0,'Canny',0.2);%对其进行边缘检测
imshow(IE);
[R,D]= find(IE);%找到边界点的坐标
border_complex = R + 1i*D;

ck1=sum(border_complex) ./ length(border_complex);
tk = border_complex - ck1;
angletk1=angle(tk);
[att1,ati1]= sort(angletk1);
for i =1:length(ati1)
    st1(i) = border_complex(ati1(i));
end
fdesc1 = fft(st1);

nfdesc1 = fdesc1;
nfdesc1(1) =0 ;
si1 = abs(fdesc1(2));
nfdesc1 = nfdesc1 ./ si1;
nfdesc1 = abs(nfdesc1);
fd1a = nfdesc1;


% border_fft = fft(border_complex);
% 
% temp = ifft(border_fft,100);
% %%temp=reshape(temp,40,32);
% rec=zeros(40,32);
% 
% imshow(temp);



