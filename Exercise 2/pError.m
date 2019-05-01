function [error] = pError(t, o)
    error = sum(t - o);
end