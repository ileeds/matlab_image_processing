%prompts user for type of transformation, c (and possibly gamma)
%value(s), and input image
clc
close all
type=input('Enter log or power-law: ', 's');
c=input('Enter c value: ');
if strcmp(type,'power-law')==1
    y=input('Enter gamma value: ');
else
    y=1;
end
image=input('Enter spine, moon, or text: ', 's');
if strcmp(image,'spine')==1
    image='Fig0308(a)(fractured_spine).tif';
elseif strcmp(image,'moon')==1
    image='Fig0338(a)(blurry_moon).tif';
elseif strcmp(image,'text')==1
    image='Fig0340(a)(dipxe_text).tif';
end
transform(type,c,y,image);