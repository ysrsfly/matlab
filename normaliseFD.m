function [G]=normaliseFD(F)
    T=F;
    T(1)=0; %%��һ������0������ֱ����������
    si=T(2);
    T=abs(T) ./ abs(si);%%��һ��������������λӰ��
    G=T;
end 