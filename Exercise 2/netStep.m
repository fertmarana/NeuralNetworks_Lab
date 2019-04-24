function [weights, threshold, error] = netStep(learn_rate, weights, threshold, x, t)

        % Initialize weighted sum of inputs
        summed_input = 0;

        % Subtract threshold from weighted sum

        % Compute output
        output = 0;

        % Compute error
        error = 0;

        % Compute perceptron rule
        delta_weights = 0;
        delta_threshold = 0;

        % Update weights and threshold
        weights = 0;
        threshold = 0;

end