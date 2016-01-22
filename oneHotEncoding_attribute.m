function [ encoded ] = oneHotEncoding_attribute( raw )
%oneHotEncoding_attribute
%   converts categorical features to binary features
%Input:
%   raw - a 1x6 cell of data point containing 6 categorical features.
%Output:
%   encoded - a 1x21 binary vector of converted features.

% From the description of dataset,
% total number of binary features from 6 attributes is 4+4+4+3+3+3 = 21.
encoded = zeros(1, 21);

% Attribute - buying: vhigh, high, med, low
% converts to index 1, 2, 3, 4 respectively.
switch raw{1}
    case 'vhigh'
        encoded(1) = 1;
    case 'high'
        encoded(2) = 1;
    case 'med'
        encoded(3) = 1;
    case 'low'
        encoded(4) = 1;
    otherwise
        error(strcat(raw{1}, ' is not in buying attributes'));
end

% Atrribute - maint: vhigh, high, med, low
% converts to index 5, 6, 7, 8 respectively.
switch raw{2}
    case 'vhigh'
        encoded(5) = 1;
    case 'high'
        encoded(6) = 1;
    case 'med'
        encoded(7) = 1;
    case 'low'
        encoded(8) = 1;
    otherwise
        error(strcat(raw{2}, ' is not in maint attributes'));
end

% Attribute - doors: 2, 3, 4, 5more
% converts to index 9, 10, 11, 12 respectively.
switch raw{3}
    case '2'
        encoded(9) = 1;
    case '3'
        encoded(10) = 1;
    case '4'
        encoded(11) = 1;
    case '5more'
        encoded(12) = 1;
    otherwise
        error(strcat(raw{3}, ' is not in doors attributes'));
end

% Attribute - persons: 2, 4, more
% converts to index 13, 14, 15 respectively.
switch raw{4}
    case '2'
        encoded(13) = 1;
    case '4'
        encoded(14) = 1;
    case 'more'
        encoded(15) = 1;
    otherwise
        error(strcat(raw{4}, ' is not in persons attributes'));
end

% Attribute - lug_boot: small, med, big
% converts to index 16, 17, 18 respectively.
switch raw{5}
    case 'small'
        encoded(16) = 1;
    case 'med'
        encoded(17) = 1;
    case 'big'
        encoded(18) = 1;
    otherwise
        error(strcat(raw{5}, ' is not in lug_boot attributes'));
end

% Attribute - safety: low, med, high
% converts to index 19, 20, 21 respectively.
switch raw{6}
    case 'low'
        encoded(19) = 1;
    case 'med'
        encoded(20) = 1;
    case 'high'
        encoded(21) = 1;
    otherwise
        error(strcat(raw{6}, ' is not in safety attributes'));
end
end

