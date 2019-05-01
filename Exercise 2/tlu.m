% TLU implementation
% Put your names here

% Parameters
learn_rate = 0.1;    % the learning rate
n_epochs = 20;      % the number of epochs we want to train

% Define the inputs
examplesInput = examplesA()

% Define the corresponding target outputs
goal = goalAND()

% Initialize the weights and the threshold
weights = [initW() initW()];
threshold = initB();

% Preallocate vectors for efficiency. They are used to log your data
% The 'h' is for history
h_error = zeros(n_epochs,1);
h_weights = zeros(n_epochs,2);
h_threshold = zeros(n_epochs,1);

% Store number of examples and number of inputs per example
n_examples = size(examplesInput,1);     % The number of input patterns
n_inputs = size(examplesInput,2);       % The number of inputs

for epoch = 1:n_epochs
    epoch_error = zeros(n_examples,1);

    h_weights(epoch,:) = weights;
    h_threshold(epoch) = threshold;

    for pattern = 1:n_examples

        [weights, threshold, error] = netStep(learn_rate, weights, threshold, examplesInput(pattern, :), goal(pattern));

    	% Store squared error
        epoch_error(pattern) = error.^2;

    end

    h_error(epoch) = sum(epoch_error);
end

% Plot functions
figure(1);
plot(h_error)
title('\textbf{TLU-error over epochs}', 'interpreter', 'latex', 'fontsize', 12);
xlabel('\# of epochs', 'interpreter', 'latex', 'fontsize', 12)
ylabel('Summed Squared Error', 'interpreter', 'latex', 'fontsize', 12)

figure(2);
plot(1:n_epochs,h_weights(:,1),'r-','DisplayName','weight 1')
hold on
plot(1:n_epochs,h_weights(:,2),'b-','DisplayName','weight 2')
plot(1:n_epochs,h_threshold,'k-','DisplayName','threshold')
xlabel('\# of epochs', 'interpreter', 'latex', 'fontsize', 12)
title('\textbf{Weight vector and threshold vs epochs}', 'interpreter', 'latex', 'fontsize', 12);
h = legend('location','NorthEast');
set(h, 'interpreter', 'latex', 'fontsize', 12);
hold off
