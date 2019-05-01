function [weights, threshold, error] = netStep(learn_rate, weights, threshold, x, t)

        % Initialize weighted sum of inputs
        summed_input = summedInput(x, weights, threshold);

        % Subtract threshold from weighted sum
        % - This is done in the summedInput function

        % Compute output
        output = stepA(summed_input);

        % Compute error
        error = pError(t, output);

        % Compute perceptron rule
        delta_weights = deltaW(learn_rate, error, weights);
        delta_threshold = deltaB(learn_rate, error);

        % Update weights and threshold
        weights = upW(weights, delta_weights);
        threshold = upB(threshold, delta_threshold);

end