function [imgData,lblData] = loadData(strFileNameData, strFileNameLabel)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    imgData = loadMNISTImages(strFileNameData);
    lblData = loadMNISTLabels(strFileNameLabel);
end

