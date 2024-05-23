clc
clear all;
fileID = fopen("myname.txt");
formatSpec = '%c';
A = fscanf(fileID,formatSpec);
disp(A);
fclose(fileID);
d =double(A);
histogram = hist(d,1:256);
probabilities = histogram / sum(histogram);
entropy1 = 0;
for i = 1:length(probabilities)
    if probabilities(i) > 0
        entropy1 = entropy1 - probabilities(i) * log2(probabilities(i));
    end
end
disp(['Entropy of the text file: ', num2str(entropy1)]);