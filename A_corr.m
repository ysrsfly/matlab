clc;clear;close all;
f=600;
N=600;
n=0:N-1;
t=n/f;
f1=10;
p=2.*pi.*rand;%���������λ
x=cos(2.*pi.*f1.*t+p);
[cor1 lag1] = xcorr(x,'unbiased');
Xk1 = fft(cor1);
Px1 = abs(Xk1);
figure 
subplot(2,2,1);plot(t,x),title('ʱ��ͼ');
ylim([-2,2]);
subplot(2,2,2),plot(lag1/f,cor1),title('����غ���');
subplot(2,2,3),plot(lag1/f,Px1),title('�������ܶ�');
xlim([-3,3]);
set(gca,'XTick',-3:0.5:3);