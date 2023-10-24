function [output] = conversion(input, enable)

    %Convert from 128-bit value to a 4x4 byte Matrix
    %or vice-versa depending on enable value

    if enable == 1
        %convert from 128-bit value to 4x4 byte Matrix

        output = [ uint8(bin2dec(input(1:8))),      uint8(bin2dec(input(9:16))),        uint8(bin2dec(input(17:24))),       uint8(bin2dec(input(25:32))); ...
                   uint8(bin2dec(input(33:40))),    uint8(bin2dec(input(41:48))),       uint8(bin2dec(input(49:56))),       uint8(bin2dec(input(57:64))); ...
                   uint8(bin2dec(input(65:72))),    uint8(bin2dec(input(73:80))),       uint8(bin2dec(input(81:88))),       uint8(bin2dec(input(89:96))); ...
                   uint8(bin2dec(input(97:104))),   uint8(bin2dec(input(105:112))),     uint8(bin2dec(input(113:120))),     uint8(bin2dec(input(121:128)))];

    elseif enable == 0
        %convert from 4x4 byte matrix to 128-bit value

        temp1 = strcat( dec2bin(input(1), 8), dec2bin(input(5), 8), dec2bin(input(9), 8), dec2bin(input(13), 8), dec2bin(input(2), 8), dec2bin(input(6), 8), dec2bin(input(10), 8), dec2bin(input(14), 8));
        temp2 = strcat( dec2bin(input(3), 8), dec2bin(input(7), 8), dec2bin(input(11), 8), dec2bin(input(15), 8), dec2bin(input(4), 8), dec2bin(input(8), 8), dec2bin(input(12), 8), dec2bin(input(16), 8));

        output = strcat(temp1, temp2);

    end

end