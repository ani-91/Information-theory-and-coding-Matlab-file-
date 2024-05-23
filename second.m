clc;
clear all;
A = imread("idcard.jpeg");
disp(image(A));
histogram = hist(A(:) ,0:255);
probabilities = histogram / sum(histogram);
entropy2 = 0;
for i = 1:length(probabilities)
    if probabilities(i) > 0
        entropy2 = entropy2 - probabilities(i) * log2(probabilities(i));
    end
end
disp(['Entropy of the image file: ', num2str(entropy2)]);