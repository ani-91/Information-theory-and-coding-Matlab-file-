% Decimal number to convert
decimal_number = 2145; % Last digits of the ID

% Convert decimal to binary string with leading zeros to make it 12 bits
binary_string = dec2bin(decimal_number, 12);

% Take the first 4 bits from the MSB to form three rows for the transpose of the parity matrix
parity_matrix_transpose = zeros(3, 4);
for i = 1:3
    parity_matrix_transpose(i, :) = binary_string(1+(i-1)*4 : i*4) - 48;
end

% Append a 3x3 identity matrix to the end of the transpose of the parity matrix
H = [parity_matrix_transpose, eye(3)];

%The Generator Matrix
G = [eye(4),transpose(parity_matrix_transpose)];

% Display the parity check matrix
disp('Parity check matrix H:');
disp(H);

% Display the Generator matrix
disp('Generator matrix G:');
disp(G);

% Take the last 4 bits as the information bits
information_bits = binary_string(end-3:end);

% Display the information bits
disp('Information bits:');
disp(information_bits);

% Generate U data vector denoting all information sequences
U_data_vector = zeros(16, 4); % 16 possible information sequences of 4 bits each
for i = 1:16
    U_data_vector(i, :) = dec2bin(i-1, 4) - '0'; % Convert decimal to binary and store as row in U_data_vector
end

% Display U data vector
disp('U data vector:');
disp(U_data_vector);

% Iterate through an unit-spaced vector
unit_spaced_vector = 0:15; % Unit-spaced vector from 0 to 15
for i = 1:length(unit_spaced_vector)
    disp(['Unit-spaced vector element ', num2str(i), ': ', num2str(unit_spaced_vector(i))]);
end

% Generate codewords by multiplying each information sequence by the generator matrix
codewords = mod(U_data_vector * G, 2);

% Calculate the minimum distance between codewords
min_distance = 8; 
for i = 1:length(codewords)
    a = sum(codewords(i,:)); % Sum the elements in the i-th row
    if(a ~= 0 && a < min_distance)
        min_distance = a;
    end
end

% Display the codewords and minimum distance
disp('Codewords:');
disp(codewords);
disp(['Minimum distance: ', num2str(min_distance)]);

% Calculate the syndrome vector by multiplying the received vector with H^T
syndrome_vector = mod(codewords * H', 2);

% Display the syndrome vector
disp('Syndrome vector:');
disp(syndrome_vector);

%Generate the transmitted codeword
transmitted = mod(information_bits * G, 2);
% Display the syndrome vector
disp('Transmitted vector:');
disp(transmitted);

R1 = transmitted;
syndrome1 = mod(R1 * H', 2);
% Display the syndrome vector
disp('Syndrome if Received is same as Transmitted:');
disp(syndrome1);

% Calculate the MSB
f = decimal_number/1000;
f = 1000*(f - floor(f));
i = 2;
while i > 0
    f = floor(f / 10);
    i = i - 1;
end
if(f == 8 || f == 9 || f == 0)
    f = 1;
end
flip_position = length(transmitted) - 7 + f; % Position to flip (3rd bit from the right)

% Flip the 4th bit from the right of T
R2 = transmitted;
R2(flip_position) = mod(transmitted(flip_position) + 1, 2); % Flip the bit
% Display the syndrome vector
disp('Receieved vector:');
disp(R2);

syndrome2 = mod(R2 * H', 2);
% Display the syndrome vector
disp('Syndrome for the Received Vector:');
disp(syndrome2);