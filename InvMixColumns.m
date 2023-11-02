function [output] = InvMixColumns(input)

    MixMat = uint8([0x0E 0x0B 0x0D 0x09; 0x09 0x0E 0x0B 0x0D; 0x0D 0x09 0x0E 0x0B; 0x0B 0x0D 0x09 0x0E]);

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