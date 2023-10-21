%Input plain message 

state = [0x01 0x02 0x03 0x04;...   
         0x05 0x05 0x06 0x07;... 
         0x08 0x09 0xA 0xB;...
         0xC 0xD 0xE 0xF
         ];


    n = length(state);

    % Data Acqusition toolbox for binary, hex operations is needed 
    for row = 1:n
    %matricex indexing(row,col)
        for col= 1:n
        val = state(row,col);
        %shift the bits four position to the right
        row1 = bitshift(val, -4);
        %col1 = bitshift(val,4);
        col1 = bitand(val,0x0F);
        hexString = dec2hex(val, 2);  % Convert to a two-character hex string
        disp(hexString);
        binValL = hexToBinaryVector(hexString,8);
        disp(binValL);
        
        disp(['First shifted value is:', dec2bin(row1)]);
        
        disp(['Second shifted value is: ', dec2bin(col1)]);
       
        end
    
    end