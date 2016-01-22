urlwrite('http://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data', 'car.data');
original_data = importdata('car.data');
[data, label] = readData(original_data);
[onehot_data, onehot_label] = readDataOneHot(original_data);

[train_data,train_label,test_data,test_label,train_onehot_data,train_onehot_label,test_onehot_data,test_onehot_label] = split(data,label,onehot_data,onehot_label);

% ---------------------

[prior, buying, maint, doors, persons, lug_boot, safety] = NaiveBayesTrain(train_data, train_label);
[train_acc, train_predict] = NaiveBayesPredict(train_data, train_label, prior, buying, maint, doors, persons, lug_boot, safety);

[test_acc, test_predict] = NaiveBayesPredict(test_data, test_label, prior, buying, maint, doors, persons, lug_boot, safety);

cm = confusionMatrix(test_label, test_predict);

% ----------------------

[p_onehot, prior_onehot] = NaiveBayesOneHotTrain(train_onehot_data, train_onehot_label);
[train_onehot_acc, train_onehot_predict] = NaiveBayesOneHotPredict(train_onehot_data, train_onehot_label, p_onehot, prior_onehot);

[test_onehot_acc, test_onehot_predict] = NaiveBayesOneHotPredict(test_onehot_data, test_onehot_label, p_onehot, prior_onehot);

cm_onehot = confusionMatrix(test_onehot_label, test_onehot_predict);

% ---------------------- Report the result --------------------------------
disp('Without one-hot-encoding');
disp(['Training accuracy: ' num2str(train_acc) '%']);
disp(['Test accuracy: ' num2str(test_acc) '%']);
disp('Confusion matrix');
cm

disp(' --------------------- ');

disp('With one-hot-encoding');
disp(['Training accuracy: ' num2str(train_onehot_acc) '%']);
disp(['Test accuracy: ' num2str(test_onehot_acc) '%']);
disp('Confusion matrix');
cm_onehot

