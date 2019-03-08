path ='D:\day2\orl_faces\s';
npersons=40;
f_martrix = ReadFace(npersons,0);
nfaces = size(f_martrix,1);
meanvalue = mean(f_martrix);
k = 100;
[pcaface,V] = fastpca(f_martrix,k,meanvalue);
gamma = 0.0078;
c = 128;
multisvmstruct = multiSVMtrain( pcaface,npersons,gamma,c );
[testface,realclass] = ReadFace(npersons,1);
m = size(testface,1);
for i=1:m
    testface(i,:) = testface(i,:) - meanvalue;
end
pcatestface = testface *V;
trainclass = multiSVM(pcaface,multisvmstruct,npersons);
testclass = multiSVM(pcatestface ,multisvmstruct,npersons);
testaccuracy = sum(testclass==realclass)/length(testclass); 
display(['正确率：',num2str(testaccuracy)]); 
trainaccuracy = sum(trainclass==realclass)/length(trainclass); 
display(['正确率：',num2str(trainaccuracy)]); 
    









