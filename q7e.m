function [acc4 acc_av4]= q7e(images_train7e1, labels_train7e1, images_test7e2, labels_test7e2, k);
predictionWrong=zeros(10,1);
predictionCorrect=zeros(10,1);
acc_av4=0;
acc4=zeros(1,10);
%datasetSizes= logspace(1.48,4,10)
av_arr=zeros(1,length(k));
v=1;
for t=1:length(k)
    %for r=1:10
    for i=1:1000%length(images_test)
        %euDistance=zeros(length(images_train7e1),3);
        for j=1:1000%length(images_train)%datasetSizes(r)
            euDistance(j,1) = pdist2(images_test7e2(i,:),images_train7e1(j,:));
            euDistance(j,2) = labels_test7e2(i,1);
            euDistance(j,3) = labels_train7e1(j,1);
        end
        sortedDist = sortrows(euDistance,1);
        %extract values according to k
        for m=1:k(t)
            finalVal(m,:)=sortedDist(m,:);
        end
        %calcuate frequency and max number of occurances
        if k(t)==1
            predictionVal = finalVal;
        else
            predictionVal = mode(finalVal);
        end

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
        acc4(n) = (predictionCorrect(n)/(predictionCorrect(n)+predictionWrong(n)))*100;
    end
    %Calculate average
    for p=1:10
        acc_av4 = acc_av4 + acc4(p);
    end
    acc_av4=acc_av4/10;
    av_arr(1,v)=acc_av4;
    v=v+1;
    %end
end
ln4 = plot(k,av_arr);%(1)],[k(2),av_arr(2)],[k(3),av_arr(3)],[k(4),av_arr(4)],[k(5),av_arr(5)]);
ln4.Marker='o';
ln4.LineWidth = 2;
ln4.Color = [0 0.5 0.5];
end
