function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%

% X has samples in rows and features in columns.
XTheta = X*theta;
HTheta = arrayfun(@sigmoid, XTheta);
logHTheta1 = log(HTheta);
logHTheta2 = log(1-HTheta);
ylogHTheta = (-y).*(logHTheta1) - (1-y).*logHTheta2;
J = (1/m)*sum(ylogHTheta);
J = J + (lambda/(2*m))*(theta(2:end)'*theta(2:end));


% Now we will calculate the gradients
XTheta = X*theta;
HTheta = arrayfun(@sigmoid, XTheta);
HTheta_y = HTheta - y;
grad = (1/m)*X'*HTheta_y;
grad = grad + [0 ; (lambda/m)*theta(2:end)];



% =============================================================

grad = grad(:);

end


function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

g = 1.0 ./ (1.0 + exp(-z));
end
