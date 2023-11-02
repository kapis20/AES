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
    
    %XOR the state with the original key
    state = AddRoundKey(state, cipher_key);
    
    
    %encryption
    if enable == 0 
        for i = 1:9       
            %go through subbytes, shiftrows, mixcolumns and addroundkey 9x
            state = SubBytes(state);
            state = ShiftRows(state);
            %t3 = MixColumns(st2);
            state = AddRoundKey(state, roundKey(:,:,1)); 
        end
        
        %final round without mix columns
        state = SubBytes(state);
        state = ShiftRows (state);
        state = AddRoundKey(state, roundKey(:,:,10)); 
    
        output = conversion(state, 1);
    
    %decription
    elseif enable == 1
        for i = 1:9
            %go through subbytes, shiftrows, mixcolumns and addroundkey 9x
            state = InvSubBytes(state);
            state = InvShiftRows(state);
            %t3 = MixColumns(st2);
            state = AddRoundKey(state, roundKey(:,:,(11-i))); 
        end
        
        %final round without mix columns
        state = InvSubBytes(state);
        state = InvShiftRows (state);
        state = AddRoundKey(state, roundKey(:,:,1)); 
    
        output = conversion(state, 1);
            
        

    end

end