function TH3_Q4_SummaryImageTest()
%Thong ke so luong cac anh tuong ung voi lanel trong tap test cua tap tap
%du lieu MNIST

    imgTestAll = loadMNISTImages('./t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    nTestImages = size(imgTestAll,2);
    rArray=[];
    for i = 0:9
        %Ham So luong label
        n=DemSoLuong(lblTestAll,nTestImages,i);
        rArray=[rArray,n];
    end
    strFileName=['summaryImageTest.csv'];
    csvwrite(strFileName,rArray)

end

