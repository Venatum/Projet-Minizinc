% lines from bottom left to top right

predicate operation(string: operator, var 0..9: x1, var 0..9: x2, var 0..90: x3) =
    (operator = "+" /\ x1 + x2 = x3) \/
    (operator = "-" /\ x1 - x2 = x3) \/
    (operator = "*" /\ x1 * x2 = x3) \/
    (operator = "/" /\ x1 / x2 = x3);

array[1..44] of var 0..9: numbers;
array[1..20] of string: operators;

constraint operation(operators[1], numbers[1], numbers[2], numbers[3]);
constraint operation(operators[2], numbers[4], numbers[5], numbers[6]);

constraint operation(operators[3], numbers[12], numbers[13], numbers[14]);

constraint operation(operators[4], numbers[16], numbers[11], numbers[7] * 10 + numbers[1]);
constraint operation(operators[5], numbers[18], numbers[12], numbers[8] * 10 + numbers[3]);
constraint operation(operators[6], numbers[19], numbers[14], numbers[9] * 10 + numbers[4]);
constraint operation(operators[7], numbers[21], numbers[15], numbers[10] * 10 + numbers[6]);

constraint operation(operators[8], numbers[16], numbers[17], numbers[18]);
constraint operation(operators[9], numbers[19], numbers[20], numbers[21]);

constraint operation(operators[10], numbers[25], numbers[22], numbers[17]);
constraint operation(operators[11], numbers[28], numbers[23], numbers[20]);

constraint operation(operators[12], numbers[24], numbers[25], numbers[26]);
constraint operation(operators[13], numbers[27], numbers[28], numbers[29]);

constraint operation(operators[14], numbers[35], numbers[36], numbers[37]);

constraint operation(operators[15], numbers[39], numbers[34], numbers[30] * 10 + numbers[24]);
constraint operation(operators[16], numbers[41], numbers[35], numbers[31] * 10 + numbers[26]);
constraint operation(operators[17], numbers[42], numbers[37], numbers[32] * 10 + numbers[27]);
constraint operation(operators[18], numbers[44], numbers[38], numbers[33] * 10 + numbers[29]);

constraint operation(operators[19], numbers[39], numbers[40], numbers[41]);
constraint operation(operators[20], numbers[42], numbers[43], numbers[44]);

% tens numbers cannot be equal to 0
constraint numbers[7] > 0;
constraint numbers[8] > 0;
constraint numbers[9] > 0;
constraint numbers[10] > 0;
constraint numbers[30] > 0;
constraint numbers[31] > 0;
constraint numbers[32] > 0;
constraint numbers[33] > 0;

solve satisfy;
output [ 
    show(numbers[39]) ++ operators[19] ++ show(numbers[40]) ++ "=" ++ show(numbers[41]) ++ "   " ++ show(numbers[42]) ++ operators[19] ++ show(numbers[43]) ++ "=" ++ show(numbers[44]) ++ "\n" ++
    operators[15] ++ "   " ++ operators[16] ++ "   " ++ operators[17] ++ "   " ++ operators[18] ++ "\n" ++
    show(numbers[34]) ++ "   " ++ show(numbers[35]) ++ operators[14] ++ show(numbers[36]) ++ "=" ++ show(numbers[37]) ++ "   " ++ show(numbers[38]) ++ "\n" ++
    "=   =   =   =\n" ++
    show(numbers[30]) ++ "   " ++ show(numbers[31]) ++ "   " ++ show(numbers[32]) ++ "   " ++ show(numbers[33]) ++ "\n" ++
    show(numbers[24]) ++ operators[12] ++ show(numbers[25]) ++ "=" ++ show(numbers[26]) ++ "   " ++ show(numbers[27]) ++ operators[13] ++ show(numbers[28]) ++ "=" ++ show(numbers[29]) ++ "\n" ++
    "  " ++ operators[10] ++ "       " ++ operators[11] ++ "  \n" ++
    "  " ++ show(numbers[22]) ++ "       " ++ show(numbers[23]) ++ "  \n" ++
    "  =       =  \n" ++
    show(numbers[16]) ++ operators[8] ++ show(numbers[17]) ++ "=" ++ show(numbers[18]) ++ "   " ++ show(numbers[19]) ++ operators[9] ++ show(numbers[20]) ++ "=" ++ show(numbers[21]) ++ "\n" ++
    operators[4] ++ "   " ++ operators[5] ++ "   " ++ operators[6] ++ "   " ++ operators[7] ++ "\n" ++
    show(numbers[11]) ++ "   " ++ show(numbers[12]) ++ operators[3] ++ show(numbers[13]) ++ "=" ++ show(numbers[14]) ++ "   " ++ show(numbers[15]) ++ "\n" ++
    "=   =   =   =\n" ++
    show(numbers[7]) ++ "   " ++ show(numbers[8]) ++ "   " ++ show(numbers[9]) ++ "   " ++ show(numbers[10]) ++ "\n" ++
    show(numbers[1]) ++ operators[1] ++ show(numbers[2]) ++ "=" ++ show(numbers[3]) ++ "   " ++ show(numbers[4]) ++ operators[2] ++ show(numbers[5]) ++ "=" ++ show(numbers[6])
]