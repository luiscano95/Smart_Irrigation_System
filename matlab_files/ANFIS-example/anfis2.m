clc
clear all
close all

%a = xlsread('CreditTeste1.xlsx');
Ctrei = xlsread('CreditTreino1.xlsx');
Ctest = xlsread('CreditTeste1.xlsx');

%CtreiN = normalize(Ctrei);
%CtestN = normalize(Ctest);

InputTrain  = Ctrei(:,1:11);
OutputTrain = Ctrei(:,12);

InputTest  = Ctest(:,1:11);
OutputTest = Ctest(:,12);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
epoch_n = 100;
dispOpt = zeros(1,4);
numMFs = 3;
inmftype= 'gbellmf';
outmftype= 'linear';
split_range=3;
Model=ANFIS.train(InputTrain,OutputTrain,split_range,numMFs,inmftype,outmftype,dispOpt,epoch_n);
disp('Model')
disp(Model)
%Result=ANFIS.classify(Model,InputTrain)

%Display
n=1000;
disp('TestClass Predicted ')
%disp = [OutputTrain(1:n),Result(1:n)]
disp(Model)
Result=round(ANFIS.classify(Model,InputTest));
plotconfusion(OutputTest',Result')
toc
%%%%
%%%%
%%%%%%%% ACABO PROGRAMA 1 %%%%%%%%%%%%%%%%%%%%%


%%%%%%%%  Comienza programa 2 %%%%%%%%%%%%%%%%%%%%%%%%5


stop = 1
tic
%genOpt = genfisOptions('GridPartition');
opt = genfisOptions('FCMClustering','NumClusters',11)%('SubtractiveClustering')%,...
                   % 'ClusterInfluenceRange');
% outFIS = anfis([InputTest OutputTest],opt);
% opt.DisplayANFISInformation = 0;
% opt.DisplayErrorValues = 0;
% opt.DisplayStepSize = 0;
% opt.DisplayFinalResults = 0;                
 
fis = genfis(InputTrain,OutputTrain,opt)

showrule(fis)

Out = evalfis(InputTest,fis)

Result=round(Out);
figure(2)
plotconfusion(OutputTest',Result')
toc
