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
funcDerivate = @(y) -8 * y; % function definition
% call to forward euler to get x and y values
[x, y] = ForwardEuler(funcDerivate, 0, 10, .2, 10); 
figure(2)
plot(y, x);
title('Forward Euler with step size of 0.2');
ylabel('Y range');
xlabel('X range');

% not stable, bounces from 10 to -10
% call to Forward Euler to get x and y values for the new step size
[x, y] = ForwardEuler(funcDerivate, 0, 10, .25, 10); 
figure(3)
plot(y, x);
title('Forward Euler with step size of 0.25');
ylabel('Y range');
xlabel('X range');

% stable, goes to 0 nicely
% call to forward euler to get the new x and y values for the last step
% size
[x, y] = ForwardEuler(funcDerivate, 0, 10, .01, 10); 
figure(4)
plot(y, x);
title('Forward Euler with step size of 0.01');
ylabel('Y range');
xlabel('X range');

% 0.2 step size
[x, y] = BackwardsEuler(funcDerivate, 0, 10, 0.20, 10); % backwards euler func call
figure(5)
plot(y, x);
title('Backwards Euler with step size of 0.20');
ylabel('Y range');
xlabel('X range');

% 0.25 step size for the backwards euler function call
[x, y] = BackwardsEuler(funcDerivate, 0, 10, 0.25, 10);
figure(6)
plot(y, x);
title('Backwards Euler with step size of 0.25');
ylabel('Y range');
xlabel('X range');

% 0.1 step size for the backwards euler function call
[x, y] = BackwardsEuler(funcDerivate, 0, 10, 0.10, 10);
figure(7)
plot(y, x);
title('Backwards Euler with step size of 0.10');
ylabel('Y range');
xlabel('X range');

%time calculation for the forward euler function
tic 
[x, y] = ForwardEuler(funcDerivate, 0, 10, .2, 10); 
toc

%time calculation for the backwards euler function
tic
[x, y] = BackwardsEuler(funcDerivate, 0, 10, 0.20, 10);
toc
