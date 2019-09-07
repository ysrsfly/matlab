function temp = sampling( t,num )
len=size(t,1);
step=ceil(len/num);
%j = 1;
for i=1:step:len
    j=1+(i-1)/step;
    temp(j,:)=t(i,:);
    %j= j+1;
end


end
%function temp = sampling( t,num )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
% L=size(t,1);
% spa=L/num;
% j=0;
% k=1;
% temp=zeros(num,2);
% for i=1:spa:L
%     j=ceil(i);
%     temp(k,:)=t(j,:);
%     k=k+1;
% end


