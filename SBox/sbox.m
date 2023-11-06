function s_value = sbox(a)
%Function to generate the SBox 

%written by B K Teo

%calculate the inverse multiplicative of input
inv = uint8(invMult(a));
%assign the inverse as the original s value
s_value = inv;


%XOR the inverse with its left circular shifted copies (1,2,3,4 bits)
for i = 1:4
    bin_inv = dec2bin(inv, 8);
    shifted_inv = circshift(bin_inv, -i);
    shifted_inv = bin2dec(shifted_inv);
    s_value = bitxor(shifted_inv, s_value);
   
end

%XOR with constant 0x63       
s_value = bitxor(s_value, 99);