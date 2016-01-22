function [ acc, predicted_label ] = NaiveBayesPredict( test_data, test_label, prior, buying, maint, doors, persons, lug_boot, safety )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

M = size(test_data, 1);
% K is number of classes
K = 4;  

correct = 0;
predict = zeros(1, K);
predicted_label = zeros(M, 1);

for i = 1:M
    attr = getAttrIndex(test_data(i, :));
    
    for k = 1:K
        predict(k) = log(prior(k)) + log(buying(k, attr(1))) + log(maint(k, attr(2))) + log(doors(k, attr(3))) + log(persons(k, attr(4))) + log(lug_boot(k, attr(5))) + log(safety(k, attr(6)));
    end
    
    [max_val, predicted_class] = max(predict);
    if predicted_class == test_label(i)
        correct = correct + 1;
    end
    predicted_label(i) = predicted_class;
end
acc = correct * 100 / M;
end

function [attr] = getAttrIndex( data )
    attr = [];
    
    buying_label = {'vhigh', 'high', 'med', 'low'};
    maint_label = {'vhigh', 'high', 'med', 'low'};
    doors_label = {'2', '3', '4', '5more'};
    persons_label = {'2', '4', 'more'};
    lug_boot_label = {'small', 'med', 'big'};
    safety_label = {'low', 'med', 'high'};

    % buying
    for j=1:size(buying_label, 2)
       if strcmp(data(1), buying_label(j)) == 1
           attr(1) = j;
           break;
       end
    end
    
    % maint
    for j=1:size(maint_label, 2)
       if strcmp(data(2), maint_label(j)) == 1
           attr(2) = j;
           break;
       end
    end
    
    % doors
    for j=1:size(doors_label, 2)
       if strcmp(data(3), doors_label(j)) == 1
           attr(3) = j;
           break;
       end
    end
    
    % persons
    for j=1:size(persons_label, 2)
       if strcmp(data(4), persons_label(j)) == 1
           attr(4) = j;
           break;
       end
    end
    
    % lug_boot
    for j=1:size(lug_boot_label, 2)
       if strcmp(data(5), lug_boot_label(j)) == 1
           attr(5) = j;
           break;
       end
    end
    
    % safety
    for j=1:size(safety_label, 2)
       if strcmp(data(6), safety_label(j)) == 1
           attr(6) = j;
           break;
       end
    end
end
