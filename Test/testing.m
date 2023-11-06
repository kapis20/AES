input1 =    '0849C3C1330337A9489B99082E20BA8B';
input2 =    'F81BBB3F2C7794843109BDBDEE6A64E5';
input3 =    'EB8625AEE27A078CD3A074FA1B7D0B2D';

key1 =      'A4F13C6860DB2535164FDF944C8D3D8A';
key2 =      'B588643D0A71BD7BC4AA7935465526E6';
key3 =      'F949F66EFC02A0138F7ADD49A97CA3BC';

encrypt1 = main_fly(input1, key1, 0);
disp(encrypt1);
output1 = main_fly(encrypt1, key1, 1);
disp(output1);

encrypt2 = main_fly(input2, key2, 0);
disp(encrypt2);
output2 = main_fly(encrypt2, key2, 1);
disp(output2);

encrypt3 = main_fly(input3, key3, 0);
disp(encrypt3);
output3 = main_fly(encrypt3, key3, 1);
disp(output3);