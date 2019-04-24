function [weightedSum] = summedInput(x, W, b)
    weightedSum = 0;
    for i = 1 : length(x)
        weightedSum = weightedSum + x(i) * W(i);
    end
    % Do we just return the sum or do we apply bias somehow?
end