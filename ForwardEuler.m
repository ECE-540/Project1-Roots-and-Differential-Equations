function [y, x] = ForwardEuler(funcDerivative,initialX, ...
                                    finalX, stepSize, initialY)
% function [y, x] = ForwardEuler(funcDerivative, initialX, finalX, 
%                   stepSize, initialY
% This function is used to find the first order equation via the 
% ForwardEuler function. 
%
% Inputs: 
%   funcDerivative: This is the derivative of the function we are solving
%   initialX: This is our lower bound for the X axi
%   finalX: THis is the upper bound for the x axi
%   stepSize: This is the step size we are following for the function
%   initialY: This is the initial y value
% Ouputs: 
%   y: This is the matrix of y values found from the forward euler function
%   x: This is the matrix of x values found from the forward euler function

    y = zeros((finalX-initialX) / stepSize); %matrix of 0's for y values 
    x = zeros((finalX-initialX) / stepSize); %matrix of 0's for x values
    %while we have not reached our top value for the x range
    for i = 1 : ((finalX-initialX) / stepSize)
       % this is the calculation for the y value for each step 
       y(i) = initialY + (stepSize * funcDerivative(initialY)); 
       x(i) = i * stepSize; % this is the x value that goes with our y 
       initialY = y(i); % reassign the intial y to what was just found
    end % end for
end % end function

