function [ class ] = multiSVM( testdata,multiSVMstruct,nclass )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �Բ������ݽ��з���
m = size(testdata,1);
voting = zeros(m,nclass);
for i = 1:nclass-1
    for j=i+1:nclass %�����Ƚ�
        class = svmclassify(multiSVMstruct{i}{j},testdata);
       % class%class�Ƚ�i/j,����1/0,�о���
         voting(:,i) = voting(:,i)+(class==1);
       %����1�ӵ�i��
         voting(:,j) = voting(:,j)+(class==0);
        %����0�ӵ�j��
    end
end
 [~,class] = max(voting,[],2);
end

