function [output] = MixColumns(input)

    MixMat = uint8([0x02 0x03 0x01 0x01; 0x01 0x02 0x03 0x01; 0x01 0x01 0x02 0x03; 0x03 0x01 0x01 0x02]);

    for i = 1:4
        for j = 1:4
            temp = 0;
            for k = 1:4
                %multiplication here for MixMat and input
                %MixMat(j, k) and input(k, i)
                mult = multiplier(MixMat(j,k), input(k,i));
                %do bitxor with temp and multiplication product
                %save as temp
                temp = bitxor(temp, mult);
            end
            temp2(j, i) = temp;

        end
    end

    output = temp2;

end