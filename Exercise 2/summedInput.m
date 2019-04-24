function [weightedSum] = summedInput(x, W, b)
    weightedSum = sum([x -1] .* [W b]);
end