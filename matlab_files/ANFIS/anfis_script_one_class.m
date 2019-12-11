clc
clear all
close all

data = csvread('data_for_anfis.csv', 1);

Input  = data(:,2:3);
Output = data(:,4);

edges = [0, 40, 60, 100];
OutputDiscrete = discretize(Output, edges);
OutputConfusion = dummyvar(OutputDiscrete);
OutputOneClass = OutputConfusion(:,2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
epoch_n = 100;
dispOpt = zeros(1,4);
numMFs = 3;
inmftype= 'gbellmf';
outmftype= 'linear';
split_range=3;
Model=ANFIS.train(Input,OutputOneClass,split_range,numMFs,inmftype,outmftype,dispOpt,epoch_n);
disp('Model')
disp(Model)
%Result=ANFIS.classify(Model,InputTrain)

%Display
n=1000;
disp('Class Predicted ')
%disp = [OutputTrain(1:n),Result(1:n)]
disp(Model)
Result=round(ANFIS.classify(Model,Input));

%ResultConfusion = dummyvar(Result');
plotconfusion(OutputOneClass',Result')
toc
%%%%
%%%%
%%%%%%%% ACABO PROGRAMA 1 %%%%%%%%%%%%%%%%%%%%%


%%%%%%%%  Comienza programa 2 %%%%%%%%%%%%%%%%%%%%%%%%5


stop = 1
tic
opt = genfisOptions('GridPartition');
%opt = genfisOptions('FCMClustering','NumClusters',6)%('SubtractiveClustering')%,...
                   % 'ClusterInfluenceRange');
% outFIS = anfis([InputTest OutputTest],opt);
% opt.DisplayANFISInformation = 0;
% opt.DisplayErrorValues = 0;
% opt.DisplayStepSize = 0;
% opt.DisplayFinalResults = 0;                
 
fis = genfis(Input,OutputOneClass,opt)

showrule(fis)

Out = evalfis(Input,fis);

Result=round(Out);
figure(2)
plotconfusion(OutputOneClass',Result')
toc
