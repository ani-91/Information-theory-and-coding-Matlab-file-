% Define parameters
error_probability = 0.7; % (A.KARTHIK) Error probability of the binary symmetric channel
num_trials = 1000; % Number of trials for each number of transmitted digits
total_digits_range = 100:100:20000; % Total number of digits transmitted range

% Initialize arrays to store results
error_counts = zeros(size(total_digits_range));
error_ratios = zeros(size(total_digits_range));

% Simulation loop
for i = 1:length(total_digits_range)
    total_digits = total_digits_range(i);
    errors = 0;
    
    for j = 1:num_trials
        % Generate random binary sequence
        source_data = randi([0, 1], 1, total_digits);
        
        % Simulate binary symmetric channel
        received_data = xor(source_data, rand(1, total_digits) < error_probability);
        
        % Count errors
        errors = errors + sum(received_data ~= source_data);
    end
    
    % Calculate error ratio
    error_counts(i) = errors;
    error_ratios(i) = errors / (total_digits * num_trials);
end

% Plot results
figure;
subplot(2, 1, 1);
plot(total_digits_range, error_counts);
xlabel('Total number of digits transmitted');
ylabel('Number of digits received in error');
title('Number of digits received in error vs Total number of digits transmitted');

subplot(2, 1, 2);
plot(total_digits_range, error_ratios);
xlabel('Total number of digits transmitted');
ylabel('Error ratio');
title('Error ratio vs Total number of digits transmitted');