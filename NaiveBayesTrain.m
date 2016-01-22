function [ prior, buying, maint, doors, persons, lug_boot, safety ] = NaiveBayesTrain( train_data, train_label )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

N = size(train_data, 1);
% K is number of classes
K = 4;  
% D is number of features
D = size(train_data, 2);   

buying_label = {'vhigh', 'high', 'med', 'low'};
maint_label = {'vhigh', 'high', 'med', 'low'};
doors_label = {'2', '3', '4', '5more'};
persons_label = {'2', '4', 'more'};
lug_boot_label = {'small', 'med', 'big'};
safety_label = {'low', 'med', 'high'};

buying = zeros(K, 4);
maint = zeros(K, 4);
doors = zeros(K, 4); 
persons = zeros(K, 3);
lug_boot = zeros(K, 3); 
safety = zeros(K, 3); 

prior = zeros(1, K);

for i=1:N
    class = train_label(i);
    prior(class) = prior(class) + 1;
    
    % buying
    k = 0;
    for j=1:size(buying_label, 2)
       if strcmp(train_data(i, 1), buying_label(j)) == 1
           k = j;
           break;
       end
    end
    buying(class, k) = buying(class, k) + 1;
    
    % maint
    k = 0;
    for j=1:size(maint_label, 2)
       if strcmp(train_data(i, 2), maint_label(j)) == 1
           k = j;
           break;
       end
    end
    maint(class, k) = maint(class, k) + 1;
    
    % doors
    k = 0;
    for j=1:size(doors_label, 2)
       if strcmp(train_data(i, 3), doors_label(j)) == 1
           k = j;
           break;
       end
    end
    doors(class, k) = doors(class, k) + 1;
    
    % persons
    k = 0;
    for j=1:size(persons_label, 2)
       if strcmp(train_data(i, 4), persons_label(j)) == 1
           k = j;
           break;
       end
    end
    persons(class, k) = persons(class, k) + 1;
    
    % lug_boot
    k = 0;
    for j=1:size(lug_boot_label, 2)
       if strcmp(train_data(i, 5), lug_boot_label(j)) == 1
           k = j;
           break;
       end
    end
    lug_boot(class, k) = lug_boot(class, k) + 1;
    
    % safety
    k = 0;
    for j=1:size(safety_label, 2)
       if strcmp(train_data(i, 6), safety_label(j)) == 1
           k = j;
           break;
       end
    end
    safety(class, k) = safety(class, k) + 1;
end

buying = buying ./ (prior'*ones(1,size(buying, 2)));
maint = maint ./ (prior'*ones(1,size(maint, 2)));
doors = doors ./ (prior'*ones(1,size(doors, 2)));
persons = persons ./ (prior'*ones(1,size(persons, 2)));
lug_boot = lug_boot ./ (prior'*ones(1,size(lug_boot, 2)));
safety = safety ./ (prior'*ones(1,size(safety, 2)));

prior = prior / N;

delta = 0.001;
buying = checkMissing(buying, delta);
maint = checkMissing(maint, delta);
doors = checkMissing(doors, delta);
persons = checkMissing(persons, delta);
lug_boot = checkMissing(lug_boot, delta);
safety = checkMissing(safety, delta);

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
        end
    end
end



