function state = InvSubBytes_fly(state)
%The inverse SubBytes function that subsitutes each byte in the encrypted
%message state with a corresponding byte from the inverse AES S-box 
%The inverse S box is generated in seperate function
%Input: state (encrypted message), Output: state (decrypted message)

%written by K Sikorski

 %need to iterate through state 
 n = length(state);
    for row = 1:n
    %matricex indexing(row,col)
        for col= 1:n
        
        %get a message from Sbox 
        state(row,col) = inv_sbox(state(row,col));
       
        end
    end
end