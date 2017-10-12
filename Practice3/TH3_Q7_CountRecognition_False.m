function [SLDung,SLSai] = TH3_Q7_CountRecognition_False(n)
    %Dem so luong cac anh co label la n bi nhan dang sai theo thuat toan
    %knn (n=0...9
    %Load Anh train
    imgTrainAll = loadMNISTImages('./train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('./train-labels.idx1-ubyte');
    %Nap thuat toan
    mdl = fitcknn(imgTrainAll',lblTrainAll);
    %Load anh test
    imgTestAll = loadMNISTImages('./t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    %So luong anh test
    nTestImages = size(imgTestAll, 2);
    
    SLDung=0;
    SLSai=0;
    for i = 1:nTestImages
        %Dem tren label la n (n=0...9)
        if lblTestAll(i)==n
             %Nhan dang
            imgTest = imgTestAll(:,i);
            lblPredictTest = predict(mdl,imgTest');
            lblImageTest = lblTestAll(i);
            if(lblPredictTest==lblImageTest)
               SLDung = SLDung+1;
            else SLSai = SLSai+1;
            end
        end   
    end
end

