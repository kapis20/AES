function [output] = main(input, key, enable)
    
    %main function to decide control of the AES
    %input      Our main data that we want to encrypt/decrypt
    %key        What we use to let us encrypt/decrypt
    %enable     Tells the program if we want to encrypt/decrypt
    %           enable = 0: encrypt, enable = 1: decrypt    
    
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
        disp(state);

        for i = 1:9     
            %go through SubBytes, ShiftRows, MixColumns and AddRoundKey 9x
            state = SubBytes(state);
            disp(state);
            state = ShiftRows(state);
            disp(state);
            state = MixColumns(state);
            disp(state);
            state = AddRoundKey(state, roundKey(:,:,i));
            disp(state);
        end
        
        %final round without mix columns
        state = SubBytes(state);
        disp(state);
        state = ShiftRows (state);
        disp(state);
        state = AddRoundKey(state, roundKey(:,:,10));
        disp(state);
    
        output = conversion(state, 1);
        disp(output);
    
    %decryption
    elseif enable == 1
        disp("Decryption");

        %XOR the state with the original key
        state = AddRoundKey(state, roundKey(:,:,10));
        disp(state);

        for i = 9:-1:1
            %go through SubBytes, ShiftRows, MixColumns and AddRoundKey 9x
            state = InvShiftRows(state);
            disp(state);
            state = InvSubBytes(state);
            disp(state);
            state = AddRoundKey(state, roundKey(:,:,i));
            disp(state);
            state = InvMixColumns(state);
            disp(state);
        end
        
        %final round without mix columns
        state = InvShiftRows (state);
        disp(state);
        state = InvSubBytes(state);
        disp(state);
        state = AddRoundKey(state, cipher_key);
        disp(state);
    
        output = conversion(state, 1);
        disp(output);

    end

end