function [ f_matrix,rclass ] = ReadFace( npersons,bool )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
rclass=zeros(npersons*5,1);  
f_matrix=zeros(npersons*5,112*92);  
for i=1:npersons  
    facepath='D:\day2\orl_faces\s';  
    facepath=strcat(facepath,num2str(i));  
    facepath=strcat(facepath,'\');  
    cachepath=facepath;  
    for j=1:5  
        facepath=cachepath;  
        if bool==0 %读入训练样本图像的数据  
            facepath=strcat(facepath,num2str(j));  
            rclass((i-1)*5+j)=i;
        else %读入测试样本数据  
            facepath=strcat(facepath,num2str(5+j));  
            rclass((i-1)*5+j)=i;  
        end  
        facepath=strcat(facepath,'.pgm');  
        img=imread(facepath);  
        f_matrix((i-1)*5+j,:)=reshape(img,1,112*92);  
    end  
end  

end

