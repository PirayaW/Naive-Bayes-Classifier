function [ data, label ] = readDataOneHot( d )
%readData
%   reads data
%Input:
%   d - a Nx1 cell, each row is one line of data in this string format:
%       'd1,d2,d3,d4,d5,d6,label'. 
%Output:
%   data - a Nx6 matrix of binary classification dataset with 6 features.
%   label - a Nx1 vector of numeric label.

% number of rows
len = size(d, 1);

data = [];
label = zeros(len, 1);

% splits and encodes data for each row
for i = 1:len
    temp = strsplit(d{i}, ',');
    data(i, :) = oneHotEncoding_attribute(temp(1:6));
    label(i) = oneHotEncoding_label(temp{7});
end

end

