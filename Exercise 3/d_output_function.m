%this functions calculates the differential of the sigmoid of the output
function [output] = d_output_function(x)
  temp = sigmoid(x);
  output = temp .* (1 - temp);

end