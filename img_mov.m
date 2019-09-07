clc;clear;close all;
for i1 =0:9
I=rgb2gray(imread(strcat('std_',num2str(i1),'.tif')));%����ͼƬ��ת��Ϊ�Ҷ�ͼ
figure,imshow(I);                   %�������ڣ���ʾ�Ҷ�ͼI
[r,c]=size(I);                      %����Ҷ�ͼ�Ĵ�С��r��ʾ�У�c��ʾ�У���ͨ��size�������Ҷ�ͼI���������ھ����r�У��������ھ����c�У�������֪���Ҷ�ͼ�Ĵ�С��r��c
dst=zeros(r,c);                     %����r��c��0����ƽ�ƽ�����󣩣���ʼ��Ϊ�㣨��ɫ��
dx=10;                              %ƽ�Ƶ�x����ľ��룬��������ֱ����
dy=20;                              %ƽ�Ƶ�y����ľ��룬������ˮƽ����
tras=[1 0 dx;0 1 dy;0 0 1];         %ƽ�Ʊ任����
for i=1:r
    for j=1:c
        temp=[i;j;1];               %�Ҷ�ͼIҪƽ�Ʊ任�ĵ㣬�����þ����ʾ
        temp=tras*temp;             %������ˣ��õ�����һ�еľ���temp����ƽ�ƺ�ľ���
        x=temp(1,1);                %�Ѿ���temp�ĵ�һ�е�һ�е�Ԫ�ظ�x   
        y=temp(2,1);                %�Ѿ���temp�ĵڶ��е�һ�е�Ԫ�ظ�y 
        if(x>=1&&x<=r)&&(y>=1&&y<=c)%�ж����任��õ��ĵ��Ƿ�Խ��
            dst(x,y)=I(i,j);        %�õ�ƽ�ƽ�����󣬵�(x,y)���ɵ�(i,j)ƽ�ƶ����ģ��ж�Ӧ��ϵ 
        end
    end
end
imwrite(uint8(dst),strcat('for_recognition\std_',num2str(i1),'_mov.tif'));          %�������ڣ���ʾƽ�ƺ��ͼ
end