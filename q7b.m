function [acc acc_av]= q7b(images_train, labels_train, images_test, labels_test, k)
predictionWrong=zeros(1,10);
predictionCorrect=zeros(1,10);
acc_av=0;
acc=zeros(1,10);
for i=1:1000%length(images_test)
    for j=1:length(images_train)%1000
        %calculate euclidian distance
        euDistance(j,1) = pdist2(images_test(i,:),images_train(j,:));
        euDistance(j,2) = labels_test(i,1);
        euDistance(j,3) = labels_train(j,1);
    end
    %sort data in ascending order
    sortedDist = sortrows(euDistance,1);
    %extract values according to k
    for m=1:k
        finalVal(m,:)=sortedDist(m,:);
    end
    %calcuate frequency and max number of occurances
    predictionVal = mode(finalVal);
    %calculate individual digits accuracy
    if predictionVal(1,2) == predictionVal(1,3)
        if predictionVal(1,2)==0
            predictionCorrect(1)=predictionCorrect(1) + 1;                
        elseif predictionVal(1,2)==1
            predictionCorrect(2)=predictionCorrect(2) + 1;
        elseif predictionVal(1,2)==2
            predictionCorrect(3)=predictionCorrect(3) + 1;
        elseif predictionVal(1,2)==3
            predictionCorrect(4)=predictionCorrect(4) + 1;
        elseif predictionVal(1,2)==4
            predictionCorrect(5)=predictionCorrect(5) + 1;
        elseif predictionVal(1,2)==5
            predictionCorrect(6)=predictionCorrect(6) + 1;
        elseif predictionVal(1,2)==6
            predictionCorrect(7)=predictionCorrect(7) + 1;
        elseif predictionVal(1,2)==7
            predictionCorrect(8)=predictionCorrect(8) + 1;
        elseif predictionVal(1,2)==8
            predictionCorrect(9)=predictionCorrect(9) + 1;
        elseif predictionVal(1,2)==9
            predictionCorrect(10)=predictionCorrect(10) + 1;
        else
            disp('Prediction error');
        end

    elseif predictionVal(1,2) ~= predictionVal(1,3)
        if predictionVal(1,2)==0
            predictionWrong(1)=predictionWrong(1) + 1;                
        elseif predictionVal(1,2)==1
            predictionWrong(2)=predictionWrong(2) + 1;
        elseif predictionVal(1,2)==2
            predictionWrong(3)=predictionWrong(3) + 1;
        elseif predictionVal(1,2)==3
            predictionWrong(4)=predictionWrong(4) + 1;
        elseif predictionVal(1,2)==4
            predictionWrong(5)=predictionWrong(5) + 1;
        elseif predictionVal(1,2)==5
            predictionWrong(6)=predictionWrong(6) + 1;
        elseif predictionVal(1,2)==6
            predictionWrong(7)=predictionWrong(7) + 1;
        elseif predictionVal(1,2)==7
            predictionWrong(8)=predictionWrong(8) + 1;
        elseif predictionVal(1,2)==8
            predictionWrong(9)=predictionWrong(9) + 1;
        elseif predictionVal(1,2)==9
            predictionWrong(10)=predictionWrong(10) + 1;
        else
            disp('Prediction error');
        end
    end   
  %disp(i);  
end
predictionWrong;
predictionCorrect;
%Calculate accuracy
for n=1:10
    acc(n) = (predictionCorrect(n)/(predictionCorrect(n)+predictionWrong(n)))*100;
end
acc;
%Calculate average
for p=1:10
    acc_av = acc_av + acc(p);
end
acc_av=acc_av/10;
acc_av;
end
