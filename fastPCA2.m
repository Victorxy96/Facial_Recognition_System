function[pcaA,v]=fastPCA2(A,k,mA)
%����PCA�����ɷַ���
%k-����Kά
m=size(A,1);

Z=(A-repmat(mA,m,1)); %�䷽��
T=Z*Z';
[v,d]=eigs(T,k);%����T������K������ֵ����������
v=Z'*v;
for i=1:k
    I=norm(v(:,i));
    v(:,i)=v(:,i)/I;

pcaA=Z*v;
end