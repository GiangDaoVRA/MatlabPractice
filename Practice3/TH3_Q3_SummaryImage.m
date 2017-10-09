function TH3_Q3_SummaryImage()
%  Thong ke so luong cac anh tuong ung voi label cua tap train
    %Load anh train va label 
    imgTrainAll = loadMNISTImages('./train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('./train-labels.idx1-ubyte');
    nTrainImages = size(imgTrainAll,2);
    rArray=[];
    for i = 0:9
        %Ham So luong label
        n=DemSoLuong(lblTrainAll,nTrainImages,i);
        rArray=[rArray,n];
    end
    strFileName=['summaryImage.csv'];
    csvwrite(strFileName,rArray)
end

