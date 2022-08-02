clc;
I = imread('_MG_9799.jpg');
Img = rgb2gray(I);
NImg = imnoise(Img,'salt & pepper',0.6);
subplot(2,2,1);
imshow(Img);
subplot(2,2,2);
imshow(NImg);

[row,col] = size(NImg);
OImg = zeros(row,col);

NImgP = zeros(row+2,col+2);
NImgP(2:row+1,2:col+1) = NImg;

for i=2:row+1
    for j=2:col+1 %this keeps track of the last middle element
        wn= NImgP(i-1:i+1, j-1:j+1);
        nfp=wn((wn~=0)&(wn~=255)); % &-Logical AND
        if(length(nfp)==0)
            OImg(i-1,j-1) = mean(mean(wn));
        else
            OImg(i-1,j-1) = median(nfp);
        end
    end
end

FImg= uint8(OImg);
subplot(2,2,3);
imshow(FImg);



