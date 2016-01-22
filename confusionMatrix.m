function [ confMatrix ] = confusionMatrix( real_label, predict_label )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

N = size(real_label, 1);
K = 4;
confMatrix = zeros(K);

for i=1:N
    r = real_label(i);
    p = predict_label(i);
    confMatrix(r, p) = confMatrix(r, p) + 1;
end
end

