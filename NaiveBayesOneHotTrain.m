function [ p, prior ] = NaiveBayesOneHotTrain( train_data, train_label )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

N = size(train_data, 1);
% K is number of classes
K = 4;  
% D is number of features
D = size(train_data, 2);   

% train data
prior = zeros(1, K);
p = zeros(K, D);
for i = 1:N
    class = train_label(i);
    prior(class) = prior(class) + 1;
    p(class, :) = p(class, :) + train_data(i, :);
end
% p(c, d) = P(X_d|c) = #times 1 appears in d^th features of data points labeled as c 
%                   / #total trials for data points labeled as c.
% p = (p+1) ./ ((prior+D)'*ones(1,size(p, 2)));
p = p ./ (prior'*ones(1,size(p, 2)));
% prior(c) = #data points labeled as c / #total trials
prior = prior / N;
p = checkMissing(p, 0.001);
end

% fill probability of feature value that do not exist in the training data
function [ p ] = checkMissing(p, val)
    r = size(p, 1);
    c = size(p, 2);
    for i = 1:r
        for j = 1:c
            if p(i, j) == 0
                p(i, j) = val;
            end
            if p(i, j) == 1
                p(i, j) = 1-val;
            end
        end
    end
end

