function y = guessNewValues(X, theta, mu, sigma)
% Guess new y values for features X 
% mu is the mean of X's unnormalized values
% sigma is standard deviation
% mu and sigma will be 0 if original X was never normalized


% format matrix (add row of 1s for theta(1))
if sum(X(:,1)) ~= sum(ones(size(X,1),1))
	X = [ones(size(X,1),1) X];
end;

%Normalize input if it needs to be normalized
if sum(mu) + sum(sigma) ~= 0
	for i = 1:length(mu)
		X(:,i+1) = (X(:,i+1) - mu(i)) / sigma(i);
	end;
	disp('X needed to be normalized!');
end;
	
% Calculate guesses/predictions
y = X * theta;

end
