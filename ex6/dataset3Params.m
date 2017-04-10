function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
c_train=[0.01,0.03,0.1,0.3,1,1.3,10,30];
sigma_train=c_train;
num=length(yval);
for i=1:8
    for j=1:8
        choose_c=c_train(i);
        choose_sigma=sigma_train(j);
        model= svmTrain(X, y,choose_c, @(x1, x2) gaussianKernel(x1, x2, choose_sigma)); 
        y_get=svmPredict(model, Xval);
        temp=length(find((y_get-yval)~=0));
        if(temp<num)
            num=temp;
            C = choose_c;
            sigma = choose_sigma;
        end
            
    end
end







% =========================================================================

end
