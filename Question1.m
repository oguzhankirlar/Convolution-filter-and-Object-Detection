A = double(imread('jokerimage.png')); %read image as a matrices
A = A/255;
figure, imshow(A); %show initial image
%ZERO-PADDED INPUT MATRIX %create 3 matrices and filled with 0's then push
%the A matrices one by one
Matrix1=zeros(514); 
Matrix1(2:513,2:513)=A(1:512,1:512,1);
Matrix2=zeros(514);
Matrix2(2:513,2:513)=A(1:512,1:512,2);
Matrix3=zeros(514);
Matrix3(2:513,2:513)=A(1:512,1:512,3);
%OPERATION MATRIX %this is values of the kernel matrices
sharpen = [0 -1 0;-1 5 -1;0 -1 0];
edge = [-1 -1 -1; -1 8 -1; -1 -1 -1];
blur = [1 1 1;1 1 1;1 1 1];
embos = [-2 -1 0; -1 1 1; 0 1 2];
%BLUR PICTURE
%create 3 2 dimensional matrices filled with 0's
blur_matrix1=zeros(512); 
blur_matrix2=zeros(512);
blur_matrix3=zeros(512);
%make calculations for all matrices and push the blur matrices
for i = 1:512 
    for j = 1:512
         blur_matrix1(i,j)=(Matrix1(i,j)+Matrix1(i,j+1)+Matrix1(i,j+2)+Matrix1(i+1,j)+Matrix1(i+1,j+1)+Matrix1(i+1,j+2)+Matrix1(i+2,j)+Matrix1(i+2,j+1)+Matrix1(i+2,j+2))/9;
   end
end
for i = 1:512 
    for j = 1:512
         blur_matrix2(i,j)=(Matrix2(i,j)+Matrix2(i,j+1)+Matrix2(i,j+2)+Matrix2(i+1,j)+Matrix2(i+1,j+1)+Matrix2(i+1,j+2)+Matrix2(i+2,j)+Matrix2(i+2,j+1)+Matrix2(i+2,j+2))/9;
   end
end
for i = 1:512 
    for j = 1:512
         blur_matrix3(i,j)=(Matrix3(i,j)+Matrix3(i,j+1)+Matrix3(i,j+2)+Matrix3(i+1,j)+Matrix3(i+1,j+1)+Matrix3(i+1,j+2)+Matrix3(i+2,j)+Matrix3(i+2,j+1)+Matrix3(i+2,j+2))/9;
   end
end
%combine blur matrices and show blurred image
blur_image=[512,512,3];
blur_image(1:512,1:512,1)=blur_matrix1;
blur_image(1:512,1:512,2)=blur_matrix2;
blur_image(1:512,1:512,3)=blur_matrix3;
figure,imshow(blur_image);
%SHARPEN PICTURE
%create 3 2 dimensional matrices filled with 0's
sharpen_matrix1=zeros(512);
sharpen_matrix2=zeros(512);
sharpen_matrix3=zeros(512);
%make calculations for all matrices and push the sharpening matrices
for i = 1:512 
    for j = 1:512
         sharpen_matrix1(i,j)=5*Matrix1(i+1,j+1)-Matrix1(i,j+1)-Matrix1(i+1,j)-Matrix1(i+1,j+2)-Matrix1(i+2,j+1);
   end
end
for i = 1:512 
    for j = 1:512
         sharpen_matrix2(i,j)=5*Matrix2(i+1,j+1)-Matrix2(i,j+1)-Matrix2(i+1,j)-Matrix2(i+1,j+2)-Matrix2(i+2,j+1);
   end
end
for i = 1:512 
    for j = 1:512
         sharpen_matrix3(i,j)=5*Matrix3(i+1,j+1)-Matrix3(i,j+1)-Matrix3(i+1,j)-Matrix3(i+1,j+2)-Matrix3(i+2,j+1);
   end
end
%combine sharpened matrices and show sharpening image
sharpen_image=[512,512,3];
sharpen_image(1:512,1:512,1)=sharpen_matrix1;
sharpen_image(1:512,1:512,2)=sharpen_matrix2;
sharpen_image(1:512,1:512,3)=sharpen_matrix3;
figure,imshow(sharpen_image);
%EDGE PICTURE
%create 3 2 dimensional matrices filled with 0's
edge_matrix1=zeros(512);
edge_matrix2=zeros(512);
edge_matrix3=zeros(512);
%make calculations for all matrices and push the edge matrices
for i = 1:512 
    for j = 1:512
         edge_matrix1(i,j)=8*Matrix1(i+1,j+1)-Matrix1(i,j)-Matrix1(i,j+1)-Matrix1(i,j+2)-Matrix1(i+1,j)-Matrix1(i+1,j+2)-Matrix1(i+2,j)-Matrix1(i+2,j+1)-Matrix1(i+2,j+2);
   end
end
for i = 1:512 
    for j = 1:512
         edge_matrix2(i,j)=8*Matrix2(i+1,j+1)-Matrix2(i,j)-Matrix2(i,j+1)-Matrix2(i,j+2)-Matrix2(i+1,j)-Matrix2(i+1,j+2)-Matrix2(i+2,j)-Matrix2(i+2,j+1)-Matrix2(i+2,j+2);
   end
end
for i = 1:512 
    for j = 1:512
         edge_matrix3(i,j)=8*Matrix3(i+1,j+1)-Matrix3(i,j)-Matrix3(i,j+1)-Matrix3(i,j+2)-Matrix3(i+1,j)-Matrix3(i+1,j+2)-Matrix3(i+2,j)-Matrix3(i+2,j+1)-Matrix3(i+2,j+2);
   end
end
%combine edge matrices and show edge image
edge_image=[512,512,3];
edge_image(1:512,1:512,1)=edge_matrix1;
edge_image(1:512,1:512,2)=edge_matrix2;
edge_image(1:512,1:512,3)=edge_matrix3;
figure,imshow(edge_image);
%EMBOSS PICTURE
%create 3 2 dimensional matrices filled with 0's
emboss_matrix1=zeros(512);
emboss_matrix2=zeros(512);
emboss_matrix3=zeros(512);
%make calculations for all matrices and push the emboss matrices
for i = 1:512 
    for j = 1:512
         emboss_matrix1(i,j)=-2*Matrix1(i,j)-Matrix1(i,j+1)-Matrix1(i+1,j)+Matrix1(i+1,j+1)+Matrix1(i+1,j+2)+Matrix1(i+2,j+1)+2*Matrix1(i+2,j+2);
   end
end
for i = 1:512 
    for j = 1:512
         emboss_matrix2(i,j)=-2*Matrix2(i,j)-Matrix2(i,j+1)-Matrix2(i+1,j)+Matrix2(i+1,j+1)+Matrix2(i+1,j+2)+Matrix2(i+2,j+1)+2*Matrix2(i+2,j+2);
   end
end
for i = 1:512 
    for j = 1:512
         emboss_matrix3(i,j)=-2*Matrix3(i,j)-Matrix3(i,j+1)-Matrix3(i+1,j)+Matrix3(i+1,j+1)+Matrix3(i+1,j+2)+Matrix3(i+2,j+1)+2*Matrix3(i+2,j+2);
   end
end
%combine emboss matrices and show emboss image
emboss_image=[512,512,3];
emboss_image(1:512,1:512,1)=emboss_matrix1;
emboss_image(1:512,1:512,2)=emboss_matrix2;
emboss_image(1:512,1:512,3)=emboss_matrix3;
figure,imshow(emboss_image);

