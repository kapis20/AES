function [output] = AddRoundKey(input, key)
    
    %Executes a bitwise XOR operation to add the key to the input
    %Used multiple times as part of both the encryption and decryption
    %processes
    
    %Written by C Baldwin

    output = bitxor(key, input);

end