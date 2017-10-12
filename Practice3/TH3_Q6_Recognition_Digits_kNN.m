function TH3_Q6_Recognition_Digits_kNN(n)
    
    %Load Anh train
    imgTrainAll = loadMNISTImages('./train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('./train-labels.idx1-ubyte');
    %Nap thuat toan
    mdl = fitcknn(imgTrainAll',lblTrainAll);
    %Load anh test
    imgTestAll = loadMNISTImages('./t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    %Nhan dang
    imgTest = imgTestAll(:,n);
    lblPredictTest = predict(mdl,imgTest');
    lblImageTest = lblTestAll(n);
    %Hien thi anh test ban dau
    figure;
    img2D = reshape(imgTest,28,28);
    imshow(img2D);
    strLabelImage = 'Con so ban dau: ';
    
    strLabelImage = [strLabelImage,num2str(lblImageTest),'.'];
    strLabelImage = [strLabelImage,'Con so du doan: '];
    strLabelImage = [strLabelImage,num2str(lblPredictTest),'.'];
    
    if(lblPredictTest==lblImageTest)
            strLabelImage = [strLabelImage,' Ket qua nhan dang dung'];
    else strLabelImage = [strLabelImage,' Ket qua nhan dang sai'];
    end
    title(strLabelImage);
end

