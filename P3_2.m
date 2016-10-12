%prompts user for input image, performs histogram equalization
clc
close all
image=input('Enter spine, moon, or text: ', 's');
if strcmp(image,'spine')==1
    image='Fig0308(a)(fractured_spine).tif';
elseif strcmp(image,'moon')==1
    image='Fig0338(a)(blurry_moon).tif';
elseif strcmp(image,'text')==1
    image='Fig0340(a)(dipxe_text).tif';
end
equalize(image);