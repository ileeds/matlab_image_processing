function equalize (filename)
A=imread(filename);
histo(A);
imshow(A)
title ('Original')
figure
[r,c]=size(A);
%number of pixels
pixels=r*c;
freq=zeros(256,1);
probfreq=zeros(256,1);
probcum=zeros(256,1);
cum=zeros(256,1);
final=zeros(256,1);
%whenever you see pixval+1, it's so coordinate never has 0
for i=1:r
    for j=1:c
        pixval=A(i,j);
        %increment counter value of current pixval
        freq(pixval+1)=freq(pixval+1)+1;
        %probability of current pixval
        probfreq(pixval+1)=freq(pixval+1)/pixels;
    end
end
sum=0;
%number of possible pixel values
bins=256;
for i=1:256
   sum=sum+freq(i);
   %cumulative frequency
   cum(i)=sum;
   %probability of pixel value using cumulative frequency
   probcum(i)=cum(i)/pixels;
   %equalized values
   final(i)=(probcum(i)*bins);
end
histo(final);
plot((0:255), probcum)
title('Equalization Transformation Function');
figure
for i=1:r
    for j=1:c
        %give image equalized values
        A(i,j)=final(A(i,j)+1);
    end
end
imshow(A)
title('Equalized');