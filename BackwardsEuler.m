function [y,x] = BackwardsEuler(funcDerivative,initialX, ...
                                    finalX, stepSize, initialY)
 y = zeros((finalX-initialX) / stepSize); 
    x = zeros((finalX-initialX) / stepSize); 
    for i = 1 : ((finalX-initialX) / stepSize)
       yNew = @(y) initialY - y + (stepSize * funcDerivative(y)); 
       y(i) = SecantMethod(yNew, initialX, finalX);
       x(i) = i * stepSize; 
       initialY = y(i);
    end
end

