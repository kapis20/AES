function [output] = conversion(input, enable)

    %Convert from 128-bit value to a 4x4 byte Matrix
    %or vice-versa depending on enable value
    %Used at both the beginning and the end of the AES Algorithm
    
    %Written by C Baldwin

    if enable == 0        
        
        %convert from 128-bit value to 4x4 byte Matrix
        output = [ uint8(hex2dec(input(1:2))),  uint8(hex2dec(input(9:10))),    uint8(hex2dec(input(17:18))),   uint8(hex2dec(input(25:26))); ...
                   uint8(hex2dec(input(3:4))),  uint8(hex2dec(input(11:12))),   uint8(hex2dec(input(19:20))),   uint8(hex2dec(input(27:28))); ...
                   uint8(hex2dec(input(5:6))),  uint8(hex2dec(input(13:14))),   uint8(hex2dec(input(21:22))),   uint8(hex2dec(input(29:30))); ...
                   uint8(hex2dec(input(7:8))),  uint8(hex2dec(input(15:16))),   uint8(hex2dec(input(23:24))),   uint8(hex2dec(input(31:32)))];

    elseif enable == 1
        
        %convert from 4x4 byte matrix to 128-bit value
        %has to be concatenated due to matlab restraints
        temp1 = strcat( dec2hex(input(1), 2), dec2hex(input(2), 2), dec2hex(input(3), 2), dec2hex(input(4), 2), dec2hex(input(5), 2), dec2hex(input(6), 2), dec2hex(input(7), 2), dec2hex(input(8), 2));
        temp2 = strcat( dec2hex(input(9), 2), dec2hex(input(10), 2), dec2hex(input(11), 2), dec2hex(input(12), 2), dec2hex(input(13), 2), dec2hex(input(14), 2), dec2hex(input(15), 2), dec2hex(input(16), 2));

        output = strcat(temp1, temp2);

    end

end