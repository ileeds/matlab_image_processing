function spatfilt(filename, type, A)
orig=imread(filename);
filtered=imread(filename);
%salt & pepper noise on original image to show eefects of median filtering
if strcmp(type,'median')==1
    orig=imnoise(orig,'salt & pepper');
end
imshow(orig)
title('Original Image')
figure
[r,c]=size(orig);
%traverse image, within boundaries so that part of mask never outside of
%image
for x=4:r-3
    for y=4:c-3
        if strcmp(type,'median')==1
            %3 by 3 mask
            mask=orig(x-1:x+1,y-1:y+1);
            %median value of pixels in mask
            filtered(x,y)=median(mask(:));
        elseif strcmp(type,'laplacian')==1
            %performs filtering with mask with center value of -8,
            %surrounded by 1's
            filtered(x,y)=orig(x+1,y-1)+orig(x-1,y+1)+orig(x+1,y+1)+orig(x-1,y-1)+orig(x-1,y)+orig(x,y-1)+orig(x,y+1)+orig(x+1,y)-(8*orig(x,y));
        elseif strcmp(type,'high-boost')==1
            %performs filtering with mask with center value of -(A+8),
            %surrounded by 1's
            filtered(x,y)=orig(x+1,y-1)+orig(x-1,y+1)+orig(x+1,y+1)+orig(x-1,y-1)+orig(x-1,y)+orig(x,y-1)+orig(x,y+1)+orig(x+1,y)-(A+8)*orig(x,y);
        end    
    end
end
imshow(filtered);
title ('My Filter');
%displays edge-detection
if strcmp(type,'laplacian')==1 || strcmp(type,'high-boost')==1
    figure
end
filtered=imresize(filtered,[r,c]);
if strcmp(type,'laplacian')==1
    filtered=orig-filtered;
    imshow(filtered);
    title('My laplacian');
%high-boost has entire image amplified by A value
elseif strcmp(type,'high-boost')==1
    filtered=A*orig+filtered;
    imshow(filtered);
    title('My high-boost');
end