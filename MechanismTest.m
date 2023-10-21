
%message
state = [0x22 0x32 0xA3 0xE4;...   
         0xC5 0xB5 0xF6 0xE7;... 
         0xD8 0xD9 0xA 0xB2;...
         0x1C 0x1D 0x3E 0x2F
         ];

disp('Original State:');
disp(state);
state = SubBytes(state);
disp('SubBytes State:');
disp(state);
state = InvSubBytes(state);
disp('InvSubBytes State:');
disp(state);