function Recognition000_Digits()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    TatCaAnh=loadMNISTImages("train-images.idx3-ubyte");
    Anh00001=reshape(TatCaAnh(:,19),28,28);
    imshow(Anh00001);

end

