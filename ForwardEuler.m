function [y, x] = ForwardEuler(funcDerivative,initialX, ...
                                    finalX, stepSize, initialY)
    y = zeros((finalX-initialX) / stepSize); 
    x = zeros((finalX-initialX) / stepSize); 
    for i = 1 : ((finalX-initialX) / stepSize)
       y(i) = initialY + (stepSize * funcDerivative(initialY)); 
       x(i) = i * stepSize; 
       initialY = y(i);
    end
end

