function product = multiplier(a,b)

%define case where one of the bytes are 0
if (a==0 || b == 0)
    product = 0;

%multiplication for non-zero cases
else
product = 0;

%convert b and product to uint16 because if a is 0xff, b will be left shifted 8 times.
b = uint16(b);
product = uint16(product);

%Since we right shift a every loop, this loop will continue until a = 0
while a~=0
    c = decimalToBinaryVector (a); 
    
    %check if LSB of a is 1. If it is then XOR will happen
    if c(end) == 1
        product = bitxor(product,b);
    end
    
    %right shift a (multiplier) and left shift b (multiplicand)
    a =  bitsra(a, 1);
    b = bitsll(b,1);
end

%polynomial reduction of the product
product = uint8(reduction(product));
end
end
    
        
        
    
    
    
