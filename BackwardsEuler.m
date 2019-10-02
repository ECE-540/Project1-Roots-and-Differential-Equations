function [y,x] = BackwardsEuler(funcDerivative,initialX, ...
                                    finalX, stepSize, initialY)
 y = zeros((finalX-initialX) / stepSize); 
    x = zeros((finalX-initialX) / stepSize); 
    for i = 1 : ((finalX-initialX) / stepSize)
       y(i) = initialY + (stepSize * SecantMethod(funcDerivative(initialY), 0, 5)); 
       x(i) = i * stepSize; 
       initialY = y(i);
    end
end

