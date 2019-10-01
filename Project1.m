% Project 1 
% Author: Parker Lange

% Problem 1
[lowerX0, upperX0] = GetGoldenRulePoints(5, 7); % base function call with bounds of 5 and 7
[lowerX1, upperX1] = GetGoldenRulePoints(lowerX0, 7); % second function call, throwing out the left region
[lowerX2, upperX2] = GetGoldenRulePoints(lowerX0, upperX1); % third function call, throwing out right region
% the final bounds after throwing out the final left region are lowerX2, and upperX1

% Problem 2
% func is the function used in 2a
func = @(x) x^10 - (10 * (x^5)) + (0.5 * exp(x)) - 0.45;
% derivativeFunc is the derivative of func
derivativeFunc = @(x) (10 * x^9) - (50 * (x^4)) + (0.5 * exp(x)); 
guessValue = linspace(-3, 3, 400); % 400 guesses from -3 to 3
root = linspace(1, 400, 1); % 400 space vector filled with guesses

% i is a value used for indexing root 
% fill each spot of root with the root guess 
% from the function call to newton raphson
for i = 1:400
    root(i) = NewtonRaphson(guessValue(i), func, derivativeFunc); 
end % end for 

% this is the graph of the roots found vs the interval given
figure(1)
plot(guessValue, root); 
title('Roots Found Vs Range of Numbers');
ylabel('Roots found');
xlabel('Range of Numbers');

hold on

% Bisection function call. Bracket of [1,3] and an error of 1e-10. 
[bisecIterations, biSecVal] = Bisection(func, 1, 2, 1e-10); 
% N-R call, we pass in the function, its derivative, the error, and guess
% we set the guess value to 3, to make the comparison fair. 
[rootValue, iterationsValue] = NewtonRaphson(2, func, derivativeFunc, 1e-10); 

% Problem 3
% jagged but becomes stable
funcDerivate = @(y) -8 * y; 
[x, y] = ForwardEuler(funcDerivate, 0, 10, .2, 10); 
figure(2)
title('Forward Euler with step size of 0.2');
ylabel('Y values');
xlabel('X values');
plot(y, x);

hold on

% not stable, bounces from 10 to -10
[x, y] = ForwardEuler(funcDerivate, 0, 10, .25, 10); 
figure(3)
title('Forward Euler with step size of 0.25');
ylabel('Y values');
xlabel('X values');
plot(y, x);

hold on

% stable, goes to 0 nicely
[x, y] = ForwardEuler(funcDerivate, 0, 10, .01, 10); 
figure(4)
title('Forward Euler with step size of 0.01');
ylabel('Y values');
xlabel('X values');
plot(y, x);