function [acc acc_av] = q7d (images_train, labels_train, images_test, labels_test, k)
predictionWrong=zeros(1,10);
predictionCorrect=zeros(1,10);
acc_av=0;
acc=zeros(1,10);
datasetSizes= logspace(1.48,4,10)
v=1;
for t=1:length(k)
    av_arr=zeros(1,10);
    v=1;
    for r=1:10
        for i=1:1000%length(images_test)
            %euDistance=zeros(length(images_train),3);
            for j=1:datasetSizes(r)%length(images_train)
                euDistance(j,1) = pdist2(images_test(i,:),images_train(j,:));
                euDistance(j,2) = labels_test(i,1);
                euDistance(j,3) = labels_train(j,1);
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
        acc(n) = (predictionCorrect(n)/(predictionCorrect(n)+predictionWrong(n)))*100;
    end
    %Calculate average
    for p=1:10
        acc_av = acc_av + acc(p);
    end
    acc_av=acc_av/10;
    av_arr(1,v)=acc_av;
    v=v+1;
    r;
    end
    ln3(t) = plot(datasetSizes,av_arr);%],[datasetSizes(2),av_arr(2)],[datasetSizes(3),av_arr(3)],[datasetSizes(4),av_arr(4)],[datasetSizes(5),av_arr(5)],[datasetSizes(6),av_arr(6)],[datasetSizes(7),av_arr(7)],[datasetSizes(8),av_arr(8)],[datasetSizes(9),av_arr(9)],[datasetSizes(10),av_arr(10)]]); 
    ln3(t).LineWidth=2;
    %legend([ln3(1);ln3(2);ln3(3);ln3(4)],'1','2','3','5');
    %ln2.Marker='o';
    %ln1.Color=[0 0.5 0.5];
    hold on
    t;
end
hold off
end
