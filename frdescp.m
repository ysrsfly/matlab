function z = frdescp(s,k)
s = 1i*s(:, 1) + s(:, 2);%%������д�ɸ�����ʽ
N =length(s);%%�߽����
z =zeros(k,1);%%��ʼ������洢����Ҷ������
for i1 =1:k %%�Ը���Ҷ�����ӽ���DFT����
    for n = 1:N
        z(i1) =z(i1)+s(n)*exp(-1i*2*pi*(i1-1)*(n-1)./N);%%����Ҷ�任
    end
end
