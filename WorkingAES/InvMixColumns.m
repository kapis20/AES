function [output] = InvMixColumns(input)

    %Used to inverse the effect of mixing the columns
    %Part of the decryption process
    
    %Written by C Baldwin

    %inverse mix matrix used to mix the columns back
    MixMat = uint8([0x0E 0x0B 0x0D 0x09; 0x09 0x0E 0x0B 0x0D; 0x0D 0x09 0x0E 0x0B; 0x0B 0x0D 0x09 0x0E]);

    %i controls the column of the input
    for i = 1:4

        %j controls the row of the mix matrix
        for j = 1:4

            %pre-define temp for each new row
            temp = 0;

            %k defines the mix matrix column as well as the input row
            for k = 1:4

                %multiply the values together and add (bitxor) them with
                %the current value held in temp
                mult = multiplier(MixMat(j,k), input(k,i));
                temp = bitxor(temp, mult);

            end

            %store the temp value in an array that will be filled with the
            %rest of the mixed values
            temp2(j, i) = temp;

        end
    end

    %send the final output back to the main function
    output = temp2;

end