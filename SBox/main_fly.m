function [output] = main_fly(input, key, enable)
    
    %Main function to decide control of the AES
    %input      Our main data that we want to encrypt/decrypt
    %key        What we use to let us encrypt/decrypt
    %enable     Tells the program if we want to encrypt/decrypt
    %           enable = 0: encrypt, enable = 1: decrypt
    
    %Written by C Baldwin
    
    %converting input to state
    state = conversion(input, 0);
    %convert key to 4x4 matrix
    cipher_key = conversion(key, 0);
    
    %generate roundkeys
    roundKey = getRoundKey(cipher_key);

    %encryption
    if enable == 0
        disp("Encryption");

        %XOR the state with the original key
        state = AddRoundKey(state, cipher_key);

        for i = 1:9     
            %go through SubBytes, ShiftRows, MixColumns and AddRoundKey 9x
            state = SubBytes_fly(state);
            state = ShiftRows(state);
            state = MixColumns(state);
            state = AddRoundKey(state, roundKey(:,:,i));
        end
        
        %final round without mix columns
        state = SubBytes_fly(state);
        state = ShiftRows(state);
        state = AddRoundKey(state, roundKey(:,:,10));    
        output = conversion(state, 1);

    %decryption
    elseif enable == 1
        disp("Decryption");

        %XOR the state with the original key
        state = AddRoundKey(state, roundKey(:,:,10));

        for i = 9:-1:1
            %go through SubBytes, ShiftRows, MixColumns and AddRoundKey 9x
            state = InvShiftRows(state);
            state = InvSubBytes_fly(state);
            state = AddRoundKey(state, roundKey(:,:,i));
            state = InvMixColumns(state);
        end
        
        %final round without mix columns
        state = InvShiftRows(state);
        state = InvSubBytes_fly(state);
        state = AddRoundKey(state, cipher_key);
        output = conversion(state, 1);

    else
        disp("Error. Enable value must be either 0 or 1.")
    end

end