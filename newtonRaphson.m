function [rootLoc,numIterations] = newtonRaphson(initialGuess,func, ...
                                   funcDerivative, aoe, maxIterations)
% 
% function [rootLoc,numIterations] = newtonRaphson(initialGuess,func, ...
%                                    funcDerivative, aoe, maxIterations)
%
% This is a function using the newton raphson method to calculate a root
% This calculation is done based on the func, and funcDerivative
% Inputs: 
%   initalGuess: This is our initial guess for the root of the function
%   func: This is the function we are evaluating at
%   funcDerivative: This is the derivative of the function used
%   aoe: This is our desired margin of error. Once we reach this we are done
%   maxIterations: This is the maximum number of times we want to loop
%                  through this function, searching for a root
% Outputs:
%   rootLoc: This is our location of the root of the func
%   numIterations: This is the number of iterations taken to find root

if (nargin < 4 || isempty(maxIterations))
    maxIterations = 100;
end 

if (nargin < 5 || isempty(aoe))
    aoe = 1e-6; 
end

numIterations = 0; 
initialGuess = initialGuess; 
y0 = func(initialGuess); 
y0Prime = funcDerivative(initialGuess); 
relativeChange = abs(aoe) * 100; 

while ((relativeChange > errTol) && (iterations < maxIterations))
    numIterations = numIterations + 1; 
    newPointX = initialGuess - (y0 / y0Prime);
    relativeChange = abs((newPointX - initialGuess) / newPointX); 
        
    initialGuess = xGuess; 
    y0 = func(initialGuess); 
    y0Prime = funcDerivative(initialGuess); 
end

rootLoc = initialGuess; 
