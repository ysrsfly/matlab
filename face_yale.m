clc;clear ;close all;
all_faces=[];   
    for i=0:14        
        for j = 0:4
        a=imread(strcat('D:\文件\matlab\EigenFace\yale_faces\s\',num2str(i),'\',num2str(j),'.bmp'));
        b=a(1:100*100); % 将矩阵拉成一行        
        b=double(b);        
        all_faces=[all_faces; b];  % all_faces中每一行数据代表一张人脸，共75行   
        end
    end
        ave_face=mean(all_faces); % 平均脸 
        figure
        imshow_file = mat2gray(reshape(ave_face,100,100));%矩阵转换为灰度图像
        imshow(imshow_file);%得到平均脸
        title('平均脸');

for i=1:75 
    diff_face(i,:)=all_faces(i,:)-ave_face; % mean_face每一行是“每个人脸-平均脸” 得到差值数据矩阵
end

        C=diff_face*diff_face';     %计算协方差矩阵C
        [v,d]=eig(C);               %求特征向量V
        d1=diag(d);                 %提取对角矩阵d的特征值
        [~,index]=sort(d1);         %以升序排序特征值 
        column=size(v,2);           % 特征向量矩阵的列数

        %对特征向量进行降序排列
        for i=1:column      
            vsort(:,i) = v(:,index(column-i+1)); % vsort 保存的是按降序排列的特征向量,每一列构成一个特征向量      
            dsort(i)   = d1(index(column-i+1));  % dsort 保存的是按降序排列的特征值 
        end  

        %以保留累计相加特征值占90%的特征值
        dsum = sum(dsort);     
        dsum_extract = 0;   
        p = 0;     
        while( dsum_extract/dsum < 0.9)       
            p = p + 1;          
            dsum_extract = sum(dsort(1:p));     
        end

        i=1;  % 计算特征脸形成的坐标系
        while (i<=p)      
              base(:,i) = diff_face' * vsort(:,i);   %求出特征脸
              i = i + 1; 
        end   

        figure(2)
        for i=1:16
        subplot(4,4,i)
        imshow(mat2gray(reshape(base(:,i),100,100)));
        end
        suptitle('前16个的特征脸');

        all_projection = all_faces * base;    % 将训练样本对坐标系上进行投影

                [file,path] = uigetfile('*.bmp');
                if isequal(file,0)
                    disp('用户选择取消！');
                else
                    disp(['用户选择了 ', fullfile(path,file)]);
                end

                a=imread(fullfile(path,file));        
                figure(4)
                imshow(a);
                title("选择的图像为");
                
                b=a(1:10000);        
                b=double(b);        
                test_projection= b * base; %计算训练集的投影     

                for k=1:75                 
                    mdist(k)=norm(test_projection-all_projection(k,:));   %计算与所有训练图像的距离     
                end

                %三阶近邻法判别
                [~,index_3]=sort(mdist);            %找到距离最小的三个       
                class1=floor((index_3(1)-1)/5)+1;  %确定每个序号所在的组   
                class2=floor((index_3(2)-1)/5)+1;        
                class3=floor((index_3(3)-1)/5)+1;        

                %判断
                if class1~=class2 && class2~=class3 
                    ID=class1;         
                elseif class1==class2          
                    ID=class1;         
                elseif class2==class3     
                    ID=class2;         
                end
        
        fprintf('*****yale数据库为每人11张图，共15人，总共165张图像*****\n');
        fprintf('*****PCA分析结果为用户选择的是第%d个人的人脸图像*****\n',ID);
        fprintf('*********开始用测试数据计算识别准确度*********\n');
        fprintf('******图像前5张用于训练，全部数据进行测试******\n');
        
        figure(3)
        im_show = imread(strcat('D:\文件\matlab\EigenFace\yale_faces\s\',num2str(ID-1),'\','0.bmp'));
        imshow(im_show);
        title("匹配的人像为");
        %训练数据的准确度计算
        
           accu = 0; 
            
              for j =1:1:165
                a=imread(strcat('C:\Users\25227\Desktop\图像\yale\yale_faces\s',num2str(j),'.bmp'));                         
                b=a(1:10000);        
                b=double(b);        
                test_projection= b * base; %计算坐标，是1×p阶矩阵      
                for k=1:75                 
                    mdist(k)=norm(test_projection-all_projection(k,:));   %计算与所有训练图像的距离     
                end
                 %三阶近邻法判别
                [~,index_3]=sort(mdist);            %找到距离最小的三个       
                class1=floor((index_3(1)-1)/5)+1;  %确定每个序号所在的组   
                class2=floor((index_3(2)-1)/5)+1;        
                class3=floor((index_3(3)-1)/5)+1;        
                %判断
                if class1~=class2 && class2~=class3 
                    ID=class1;         
                elseif class1==class2          
                    ID=class1;         
                elseif class2==class3     
                    ID=class2;         
                end
                
                i=floor((j-1)/11+1);
                if ID==i
                    accu=accu+1;     %计算准确度   
                end  
             end
           fprintf('图像的识别准确度为%3.2f\n',accu/165);