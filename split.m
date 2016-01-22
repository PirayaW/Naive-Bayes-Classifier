function[train_data_2,train_label_2,test_data_2,test_label_2,train_onehot_data_2,train_onehot_label_2,test_onehot_data_2,test_onehot_label_2]=split(data,label,onehot_data,onehot_label)

n=size(data,1);
k=floor(n*0.8);

indices = randsample(n,k);

for i=1:k
    train_data_2(i,:)=data(indices(i),:);
    train_label_2(i,1)=label(indices(i),1);
    train_onehot_data_2(i,:)=onehot_data(indices(i),:);
    train_onehot_label_2(i,:)=onehot_label(indices(i),1);
end
l=1;

for i=1:n
        if (~ismember(i,indices))
            test_data_2(l,:)=data(i,:);
            test_label_2(l,1)=label(i,1);
            test_onehot_data_2(l,:)=onehot_data(i,:);
            test_onehot_label_2(l,1)=onehot_label(i,1);
            l=l+1;
        end
end
end
