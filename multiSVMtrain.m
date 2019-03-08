function [ multiSVMstruct ] = multiSVMtrain( traindata,nclass,gamma,c )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
%  准备数据
% 两两比较
for i = 1:9
    for j = i+1:10
        X=[traindata(5*(i-1)+1:5*i,:);traindata(5*(j-1)+1:5*j,:)];
        Y=[ones(5,1);zeros(5,1)];
        multiSVMstruct{i}{j} = svmtrain(X,Y,'kernel_function','rbf','rbf_sigma',sqrt(1/2/gamma),'boxconstraint',c);
    end
end

end

