function [G]=normaliseFD(F)
    T=F;
    T(1)=0; %%第一个书置0，消除直流分量干扰
    si=T(2);
    T=abs(T) ./ abs(si);%%归一化操作，消除相位影响
    G=T;
end 