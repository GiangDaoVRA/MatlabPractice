function [Acc] = TH3_Q8_Accurate(k,distance)
    %Tinh do chinh xac cua thuat toan
    %knn (n=0...9
    %Load Anh train
    imgTrainAll = loadMNISTImages('./train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('./train-labels.idx1-ubyte');
    %Nap thuat toan
    mdl =fitcknn(imgTrainAll', lblTrainAll, 'NumNeighbors',k, 'Distance',distance);
    %Load anh test
    imgTestAll = loadMNISTImages('./t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    %So luong anh test
    nTestImages = size(imgTestAll, 2);
    SLDung=0;
    %cho chay tu 0 den 9
    for j=0:9
        for i = 1:nTestImages
            %Dem tren label la j 
            if lblTestAll(i)==j
                 %Nhan dang
                imgTest = imgTestAll(:,i);
                lblPredictTest = predict(mdl,imgTest');
                lblImageTest = lblTestAll(i);
                if(lblPredictTest==lblImageTest)
                   SLDung = SLDung+1;
                end
            end   
        end
    end
    Acc = SLDung*100/nTestImages;
end

