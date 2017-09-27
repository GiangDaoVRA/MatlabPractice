function Recognition004_Digits_kNN()
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    imgTrainAll = loadMNISTImages('./train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('./train-labels.idx1-ubyte');
    mdl = fitcknn(imgTrainAll,lblTrainAll);
    imgTestAll = loadMNISTImages('./t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    nTestImages = size(imgTestAll,2);
    nNumber = randi([1 nTestImages]);
    imgTest = imgTestAll(:,nNumber);
    lblPredictTest = predict(mdl,imgTest);
    lblImageTest = lblTestAll(nNumber);
    figure;
    img2D = reshape(imgTest,28,28);
    imshow(img2D);
    strLabelImage = 'Ban Dau ';
    strLabelImage = [strLabelImage,num2str(lblImageTest),'.'];
    strLabelImage = [strLabelImage,'Du Doan: '];
    strLabelImage = [strLabelImage,num2str(lblPredictTest),'.'];
    
    if(lblPredictTest==lblImageTest)
            strLabelImage = [strLabelImage,' Ket qua dung'];
    else strLabelImage = [strLabelImage,' Ket qua sai'];
    title(strLabelImage);
end


