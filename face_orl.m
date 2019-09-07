clc;clear ;close all;
all_faces=[];
for i=1:40    
    for j=1:8        
        a=imread(strcat('C:\Users\25227\Desktop\ͼ��\att_faces\s',num2str(i),'\',num2str(j),'.pgm'));
        b=a(1:112*92); % �������ͼ���������һ��        
        b=double(b);        
        all_faces=[all_faces; b];  % all_faces��ÿһ�����ݴ���һ����������320��   
    end
end 
        ave_face=mean(all_faces); % ƽ���� 
        figure(1)
        imshow_file = mat2gray(reshape(ave_face,112,92));%����ת��Ϊ�Ҷ�ͼ��
        imshow(imshow_file);%�õ�ƽ����
        title('ƽ����');

for i=1:320 %%ÿ������ȡǰ8�ţ�һ��8*40=320������
    diff_face(i,:)=all_faces(i,:)-ave_face; % mean_faceÿһ���ǡ�ÿ������-ƽ������ �õ���ֵ���ݾ���
end

        C=diff_face*diff_face';     %����Э�������C
        [v,d]=eig(C);               %����������V��[V,D] = eig(A) ��������ֵ�ĶԽǾ��� D �;��� V�������Ƕ�Ӧ��������������ʹ�� A*V = V*D
        d1=diag(d);                 %��ȡ�ԽǾ���d������ֵ��D = diag(v) ���ذ������Խ��������� v ��Ԫ�صĶԽǾ���
        [~,index]=sort(d1);         %��������������ֵ 
        column=size(v,2);           % �����������������

        %�������������н�������
        for i=1:column      
            vsort(:,i) = v(:,index(column-i+1)); % vsort ������ǰ��������е���������,ÿһ�й���һ����������      
            dsort(i)   = d1(index(column-i+1));  % dsort ������ǰ��������е�����ֵ 
        end  

        %�Ա����ۼ��������ֵռ90%������ֵ
        dsum = sum(dsort);     
        dsum_extract = 0;   
        p = 0;     
        while( dsum_extract/dsum < 0.9)       
            p = p + 1;          
            dsum_extract = sum(dsort(1:p));     
        end
        
        i=1;  % �����������γɵ�����ϵ
        while (i<=p )      
              base(:,i) = diff_face' * vsort(:,i);   %��������� ��������ͶӰ���µ�ά����
              i = i + 1; 
        end   
        

        figure(2)
        for i=1:16
        subplot(4,4,i)
        imshow(mat2gray(reshape(base(:,i),112,92)));
        end
        suptitle('ǰ16����������');

        all_projection = all_faces * base;    % ��ѵ�������Եõ���������ϵ�Ͻ���ͶӰ

                [file,path] = uigetfile('*.pgm');
                if isequal(file,0)
                    disp('�û�ѡ��ȡ����');
                else
                    disp(['�û�ѡ���� ', fullfile(path,file)]);
                end

                a=imread(fullfile(path,file));        
                figure(4)
                imshow(a);
                title("ѡ���ͼ��Ϊ");
                
                b=a(1:10304);        
                b=double(b);        
                test_projection= b * base; %����ͶӰ     

                for k=1:320                 
                    mdist(k)=norm(test_projection-all_projection(k,:));   %����������ѵ��ͼ��ľ���     
                end

                %���׽��ڷ��б�
                [~,index_3]=sort(mdist);            %�ҵ�������С������       
                class1=floor((index_3(1)-1)/8)+1;  %ȷ��ÿ��������ڵ���   
                class2=floor((index_3(2)-1)/8)+1;        
                class3=floor((index_3(3)-1)/8)+1;        

                %�ж�
                if class1~=class2 && class2~=class3 
                    ID=class1;         
                elseif class1==class2          
                    ID=class1;         
                elseif class2==class3     
                    ID=class2;         
                end
        
        figure(3)
        im_show = imread(strcat('C:\Users\25227\Desktop\ͼ��\att_faces\s',num2str(ID),'\','1.pgm'));
        imshow(im_show);
        title("ƥ�������Ϊ");
                
        fprintf('PCA�������Ϊ�û�ѡ����ǵ�%d�������ͼ��\n',ID);
        fprintf('*********��ʼ�ò������ݼ���ʶ��׼ȷ��*********\n');
        fprintf('****ÿ��ͼ���ǰ8������ѵ�������������ڲ���****\n');
            
        %ѵ�����ݵ�׼ȷ�ȼ���
           accu = 0; 
           for i=1:40 
              for j =9:10
                   a=imread(strcat('C:\Users\25227\Desktop\ͼ��\att_faces\s',num2str(i),'\',num2str(j),'.pgm'));                         
                b=a(1:10304);        
                b=double(b);        
                test_projection= b * base; %�������꣬��1��p�׾���      
                for k=1:320                 
                    mdist(k)=norm(test_projection-all_projection(k,:));   %����������ѵ��ͼ��ľ���     
                end
                 %���׽��ڷ��б�
                [~,index_3]=sort(mdist);            %�ҵ�������С������       
                class1=floor((index_3(1)-1)/8)+1;  %ȷ��ÿ��������ڵ���   
                class2=floor((index_3(2)-1)/8)+1;        
                class3=floor((index_3(3)-1)/8)+1;        
                %�ж�
                if class1~=class2 && class2~=class3 
                    ID=class1;         
                elseif class1==class2          
                    ID=class1;         
                elseif class2==class3     
                    ID=class2;         
                end

                if ID==i
                    accu=accu+1;     %����׼ȷ��   
                end  
             end
           end  
           fprintf('ͼ���ʶ��׼ȷ��Ϊ%3.2f\n',accu/80);