function result = reduction(x)

%if number of bits is <= 8, return original input

%written by B K Teo
result = x;

%find the initial number of bits
num_bits = length(dec2bin(result)); 

%reduction if number of bits is more than 8
while num_bits >8
    %define reduction polynomial (100011011)
    r_poly = 283;
    %determine how many bits the reduction polynomial needs to left shift
    %to match the number of bits of the input
    ls_bits = num_bits - 9;
    %left shift of reduction polynomial
    r_poly = bitsll(r_poly, ls_bits);
    %XOR the input and polynomial
    result = bitxor(result, r_poly);
    %Re-determine how many bits is the new value
    num_bits = length(dec2bin(result));
end
    
    
    
    
    

    

    
     

    