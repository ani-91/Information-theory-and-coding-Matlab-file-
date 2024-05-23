clc
clear all
input_sequence = 'ANISE';
probabilities = [0.3, 0.2, 0.1, 0.25, 0.15];
[symbols_sorted, idx] = sort('ANISE');

probabilities_sorted = probabilities(idx);
cumulative_probs_array = zeros(1, 5);


num_symbols = length(probabilities);
subranges = cell(1, num_symbols);
cumulative_prob = 0;
for i = 1:num_symbols
    symbol = symbols_sorted(i);
    prob = probabilities_sorted(i);
    subranges{i} = [cumulative_prob, cumulative_prob + prob];
    cumulative_prob = cumulative_prob + prob;
    cumulative_probs_array(i) = cumulative_prob;
end

lower_range = 0; upper_range = 1; 

for i = 1:length(input_sequence)
    cumulative_prob = 0;
    symbol = input_sequence(i);
    symbol_idx = find(symbols_sorted == symbol); 
    subrange = subranges{symbol_idx};
    lower_range = subrange(1);
    upper_range = subrange(2);
    range_width = upper_range - lower_range;
    
    subranges{1} = [lower_range, lower_range+(range_width*cumulative_probs_array(1))];
    subranges{2} = [lower_range+(range_width*cumulative_probs_array(1)), lower_range+(range_width*cumulative_probs_array(2))];
    subranges{3} = [lower_range+(range_width*cumulative_probs_array(2)), lower_range+(range_width*cumulative_probs_array(3))];
    subranges{4} = [lower_range+(range_width*cumulative_probs_array(3)), lower_range+(range_width*cumulative_probs_array(4))];
    subranges{5} = [lower_range+(range_width*cumulative_probs_array(4)), upper_range];
end

tag = (lower_range + upper_range) / 2;
disp(['Tag value for input sequence: ', num2str(tag)]);
