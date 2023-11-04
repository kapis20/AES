function s_value = inv_sbox(input)

%convert input to decimal and fix it to 8 bits for circular shift
input_bin = dec2bin(input, 8);

%calculate left circular shift of 1,3,6 bits
shift1 = bin2dec(circshift(input_bin, -1));
shift3 = bin2dec(circshift(input_bin, -3));
shift6 = bin2dec(circshift(input_bin, -6));

%XOR the circular shifts together
s_value = bitxor(shift1, shift3);
s_value = bitxor(s_value, shift6);

%XOR with a constant 0x5
s_value = bitxor(s_value, 5);

%find the inverse multiplicative      
s_value = invMult(s_value);