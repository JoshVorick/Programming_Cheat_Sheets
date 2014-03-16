function [X, theta, J_history, mu, sigma] = linearRegression(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

m = length(y); % number of training examples
mu = sigma = zeros(1, length(theta) - 1);
J_history = zeros(num_iters, 1);

% format matrix (add row of 1s for theta(1))
if sum(X(:,1)) ~= m
	X = [ones(m,1) X];
end;

% Calculate theta
if size(X,1) < 1000 && size(X,2) < 1000
	% If array is small calculate using normal equation
	theta = pinv(X' * X) * X' * y;	
	disp('Used Normal Equtaion!');
	
else
	% Otherwise use gradient descent
	
	% Normalize Features (makes gradient descent run faster)
	if mean(X(:,2)) > 0.00001 % Will be false if already normalized
		[X(:, 2:length(theta)), mu, sigma] = featureNormalize(X(:, 2:length(theta)));
	end;
	
	for iter = 1:num_iters

		temp_theta = theta;
		
		for i = 1:size(X,2) 
			predictions = X * theta;
			% MUST update each theta independetly or bad things happen
			temp_theta(i) = theta(i) - (alpha/m) * sum( ((predictions - y)' * X(:,i)) ); 
		end;
		
		 % Break out of loop if theta didn't change (minimizer found)
		 if theta == temp_theta
			disp(sprintf('Iterations before converging: %i', iter));
			break;
		else
			theta = temp_theta; % Update theta
		end;
		
		 % Save the cost J in every iteration    
		 J_history(iter) = computeCostMulti(X, y, theta);

	end;
	
	disp('Used Gradient Descent!');
end;

end