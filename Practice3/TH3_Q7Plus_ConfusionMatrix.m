function [s0,s1,s2,s3,s4,s5,s6,s7,s8,s9] = TH3_Q7Plus_ConfusionMatrix(n)
    %Lap bang confusion matrix
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
    
    s0=0;
    s1=0;
    s2=0;
    s3=0;
    s4=0;
    s5=0;
    s6=0;
    s7=0;
    s8=0;
    s9=0;
    for i = 1:nTestImages
        %Dem tren label la n (n=0...9)
        if lblTestAll(i)==n
             %Nhan dang
            imgTest = imgTestAll(:,i);
            lblPredictTest = predict(mdl,imgTest');
            
            switch lblPredictTest
                case 0
                    s0=s0+1;
                case 1
                    s1=s1+1;
                case 2
                    s2=s2+1;
                case 3
                    s3=s3+1;
                case 4
                    s4=s4+1;
                case 5
                    s5=s5+1;
                case 6
                    s6=s6+1;
                case 7
                    s7=s7+1;
                case 8
                    s8=s8+1;
                case 9
                    s9=s9+1;
            end
            
        end   
    end
end

