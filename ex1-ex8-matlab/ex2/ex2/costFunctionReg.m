function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
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
% Computing cost
for i = 1:m
    yi = y(i);
    xi = X(i, :)';
    hi = sigmoid(theta'*xi);
    J = J + (1/m)*(-yi*log(hi) - (1-yi)*log(1-hi));
end
J = J + (lambda/(2*m)) * (theta(2:length(theta))'*theta(2:length(theta)));

% Gradient code
for j = 1:size(theta)
    for i = 1:m
        yi = y(i);
        xi = X(i, :)';
        hi = sigmoid(theta'*xi);
        grad(j) = grad(j) + (1/m)*(hi - yi)*xi(j);
    end
    if j > 1
        grad(j) = grad(j) + (lambda/m)*theta(j);
    end
end
% =============================================================

end
