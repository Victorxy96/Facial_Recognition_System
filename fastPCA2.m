function[pcaA,v]=fastPCA2(A,k,mA)
%快速PCA，主成分分析
%k-将至K维
m=size(A,1);

Z=(A-repmat(mA,m,1)); %变方阵
T=Z*Z';
[v,d]=eigs(T,k);%计算T的最大的K个特征值和特征向量
v=Z'*v;
for i=1:k
    I=norm(v(:,i));
    v(:,i)=v(:,i)/I;

pcaA=Z*v;
end