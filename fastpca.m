function [ pcaA,V ] = fastpca( A,k,mA )
tic
%A:样本矩阵
%K:降至k维
%pcaA:降维后的矩阵
%V：主成分分量
m = size(A,1);
Z=(double(A)-repmat(mA,m,1));
T = Z*Z';
[V,D] =eigs(T,k);
V = Z'*V;
% for i = 1:k
%     l = norm(V(:,i));%范数
%     V(:,i)=V(:,i)/l;
% end
DiagD = diag(D);
for i = 1:k
V(:,i) = V(:,i)/sqrt(DiagD(i));
pcaA = Z*V;
toc
disp toc
%协方差矩阵的特征向量
%线性变换，降至k维
end

