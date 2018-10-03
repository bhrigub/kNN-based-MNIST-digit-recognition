clear
load MNIST_digit_data
whos

%%% randomly permute data points
rand('seed', 1); %%just to make all random sequences on all computers the same.
inds = randperm(size(images_train, 1));
images_train = images_train(inds, :);
labels_train = labels_train(inds, :);

inds = randperm(size(images_test, 1));
images_test = images_test(inds, :);
labels_test = labels_test(inds, :);


%%% if you want to use only the first 1000 data points.
images_test1 = images_test(1:1000, :);
labels_test1 = labels_test(1:1000, :);

%Data for question 7E
images_train7e1 = images_train(1:1000, :);
images_test7e2 = images_train(1001:2000, :);
labels_train7e1 = labels_train(1:1000, :);
labels_test7e2 = labels_train(1001:2000, :);

% %%% show the 10'th train image
% i = 10;
% close all
% im = reshape(images_train(i, :), [28 28]);
% imshow(im)
% title(num2str(labels_train(i)));

choice= input('Enter question execution option 1(for 7b), 2(for 7c), 3(for 7d), 4(for 7e)- \n 1) Implements kNN for this task and reports the accuracy for each class (10 numbers) \n as well as the average accuracy.\n 2) To execute for $k=1$, change the number of training data points (30 to 10,000) \n 3) Show the effect of $k$ (each for a particular $k$ in [1 2 3 5 10].) on the accuracy. \n 4) Choose the best $k$ for 2,000 total training data by splitting the training data \n into two halves.');
switch(choice)
   case 1
        % Question 7b
       k=4;
       [acc1 acc_av1]= q7b(images_train, labels_train, images_test1, labels_test1, k);
       disp(acc1);
       disp(acc_av1);
   case 2 
        % Question 7c
       k=1;
       [acc2 acc_av2]= q7c(images_train, labels_train, images_test1, labels_test1, k);
   case 3
        % Question 7d
       k=[1 2 3 5 10];
       [acc3 acc_av3]= q7d(images_train, labels_train, images_test1, labels_test1, k);
   case 4
        % Question 7e
       k=[1 2 3 5 10];
       [acc4 acc_av4]= q7e(images_train7e1, labels_train7e1, images_test7e2, labels_test7e2, k);
        
   otherwise
      fprintf('Invalid input\n' );
end
