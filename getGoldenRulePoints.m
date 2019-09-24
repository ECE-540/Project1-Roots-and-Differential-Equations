function [lowerX,upperX] = GetGoldenRulePoints(lowerBound,upperBound)
%
% [lowerX, upperX] = GetGoldenRulePoints(lowerBound, upperBound)
%
% This is a function used to get the starting x values for the golden rule 
% search. It will return these two x values. 
% Input: 
%   lowerBound: This is the lower bracket of our search
%   upperBound: This is the upper bracket of our search
% Outuput:
%   lowerX: This is the lower x value for the start of our search
%   upperX: This is the upper x value for the search. 

lowerX = upperBound - ((1.618 - 1) * (upperBound - lowerBound)); % Calculates our lower x value
upperX = lowerBound + ((1.618 - 1) * (upperBound - lowerBound)); % Calculates our upper x value
end % end function

