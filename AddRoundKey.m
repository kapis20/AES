function [output] = AddRoundKey(input, key)
    
    %Executes a bitwise XOR operation to add the key to the input
    
    output = bitxor(key, input);

end