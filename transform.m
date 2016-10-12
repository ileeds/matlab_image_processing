function transform(type,c,y,image)
orig=imread(image);
imshow(orig)
title('Original Image')
figure
%converts image to double so transformations can be done on pixel values
input=im2double(orig);
if strcmp(type,'log')==1
    %log transformation equation
    output=c*log(1+input);
elseif strcmp(type,'power-law')==1
    %power-law transformation equation
    output=c*input.^y;
end
imshow(output)
title('Transformed Image')