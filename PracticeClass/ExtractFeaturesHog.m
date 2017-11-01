function [featuresDataTrain] = ExtractFeaturesHog(imgDataTrain)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    imgI1D = imgDataTrain(:,1);
    imgI2D = reshape(imgI1D,28,28);
    featureVector = extractHOGFeatures(imgI2D);

    nSize = length(featureVector);
    nTrainData = size(imgDataTrain,2);
    featuresDataTrain=zeros(nSize,nTrainData);
    
    for i = 1:nTrainData
        imgI1D = imgDataTrain(:,i);
        imgI2D = reshape(imgI1D,28,28);
        featuresDataTrain(:,i) = extractHOGFeatures(imgI2D);
    end

end
