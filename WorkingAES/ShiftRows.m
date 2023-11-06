function [output] = ShiftRows(input)
    
    %Shifts the rows of the matrix by a pre-determined amount
    %Part of the encryption process
    
    %Written by C Baldwin

    output(1,:) = input(1,:);                       %Row 1
    output(2,:) = circshift(input(2,:), [0 -1]);    %Row 2
    output(3,:) = circshift(input(3,:), [0 -2]);    %Row 3
    output(4,:) = circshift(input(4,:), [0 -3]);    %Row 4

end

