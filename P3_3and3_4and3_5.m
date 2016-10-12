%prompts user for transformation, input image, and A value if high-boost
%filtering
clc
close all
type=input('Enter median, laplacian, or high-boost: ', 's');
image=input('Enter spine, moon, or text: ', 's');
if strcmp(type,'high-boost')==1
    A=input('Enter A value: ');
else
    A=1;
end
if strcmp(image,'spine')==1
    image='Fig0308(a)(fractured_spine).tif';
elseif strcmp(image,'moon')==1
    image='Fig0338(a)(blurry_moon).tif';
elseif strcmp(image,'text')==1
    image='Fig0340(a)(dipxe_text).tif';
end
spatfilt(image, type, A)