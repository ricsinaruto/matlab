% Solve an Input-Output Fitting problem with a Neural Network
% Script generated by Neural Fitting app
% Created 06-Mar-2017 21:27:32
%
% This script assumes these variables are defined:
%
%   input_data - input data.
%   data - target data.

x = input_data(1:100000,:)';
t = output_data_dipol(1:100000,:)';

% Choose a Training Function
% For a list of all training functions type: help nntrain
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.
trainFcn = 'trainscg';  

% Create a Fitting Network
layersize=112;
hiddenLayerSize = 1:10;
hiddenLayerSize(1,1)=layersize;
hiddenLayerSize(1,2)=layersize;
hiddenLayerSize(1,3)=layersize;
hiddenLayerSize(1,4)=layersize;
hiddenLayerSize(1,5)=layersize;
hiddenLayerSize(1,6)=layersize;
hiddenLayerSize(1,7)=layersize;
hiddenLayerSize(1,8)=layersize;
hiddenLayerSize(1,9)=layersize;
hiddenLayerSize(1,10)=layersize;



net = fitnet(hiddenLayerSize,trainFcn);
net.trainParam.epochs=100000;
net.trainParam.max_fail=100;

% Choose Input and Output Pre/Post-Processing Functions
% For a list of all processing functions type: help nnprocess
net.input.processFcns = {'removeconstantrows','mapminmax'};
net.output.processFcns = {'removeconstantrows','mapminmax'};

% Setup Division of Data for Training, Validation, Testing
% For a list of all data division functions type: help nndivide
net.divideFcn = 'dividerand';  % Divide data randomly
net.divideMode = 'sample';  % Divide up every sample
net.divideParam.trainRatio = 0.6;
net.divideParam.valRatio = 0.3;
net.divideParam.testRatio = 0.1;

% Choose a Performance Function
% For a list of all performance functions type: help nnperformance
net.performFcn = 'mse';  % Mean Squared Error
net.performParam.regularization = 0.2;

% Choose Plot Functions
% For a list of all plot functions type: help nnplot
net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    'plotregression', 'plotfit'};

% Train the Network
[net,tr] = train(net,x,t,'useGPU','yes');

% Test the Network
y = net(x,'useGPU','yes');
e = gsubtract(t,y);
performance = perform(net,t,y)

% Recalculate Training, Validation and Test Performance
trainTargets = t .* tr.trainMask{1};
valTargets = t .* tr.valMask{1};
testTargets = t .* tr.testMask{1};
trainPerformance = perform(net,trainTargets,y)
valPerformance = perform(net,valTargets,y)
testPerformance = perform(net,testTargets,y)

% View the Network
%view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
figure, ploterrhist(e,'bins',100)
%figure, plotregression(t,y)
%figure, plotfit(net,x,t)

% Deployment
% Change the (false) values to (true) to enable the following code blocks.
% See the help for each generation function for more information.
if (true)
    % Generate MATLAB function for neural network for application
    % deployment in MATLAB scripts or with MATLAB Compiler and Builder
    % tools, or simply to examine the calculations your trained neural
    % network performs.
    genFunction(net,'myNeuralNetworkFunction');
    y = myNeuralNetworkFunction(x);
end
if (false)
    % Generate a matrix-only MATLAB function for neural network code
    % generation with MATLAB Coder tools.
    genFunction(net,'myNeuralNetworkFunction','MatrixOnly','yes');
    y = myNeuralNetworkFunction(x);
end
if (false)
    % Generate a Simulink diagram for simulation or deployment with.
    % Simulink Coder tools.
    gensim(net);
end
