function result = reduction(x)

%if number of bits is <= 8, return original input
result = x;

%convert input to array of bits
bits = decimalToBinaryVector (x);
bit_num = length(bits);

%define reduction polynomial (100011011)
r_poly = 283;

temp = x;

while bit_num > 8 
    %get the first 9 bits of x
    msb = bitshift(temp, -(bit_num-9));
    temp_msb = bitxor(msb, r_poly);
    v = decimalToBinaryVector (temp);
    lsb = v(1, 10:end);
    %temp_lsb = num2str(lsb);
    temp_lsb = num2str(lsb);
    %temp_lsb = bin2dec(str_lsb);
    
    
    %concat
    %convert to decimal and then to string so string can be combined
    temp_msb = dec2bin(temp_msb);
     temp_msb = num2str(temp_msb);
    %combine MSB and LSB
    temp=(strcat(temp_msb,temp_lsb));
    % remove empty spaces to get right concat and number of bits
    temp=temp(find(~isspace(temp)));
 
    bit_num= length(temp);

    temp = bin2dec(temp);
    
  
    
end

result = temp;


    
    
    
    
    
    

    

    
     

    