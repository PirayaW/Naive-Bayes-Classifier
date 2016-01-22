function [ data, label ] = readData( d )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

len = size(d, 1);

data = cell(len, 6);
label = zeros(len, 1);
K = 4;

% splits and encodes data for each row
for i = 1:len
    temp = strsplit(d{i}, ',');
    data(i, :) = temp(1:6);
    label(i) = oneHotEncoding_label(temp{7});
end

end

