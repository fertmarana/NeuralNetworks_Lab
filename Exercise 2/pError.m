function [error] = pError(t, o)
    error = sum(abs(t - o));
end