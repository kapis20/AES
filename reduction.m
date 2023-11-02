function result = reduction(x)

%if number of bits is <= 8, return original input
result = x;

%convert input to array of bits
bits = decimalToBinaryVector (x);
num = length(bits);

%define reduction polynomial (100011011)
r_poly = 283;

temp = x;

while num > 8 
    %get the first 9 bits of x
    msb = bitshift(temp, -(num-9));
    temp_msb = bitxor(msb, r_poly);
    v = decimalToBinaryVector (temp);
    lsb = v(1, 10:end);
    str_lsb = num2str(lsb);
    temp_lsb = bin2dec(str_lsb);
    
    %concat
    temp_msb = dec2bin(temp_msb);
    temp_lsb = dec2bin(temp_lsb);
    temp = strcat(temp_msb,temp_lsb);
    temp = bin2dec(temp);
    
    %reevaluate num
    num = length(temp);
    
end

result = temp;


    
    
    
    
    
    

    

    
     

    