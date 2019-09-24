% Project 1 
% Author: Parker Lange

% Problem 1
[lowerX0, upperX0] = getGoldenRulePoints(5, 7); 
[lowerX1, upperX1] = getGoldenRulePoints(lowerX0, 7); 
[lowerX2, upperX2] = getGoldenRulePoints(lowerX0, upperX1);
[lowerX3, upperX3] = getGoldenRulePoints(lowerX2, upperX1); 

% Problem 2
func = @(x) x^10 - (10 * (x^5)) + (0.5 * (e^x)) - 0.45;
derivFunc = @(x) (10 * x^9) - (50 * (x^4)) + (0.5 * (e^x)); 