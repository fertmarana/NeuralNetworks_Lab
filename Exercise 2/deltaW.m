function [dw] = deltaW(learn_rate, error, weights)
    dw = learn_rate * weights * error;
end