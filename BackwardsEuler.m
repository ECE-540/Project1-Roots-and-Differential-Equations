function [y,x] = BackwardsEuler(funcDerivative,initialX, ...
                                    finalX, stepSize, initialY)
% function [y, x] = BackwardsEuler(funcDerivative, initialX, finalX,
%                                   stepsize, initialY
% This is the function for Backwards Euler. This is a first order root 
% finding method. 
%
% Inputs: 
%   funcDerivative: Derivative of the input function
%   initialX: This is the lower x bound
%   finalX: This is our upper x bound
%   stepSize: This is our steps we take all the way up to finalX
%   initialY: This is our initial condition for the y value

    y = zeros((finalX-initialX) / stepSize); % y matrix is initialized
    x = zeros((finalX-initialX) / stepSize); % x matrix is initialized
    % while we have not reached upper x going up one step at a time
    for i = 1 : ((finalX-initialX) / stepSize)
        % function handle for the y i+1
        % we pass in the funcDerivative and solve for y 
        yNew = @(y) initialY - y + (stepSize * funcDerivative(y)); 
        % We pass this function into the secant method to find our root
        % which gives us the y i + 1 value. 
        y(i) = SecantMethod(yNew, initialX, finalX);
        % add the x value to our matrix
        x(i) = i * stepSize; 
        % update our y i+1 to be our old y and repeat
        initialY = y(i);
    end % end for 
end % end function

