clc;clear;close all;
%I = imread('D:\�ļ�\matlab\Fourier_Descriptor\std_1.tif');
%I0 = imread('D:\�ļ�\matlab\Fourier_Descriptor\std_0.tif');
% I 
% a=insertText(I,[0 0],'4','FontSize',80,'BoxColor','black','TextColor','white');
% I1 = rot90(I);
% I1 = rot90(I1);
% I1 = imrotate(I,45);
% I1 = imresize(I1,100/142);
%imwrite(I1,'D:\�ļ�\matlab\Fourier_Descriptor\std_1_rot_180.tif');
% I = rgb2gray(I);
% I1 = imresize(I, 2);
% %I1 = imcrop(I1,[50,45,99,99]);
% %imshow(I1);
% imwrite(I1,'D:\�ļ�\matlab\Fourier_Descriptor\std_resize_mov_4.tif');
% subplot(211);imshow(I1);
% subplot(212);imshow(I);
% I = imread('D:\�ļ�\matlab\Fourier_Descriptor\std_9.tif');
% I = rgb2gray(I);
% imshow(I);
% I = double(I);
% [rows,cols] = size(I); 
% x = ones(rows,1)*[1:cols];
% y = [1:rows]'*ones(1,cols);   
% area = sum(sum(I)); 
% meanx = sum(sum(I.*x))/area; 
% meany = sum(sum(I.*y))/area;
% hold on;
% plot(meanx,meany,'r+'); %ʮ�ֱ������λ��
% 
% edge = bwboundaries(m);
% i = 0;
% for j=1:165
% a = imread(strcat('C:\Users\25227\Desktop\ͼ��\yale\yale_faces\s',num2str(j),'.bmp'));
% i = (j-1)/11 ;
% if mod (j-1,11) == 0
% mkdir('D:\�ļ�\matlab\EigenFace\yale_faces\s',num2str(i));
% k = 0;
% end
% imwrite(a,strcat('D:\�ļ�\matlab\EigenFace\yale_faces\s\',num2str(floor(i)),'\',num2str(k),'.bmp'));
% k = k+1;
% end
% I = zeros(100,100);
% imshow(insertText(I,[15 0],'a','FontSize',60,'BoxColor','black','TextColor','white'));
%����histeq��������ֱ��ͼ���⻯����
% I=imread('C:\Users\25227\Pictures\1-151005230535.jpg');
% J=histeq(I);  %ֱ��ͼ���⻯
% figure,
% subplot(121),imshow(uint8(I));
% title('ԭͼ')
% subplot(122),imshow(uint8(J));
% title('���⻯��')
% figure,
% subplot(121),imhist(I,64);
% title('ԭͼ��ֱ��ͼ');
% subplot(122),imhist(J,64);
% title('���⻯���ֱ��ͼ');
% 
% 
% %Ԥ����
% 
% I =imread('C:\Users\25227\Pictures\1-151005230535.jpg');  %��ͼ
% 
% GI=rgb2gray(I); %��ɫͼת�Ҷ�ͼGrey_Image
% 
% %չʾԭͼ
% 
% figure('NumberTitle', 'on', 'Name', 'ԭͼ��');
% 
% imshow(I),title('����ͼƬ');
% 
% %չʾԭ�Ҷ�ͼ��ֱ��ͼ
% 
% figure('NumberTitle', 'on', 'Name', 'ԭ�Ҷ�ͼ��');
% 
% subplot(2,1,1);imshow(GI),title('�Ҷ�ͼ��');
% 
% subplot(2,1,2);imhist(GI),title('ֱ��ͼ');
% 
% %ͼ����⻯�������
% 
% [M,N]=size(GI);
% 
% GI1=reshape(GI,M*N,1);
% 
% GI1_sort=sortrows(GI1);%���Ҷ�ֵ���򷽱�ͳ��
% 
% [a, b, c] = unique(GI1_sort);%aΪ��ͬ�ֻҶ�ֵ���飬bΪ��ͬ�Ҷ�ֵ��һ�γ��ֵ�������
% 
% %ͳ��ÿ���Ҷ�ֵ�ĸ���,�������
% 
% for i=1:size(a)-1
% 
%   num(i)=b(i+1)-b(i);
% 
%   p(i)=num(i)/(M*N);
% 
% end
% 
% num(i+1)=M*N-b(i+1)+1;
% 
% p(i+1)=num(i+1)/(M*N);
% 
% %��������ӳ���ϵ
% 
% sum=0;
% 
% for i=1:size(a)
% 
%   sum=sum+p(i);
% 
%   s(i)=sum;
% 
%   ss(i)=floor((double(max(GI1)-min(GI1))*s(i))+0.5); 
%   
%   %�еľ��⻯�����в��Ǹ�ͼ�����Ҷ�ֵ��ȥ��С�Ҷ�ֵ������(2^n-1)-0
% 
% end
% 
% %��ԭͼ����ӳ��
% 
% for i=1:M*N
% 
%  GI_new1(i)=ss(find(a==GI1(i))) ;
% 
% end
% 
% GI_new=uint8(reshape(GI_new1,M,N));
% 
% %չʾ���⻯���ͼ���ֱ��ͼ
% 
% figure('NumberTitle', 'on', 'Name', '���⻯������')
% 
% subplot(2,1,1);imshow(GI_new),title('�Ҷ�ͼ��');
% 
% subplot(2,1,2);imhist(GI_new),title('ֱ��ͼ');
% 
% %Ԥ��涨�������ܶ�ֵ
% 
% %����1-255��������0-254��û�м����256����Ϊ������һ�����ʺ��ܸ��ʳ���1��
% 
% for i=1:128
% 
%    p1(i)=-1/127^2*(i-1)+1/127;
% 
% end
% 
% for i=129:255  
% 
%   p1(i)=1/127^2*(i-2)-1/127;
% 
% end
% 
% %��������ӳ���ϵ
% 
% sum1=0;
% 
% for i=1:255
% 
%   sum1=sum1+p1(i);
% 
%   s1(i)=sum1;
% 
%   ss1(i)=floor((254*s1(i))+0.5);%ͬ�ϣ��еľ��⻯�����в���254-0=254������(2^8-1)-0=255
% 
% end
% 
% %������ͼ��ӳ�䵽�涨��ͼ��
% 
% [a1, b1, c1] = unique(ss1);%a1Ϊ��ͬ�ֻҶ�ֵ���飬b1Ϊ��ͬ�Ҷ�ֵ��һ�γ��ֵ�������
% 
%  for i=1:M*N
% 
%   flag=find(a1==GI_new1(i)); %flag�����жϾ���������Ƿ��ڹ涨��ӳ�����ҵõ�
% 
%   if isempty(flag)
% 
%      GI_regular1(i)=GI_new1(i);
% 
%   else
% 
%      GI_regular1(i)=b1(find(a1==GI_new1(i)))-1;
% 
%   end
% 
%  end
% 
% GI_regular=uint8(reshape(GI_regular1,M,N));
% 
% %չʾ�涨�����ͼ���ֱ��ͼ
% 
% figure('NumberTitle', 'on', 'Name', '�涨��������')
% 
% subplot(2,1,1);imshow(GI_regular),title('�Ҷ�ͼ��');
% 
% subplot(2,1,2);imhist(GI_regular),title('ֱ��ͼ');





% GrayImage = imread('C:\Users\25227\Pictures\1-151005230535.jpg');
% [rows , cols] = size(GrayImage);%�õ�ͼ�������С�����
% ZhiFang = zeros(1 , 256);%��ʼ��һ�����������洢�Ҷ�ͼ����ÿ�����س��ֵ�Ƶ��
% 
% for i = 0:255
%     ZhiFang(1 , i+1) = length(find(GrayImage == i)) / (rows * cols);%�������GrayImage��ֵ��i��ȵ�Ԫ�صĸ���
% end
% 
% figure(3);
% bar(0:255 , ZhiFang*rows*cols , 'grouped');%����bar����ֱ��ͼ
% xlabel('�Ҷ�ֵ');
% ylabel('���ִ���');
% %axis([0 255 0 1]);%axis�����������û�������꼰�������������



clc
clear all
%ѧ��2016217771;
b1=fir1(38,0.771,'low')%���38�׵�ͨ�˲���
b2=fir1(28,0.71,'high')%%���28�׸�ͨ�˲���

[h1,w1]=freqz(b1,1);  
[h2,w2]=freqz(b2,1);
figure;
subplot(211);
plot(w1/pi,20*log10(abs(h1))); 
axis([0,1,-80,10]); 
grid;
xlabel('��һ��Ƶ��/p') ;
ylabel('����/dB') ;

subplot(212);
plot(w2/pi,20*log10(abs(h2))); 
axis([0,1,-80,10]); 
grid;
xlabel('��һ��Ƶ��/p') ;
ylabel('����/dB') ;

b1t = round(b1*10000); %��������
b2t = round(b2*10000);
str1 = '*32768/10000';%ת����С�������ʽ
 
c = fopen('C:\Users\25227\Desktop\DSPʵ������\ʵ����\38_coef.txt','w');%����TXT�ı�
for i=1:size(b1t,2)
    b1t1 = num2str(b1t(i));
    s1 = [b1t1 str1];
    fprintf(c,'.word %s\r\n ',s1);
end
fclose(c);
 
c = fopen('C:\Users\25227\Desktop\DSPʵ������\ʵ����\28_coef.txt','w');%����TXT�ı�
for i=1:size(b2t,2)
    b2t1 = num2str(b2t(i));
    s1 = [b2t1 str1];
    fprintf(c,'.word %s\r\n',s1);
end
fclose(c);
