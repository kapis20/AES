function round_key = getRoundKey(o_key)

%define round constant
r_con = [0x01 0x02 0x04 0x08 0x10 0x20 0x40 0x80 0x1b 0x36; 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00; 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00;];
r_con = double(r_con);

%define number of round keys to be generated
num_of_keys = 10;

%initialise round key matrix to store all the round keys generated
r_key = zeros(4,(num_of_keys*4)+4);


%copy original key to the first 4 columns in round key matrix
r_key(1:4, 1:4) = o_key;


%generate round key matrix
for i = 1:num_of_keys
    
    %generate the first column of each round key
    col = (i*4) +1; 
    rot_word = r_key(:, (col-1));
    rot_word = circshift(rot_word, -1);
    rot_word = SubBytes(rot_word);
    rot_word = bitxor (rot_word, r_key(:, (col-4)));
    r_key(:,col) = bitxor(rot_word, r_con(:,i));    
    
    %generate column 2,3,4 of each round key which only involves XOR
    %operation
    r_key(:, col+1) = bitxor(r_key(:, col), r_key(:, (col-3)));
    r_key(:, col+2) = bitxor(r_key(:, (col+1)), r_key(:, (col-2)));
    r_key(:, col+3) = bitxor(r_key(:, (col+2)), r_key(:, (col-1)));
    
end

%seperate the keys from the matrix and generate an array of round keys
for j = 1:num_of_keys
    
    round_key(:,:,j) = uint8(r_key(:, (j*4)+1 : (j*4) +4 ));
    
end

end
