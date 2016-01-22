function [ encoded ] = oneHotEncoding_label( raw )
%oneHotEncoding_label
%   converts categorical label to numeric label
%Input:
%   raw - a char of label.
%Output:
%   encoded - a converted numeric label.

% Class label: unacc, acc, good, vgood
% converts to number 1, 2, 3, 4 respectively.
switch raw
    case 'unacc'
        encoded = 1;
    case 'acc'
        encoded = 2;
    case 'good'
        encoded = 3;
    case 'vgood'
        encoded = 4;
    otherwise
        error(strcat(raw, ' is not in label.'));
end
end

