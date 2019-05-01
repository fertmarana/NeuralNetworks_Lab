function [weightedSum] = summedInput(x, weights, threshold)
    weightedSum = sum([x -1] .* [weights threshold]);
end