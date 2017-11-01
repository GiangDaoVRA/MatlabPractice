function [numberInput,numberNhanDang] = TH3_Q5_Recognition_Digits(n)
    %Ket qua nhan dang cua anh trong tap test co thu tu la n
    if(n>=1 && n<=10000)
    %load anh train
    imgTrainAll = loadMNISTImages('./train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('./train-labels.idx1-ubyte');
    %Nap vo thuat toan knn
    mdl = fitcknn(imgTrainAll',lblTrainAll);
    %Load anh test
    imgTestAll = loadMNISTImages('./t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    numberInput = lblTestAll(n);
    %Nhan dang
    imgTest = imgTestAll(:,n);
    numberNhanDang = predict(mdl,imgTest');
    else
        numberInput =-1;
        numberNhanDang =-1;
    end
end

