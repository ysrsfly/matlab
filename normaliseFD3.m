function [G]=normalizeFD3(edge)
% I = imread('E:\�μ�\����ͼ����\��������ҵ\cj\std_0.tif');
% I = rgb2gray(I);
% level = graythresh(I); 
% I0 = imbinarize(I,level);
temp = double(edge{1,1});
temp = sampling(temp,50);
I = double(bound2im(temp));
% imshow(I);
% xlabel('����x��');
% ylabel('����y��');
%edge2 = bwboundaries(I);
[R,C] = find(I);
edge2 = [R,C];
temp2 = double(edge2); %�ü���߽������
[rows,cols] = size(I); 
x = ones(rows,1)*[1:cols];
y = [1:rows]'*ones(1,cols);
area = sum(sum(I)); 
meanx = sum(sum(I.*x))/area; 
meany = sum(sum(I.*y))/area;
%��dmax��xita
xi = temp2(:,2);
[rows_x,cols_x] = size(xi);
yi = temp2(:,1);
[rows_y,cols_y] = size(yi);
meanx_mat = repmat(meanx,rows_x,1);
meany_mat = repmat(meany,rows_y,1);
d = sqrt((xi- meanx_mat).*(xi- meanx_mat) + (yi- meany_mat).*(yi- meany_mat));
%dk = abs(dk/
% [dmax, i] = max(d);
% xita = atan((yi(i)-meany)/(xi(i)-meanx));
% yi(i)
% xi(i)
%ת��������x���������غ�
% a = [cos(xita) -sin(xita);
%      sin(xita) cos(xita)];
meant = [meanx;meany];
dk = zeros(1,rows);
for j = 1:rows_x
   temp3 = [xi(j);yi(j)];
   diff = temp3 - meant;
   diff_x = diff(1);
   diff_y = diff(2);
   dk(j) = sqrt(diff_y * diff_y + diff_x * diff_x);
end

dk = fft(d);
dk = abs(dk/dk(1));
%��DFT
G = dk;
% meanx_ro = mean(1);
% meany_ro = mean(2);
     
 
% hold on;
% plot(meanx,meany,'r+'); %ʮ�ֱ������λ��
