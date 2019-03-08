function [ class ] = multiSVM( testdata,multiSVMstruct,nclass )
%UNTITLED3 此处显示有关此函数的摘要
%   对测试数据进行分类
m = size(testdata,1);
voting = zeros(m,nclass);
for i = 1:nclass-1
    for j=i+1:nclass %两两比较
        class = svmclassify(multiSVMstruct{i}{j},testdata);
       % class%class比较i/j,出数1/0,列矩阵
         voting(:,i) = voting(:,i)+(class==1);
       %等于1加到i列
         voting(:,j) = voting(:,j)+(class==0);
        %等于0加到j列
    end
end
 [~,class] = max(voting,[],2);
end

