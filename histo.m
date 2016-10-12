function histo (A)
[row,col]=size(A);
B=zeros(1,256);
%traverse image
for i=1:row
    for j=1:col
        if A(i,j)<1
            continue
        else
            t=A(i,j);
        end
        %adds 1 to B at value of pixel in A
        B(round(t))=B(round(t))+1;
    end
end
%display bar graph of results (histogram)
bar(B)
title('Histogram')
figure