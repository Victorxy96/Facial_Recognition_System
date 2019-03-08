function [ pcaA,V ] = fastpca( A,k,mA )
tic
%A:��������
%K:����kά
%pcaA:��ά��ľ���
%V�����ɷַ���
m = size(A,1);
Z=(double(A)-repmat(mA,m,1));
T = Z*Z';
[V,D] =eigs(T,k);
V = Z'*V;
% for i = 1:k
%     l = norm(V(:,i));%����
%     V(:,i)=V(:,i)/l;
% end
DiagD = diag(D);
for i = 1:k
V(:,i) = V(:,i)/sqrt(DiagD(i));
pcaA = Z*V;
toc
disp toc
%Э����������������
%���Ա任������kά
end

