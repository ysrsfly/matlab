clc;clear;close all;

%%%%��50*50�ľ���ֵ�����ɰ���������

%����0������
% m0 = zeros(50,50);
% m0(10:12 , 17:33) = 1;
% m0(10:40 , 17:19) = 1;
% m0(10:40 , 33:35) = 1;
% m0(40:42 , 17:35) = 1;
% subplot(2,5,1);imshow(m0);
% imwrite( m0, 'D:\�ļ�\matlab\Fourier_Descriptor\m0.tif');
% 
% 
% %����1������
% m1 = zeros(50,50);
% m1(10:40 , 24:26) = 1;
% subplot(2,5,2);imshow(m1);
% imwrite( m1, 'D:\�ļ�\matlab\Fourier_Descriptor\m1.tif');
% 
% %����2������
% m2 = zeros(50,50);
% m2(10:12 , 17:33) = 1;
% m2(10:26 , 33:35) = 1;
% m2(24:26 , 17:33) = 1;
% m2(25:40 , 17:19) = 1;
% m2(40:42 , 17:35) = 1;
% subplot(2,5,3);imshow(m2);
% imwrite( m2, 'D:\�ļ�\matlab\Fourier_Descriptor\m2.tif');
% 
% 
% %����3������
% m3 = zeros(50,50);
% m3(10:12 , 17:33) = 1;
% m3(10:25 , 33:35) = 1;
% m3(24:26 , 17:35) = 1;
% m3(25:40 , 33:35) = 1;
% m3(40:42 , 17:35) = 1;
% subplot(2,5,4);imshow(m3);
% imwrite( m3, 'D:\�ļ�\matlab\Fourier_Descriptor\m3.tif');
% 
% %����4������
% m4 = zeros(50,50);
% m4(10:25 , 17:19) = 1;
% m4(10:25 , 33:35) = 1;
% m4(24:26 , 17:35) = 1;
% m4(25:40 , 33:35) = 1;
% subplot(2,5,5);imshow(m4);
% imwrite( m4, 'D:\�ļ�\matlab\Fourier_Descriptor\m4.tif');
% 
% %����5������
% m5 = zeros(50,50);
% m5(10:12 , 17:35) = 1;
% m5(10:25 , 17:19) = 1;
% m5(24:26 , 17:35) = 1;
% m5(25:40 , 33:35) = 1;
% m5(40:42 , 17:35) = 1;
% subplot(2,5,6);imshow(m5);
% imwrite( m5, 'D:\�ļ�\matlab\Fourier_Descriptor\m5.tif');
% 
% %����6������
% m6 = zeros(50,50);
% m6(10:12 , 17:35) = 1;
% m6(10:25 , 17:19) = 1;
% m6(24:26 , 17:35) = 1;
% m6(25:40 , 17:19) = 1;
% m6(25:40 , 33:35) = 1;
% m6(40:42 , 17:35) = 1;
% subplot(2,5,7);imshow(m6);
% imwrite( m6, 'D:\�ļ�\matlab\Fourier_Descriptor\m6.tif');
% 
% %����7������
% m7 = zeros(50,50);
% m7(10:12 , 17:35) = 1;
% m7(10:42 , 33:35) = 1;
% subplot(2,5,8);imshow(m7);
% imwrite( m7, 'D:\�ļ�\matlab\Fourier_Descriptor\m7.tif');
% 
% %����8������
% m8 = zeros(50,50);
% m8(10:12 , 17:35) = 1;
% m8(10:25 , 17:19) = 1;
% m8(10:25 , 33:35) = 1;
% m8(24:26 , 17:35) = 1;
% m8(25:40 , 17:19) = 1;
% m8(25:40 , 33:35) = 1;
% m8(40:42 , 17:35) = 1;
% subplot(2,5,9);imshow(m8);
% imwrite( m8, 'D:\�ļ�\matlab\Fourier_Descriptor\m8.tif');
% 
% %����9������
% m9 = zeros(50,50);
% m9(10:12 , 17:35) = 1;
% m9(10:25 , 17:19) = 1;
% m9(10:25 , 33:35) = 1;
% m9(24:26 , 17:33) = 1;
% m9(25:40 , 33:35) = 1;
% m9(40:42 , 17:35) = 1;
% subplot(2,5,10);imshow(m9);
% imwrite( m9, 'D:\�ļ�\matlab\Fourier_Descriptor\m9.tif');

%����ÿ�����ֵĸ���Ҷ������
zstore =cell(10,1);
for i=0:9
    I = imread(strcat('std_',int2str(i),'.tif'));
    I = rgb2gray(I);
    level = graythresh(I);
    I0 = imbinarize(I,level);
%    IE=edge(I0,'Canny',0.2);%������б�Ե���
%     figure(2);imshow(IE);
%     [R,D]= find(IE);%�ҵ��߽�������
%     temp = [R,D];
    edge = bwboundaries(I0);
    temp = edge{1,1};
    temp= sampling(temp,100);
    figure(2);
    subplot(2,5,i+1);imshow(bound2im(temp));
   % z = frdescp(temp,100);%����Ҷ�����Ӽ���
    %z = resizeFD(z, 60);
    z = normaliseFD3(edge);%��һ������Ҷ������
    zstore{i+1,1} = z;
%       ����Ҷ�����ӻָ�
% %     z546 = ifrdescp(z,200);
% %     z546im = bound2im(z546,50,50);
% %     figure(3);imshow(z546im);    
end

[file,path] = uigetfile('D:\�ļ�\matlab\*.*');
                if isequal(file,0)
                    disp('�û�ѡ��ȡ����');
                else
                    disp(['�û�ѡ���� ', fullfile(path,file)]);
                end

                a=imread(fullfile(path,file));    
 
   if(ndims(a)==3)
        a = rgb2gray(a);
   end
    level = graythresh(a); 
    I0 = imbinarize(a,level);
   
%    IE=edge(I0,'Canny',0.2);%������б�Ե���
    %figure(2);imshow(IE);
%     [R,D]= find(IE);%�ҵ��߽�������
%     figure(5);imshow(IE);
%     temp = [R,D];
    edge = bwboundaries(I0);
    temp = edge{1,1};
    temp= sampling(temp,100);
   % z = frdescp(temp,100);%����Ҷ�����Ӽ���
    %z = resizeFD(z, 60);
    z = normaliseFD3(edge);%��һ������Ҷ������
    %imb = ifrdescp(zstore{1,1},180);
    %figure(6);imshow (bound2im(imb,50,50));
   % chk = 0;
%    figure(3);
%    for i=1:10
%        tmp = ifrdescp(zstore{i,1});
%        subplot(2,5,i);imshow(bound2im(tmp));
%    end
    for i=1:10
        [zs1,~] = size(zstore{i,1});
        [zs,~] = size(z);
        if zs1 > zs
            z1 = [z;zeros(zs1-zs,1)];
            zst = zstore{i,1};
            distance(i) = norm(z1-zst);
            %z = [ z ; zeros(zs1-zs,1)];
            %chk = 1;
        end
        
        if zs1 < zs
            zst = zstore{i,1};
            %distance(i) = norm(z(1:zs1,1)-zst(:,1));
            % zstore{i,1} = [zstore{i,1};zeros(zs-zs1,1)];
            zst = [zst;zeros(zs-zs1,1)];
            distance(i) = norm(z-zst);
        end
        
        if zs1 == zs
            distance(i) = norm(z(1:30)-zstore{i,1}(1:30));
        end
    end
    
    [~,a] = min(distance);
    disp("ʶ���������Ϊ"+(a-1));
    
