% mlp.m Implementation of the Multi-Layer Perceptron

clear all
close all

examples = [0 0;1 0;0 1;1 1];
goal = [0.01 0.99 0.99 0.01]';

% Boolean for plotting the animation
plot_animation = true;


% Parameters for the network
learn_rate = 0.2;               % learning rate
max_epoch = 5000;              % maximum number of epochs

mean_weight = 0;
weight_spread = 1;

n_input = size(examples,2);
n_hidden = 20;
n_output = size(goal,2);

% Noise level at the input
noise_level = 0.05;

% Activation of the bias node
bias_value = -1;


% Initializing the weights
w_hidden = rand(n_input + 1, n_hidden) .* weight_spread - weight_spread/2 + mean_weight;
w_output = rand(n_hidden, n_output) .* weight_spread - weight_spread/2 + mean_weight;

% Start training
stop_criterium = 0;
epoch = 0;
min_error = 0.01;

while ~stop_criterium
    epoch = epoch + 1;
    
    % Add noise to the input data.
    noise = randn(size(examples)) .* noise_level;
    input_data = examples + noise;
    
    % Append bias to input data
    input_data(:,n_input+1) = ones(size(examples,1),1) .* bias_value;
    
    epoch_error = 0;
    epoch_delta_hidden = 0;
    epoch_delta_output = 0;
    
   
    
    % FROM HEREON YOU NEED TO MODIFY THE CODE!
    for pattern = 1:size(input_data,1)
        
        % Compute the activation in the hidden layer
        hidden_activation = input_data(pattern,:) * w_hidden ;
        
        % Compute the output of the hidden layer (don't modify this)
        hidden_output = sigmoid(hidden_activation);
        
        % Compute the activation of the output neurons
        %not sure
        output_activation = hidden_output * w_output ;
        
        % Compute the output
        output = output_function(output_activation);
        
        % Compute the error on the output
        output_error = (output - goal(pattern));
        
        % Compute local gradient of output layer
        local_gradient_output = d_sigmoid(output_activation).*(goal(pattern) -output);
        
        
        % Compute the error on the hidden layer (backpropagate)
        hidden_error = 0 ;
        
        % Compute local gradient of hidden layer
        local_gradient_hidden = d_output_function(hidden_activation) .* (local_gradient_output * transpose( w_output));
              
        % Compute the delta rule for the output
        delta_output = learn_rate * transpose( hidden_output) * local_gradient_output  ;
        
        % Compute the delta rule for the hidden units;
        delta_hidden =  learn_rate * transpose(input_data(pattern,:)) * local_gradient_hidden  ;
        
        % Update the weight matrices
        w_hidden = upW(w_hidden, delta_hidden);
        w_output = upW(w_output , delta_output);
        
        % Store data
        epoch_error = epoch_error + (output_error).^2;       
        epoch_delta_output = epoch_delta_output + sum(sum(abs(delta_output)));
        epoch_delta_hidden = epoch_delta_hidden + sum(sum(abs(delta_hidden)));
    end

    
    
    % Log data
    
    h_error(epoch) = sum(epoch_error) / size(input_data,1);
    log_delta_output(epoch) = epoch_delta_output;
    log_delta_hidden(epoch) = epoch_delta_hidden;
    
    % Check whether maximum number of epochs is reached
    
    
    % Implement a stop criterion here
    if h_error(epoch) < min_error
       
        stop_criterium = 1;
    end
    
    % Plot the animation
    if and((mod(epoch,20)==0),(plot_animation))
        emp_output = zeros(21,21);
        figure(1)
        for x1 = 1:21
            for x2 =  1:21
                hidden_act = sigmoid([(x1/20 - 0.05) (x2/20 -0.05) bias_value] * w_hidden);
                emp_output(x1,x2) = output_function(hidden_act * w_output);
            end
        end
        surf(0:0.05:1,0:0.05:1,emp_output) 
        title(['Network epoch no: ' num2str(epoch)]);
        xlabel('input 1: (0 to 1 step 0.05)')
        ylabel('input 2: (0 to 1 step 0.05)')
        zlabel('Output of network')
        zlim([0 1])        
        pause(0.01)
    end

end

% Plotting the error
figure(2)
plot(1:epoch,h_error)
title('Mean squared error vs epoch');
xlabel('Epoch no.');
ylabel('MSE');

% Add additional plot functions here (optional)
