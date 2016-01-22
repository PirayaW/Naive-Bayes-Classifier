function [ acc, predicted_label ] = NaiveBayesOneHotPredict( test_data, test_label, p, prior )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

M = size(test_data, 1);
% K is number of classes
K = 4;  

correct = 0;
predict = zeros(1, K);
predicted_label = zeros(M, 1);
for i = 1:M
    for k = 1:K
        predict(k) = prior(k) * prod(p(k, :).^test_data(i, :), 2) * prod((1-p(k, :)).^(1-test_data(i, :)), 2);
    end
    [max_val, predicted_class] = max(predict);
    if predicted_class == test_label(i)
        correct = correct + 1;
    end
    predicted_label(i) = predicted_class;
end
acc = correct * 100 / M;

end

