function inv_m = invMult(a)

%written by B K Teo

a = uint8(a);

%if input is 0, then output should be 0. No inverse
if a == 0
    inv_m = 0;
else
    %brute-force search for the inverse
    for i = 1:255
        mult = multiplier (a, i);
        if mult == 1
            inv_m = i;
        end
    end
end

