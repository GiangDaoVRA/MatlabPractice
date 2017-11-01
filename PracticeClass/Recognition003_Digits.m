function Recognition003_Digits
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    fprintf('\n Load du lieu train');
    imgTrainAll = loadMNISTImages('./train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('./train-labels.idx1-ubyte');
    fprintf('\n Load du lieu test');
    imgTestAll = loadMNISTImages('./t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    
    nTrainImages = size(imgTrainAll,2);
    nNumeber = randi([1 nTrainImages]);
    figure;
    img = imgTrainAll(:,nNumeber);
    img2D = reshape(img,28,28);
    strLabelImage = num2str(lblTrainAll(nNumeber));
    strLabelImage = [strLabelImage,'(',num2str(nNumeber),')'];
    imshow(img2D);
    title(strLabelImage);
    nTestImage = size(imgTestAll,2);
    nNumeber = randi([1 nTestImage]);
    figure;
    img = imgTestAll(:,nNumeber);
    img2D = reshape(img,28,28);
    strLabelImage = num2str(lblTestAll(nNumeber));
    strLabelImage = [strLabelImage,'(',num2str(nNumeber),')'];
    imshow(img2D);
    title(strLabelImage);
end

