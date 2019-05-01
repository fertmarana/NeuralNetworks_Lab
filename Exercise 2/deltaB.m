function [db] = deltaB(learn_rate, error)
    db = learn_rate * -1 * error;
end