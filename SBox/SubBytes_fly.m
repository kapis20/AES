function state = SubBytes_fly(state)
%SUBBYTES function substitutes each byte of the message in state to the
%corresponding byte from the AES S-box, which is generated in separate function.
%Input: state (message) Output state (encrypted message) 

% written by K Sikorski

 %need to iterate through state 
 n = size(state);

for row = 1:n(1)
    %matricex indexing(row,col)
        for col= 1:n(2)

        %get a message from Sbox function. Call it and generate the
        %corresponding output 
        state(row,col) = sbox(state(row, col));
       
        end
end
