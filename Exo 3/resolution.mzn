include "globals.mzn";
include "alldifferent.mzn";

array[1..36] of var 1..36: rikudo;

int: links_size;
array[1..links_size, 1..2] of var 1..36: links;

constraint alldifferent(rikudo);

% for boxes with 3 links
predicate links(var 1..36 : x, var 1..36 : x1, var 1..36 : x2, var 1..36 : x3) =
    x != 36 -> x1 = x + 1 \/ x2 = x + 1 \/ x3 = x + 1;

% for boxes with 4 links
predicate links(var 1..36 : x, var 1..36 : x1, var 1..36 : x2, var 1..36 : x3, var 1..36 : x4) =
    x != 36 -> x4 = x + 1 \/ links(x, x1, x2, x3);

% for boxes with 5 links
predicate links(var 1..36 : x, var 1..36 : x1, var 1..36 : x2, var 1..36 : x3, var 1..36 : x4, var 1..36 : x5) =
    x != 36 -> x5 = x + 1 \/ links(x, x1, x2, x3, x4);

% for boxes with 6 links
predicate links(var 1..36 : x, var 1..36 : x1, var 1..36 : x2, var 1..36 : x3, var 1..36 : x4, var 1..36 : x5, var 1..36 : x6) =
    x != 36 ->  x6 = x + 1 \/ links(x, x1, x2, x3, x4, x5);

% first line
constraint links(rikudo[1], rikudo[2], rikudo[5], rikudo[6]);
constraint links(rikudo[2], rikudo[1], rikudo[3], rikudo[6], rikudo[7]);
constraint links(rikudo[3], rikudo[2], rikudo[4], rikudo[7], rikudo[8]);
constraint links(rikudo[4], rikudo[3], rikudo[8], rikudo[9]);

% second line
constraint links(rikudo[5], rikudo[1], rikudo[6], rikudo[10], rikudo[11]);
constraint links(rikudo[6], rikudo[1], rikudo[2], rikudo[5], rikudo[7], rikudo[11], rikudo[12]);
constraint links(rikudo[7], rikudo[6], rikudo[8], rikudo[2], rikudo[3], rikudo[12], rikudo[13]);
constraint links(rikudo[8], rikudo[3], rikudo[4], rikudo[7], rikudo[9], rikudo[13], rikudo[14]);
constraint links(rikudo[9], rikudo[4], rikudo[8], rikudo[14], rikudo[15]);

% third line
constraint links(rikudo[10], rikudo[5], rikudo[11], rikudo[17], rikudo[16]);
constraint links(rikudo[11], rikudo[5], rikudo[6], rikudo[12], rikudo[18], rikudo[17], rikudo[10]);
constraint links(rikudo[12], rikudo[6], rikudo[7], rikudo[13], rikudo[18], rikudo[11]);
constraint links(rikudo[13], rikudo[7], rikudo[8], rikudo[14], rikudo[19], rikudo[12]);
constraint links(rikudo[14], rikudo[8], rikudo[9], rikudo[15], rikudo[20], rikudo[19], rikudo[13]);
constraint links(rikudo[15], rikudo[9], rikudo[14], rikudo[20], rikudo[21]);

% fourth line
constraint links(rikudo[16], rikudo[10], rikudo[17], rikudo[22]);
constraint links(rikudo[17], rikudo[10], rikudo[11], rikudo[18], rikudo[23], rikudo[22], rikudo[16]);
constraint links(rikudo[18], rikudo[11], rikudo[12], rikudo[24], rikudo[23], rikudo[17]);
constraint links(rikudo[19], rikudo[13], rikudo[14], rikudo[20], rikudo[26], rikudo[25]);
constraint links(rikudo[20], rikudo[14], rikudo[15], rikudo[21], rikudo[27], rikudo[26], rikudo[19]);
constraint links(rikudo[21], rikudo[15], rikudo[20], rikudo[27]);

% fifth line
constraint links(rikudo[22], rikudo[16], rikudo[17], rikudo[23], rikudo[28]);
constraint links(rikudo[23], rikudo[17], rikudo[18], rikudo[24], rikudo[29], rikudo[28], rikudo[22]);
constraint links(rikudo[24], rikudo[18], rikudo[25], rikudo[30], rikudo[29], rikudo[23]);
constraint links(rikudo[25], rikudo[19], rikudo[26], rikudo[31], rikudo[30], rikudo[24]);
constraint links(rikudo[26], rikudo[19], rikudo[20], rikudo[27], rikudo[32], rikudo[31], rikudo[25]);
constraint links(rikudo[27], rikudo[21], rikudo[20], rikudo[26], rikudo[32]);

% sirikudo[th line
constraint links(rikudo[28], rikudo[22], rikudo[23], rikudo[29], rikudo[33]);
constraint links(rikudo[29], rikudo[23], rikudo[24], rikudo[30], rikudo[34], rikudo[33], rikudo[28]);
constraint links(rikudo[30], rikudo[24], rikudo[25], rikudo[31], rikudo[35], rikudo[34], rikudo[29]);
constraint links(rikudo[31], rikudo[25], rikudo[26], rikudo[32], rikudo[36], rikudo[35], rikudo[30]);
constraint links(rikudo[32], rikudo[27], rikudo[26], rikudo[31], rikudo[36]);

% seventh line
constraint links(rikudo[33], rikudo[28], rikudo[29], rikudo[34]);
constraint links(rikudo[34], rikudo[29], rikudo[30], rikudo[35], rikudo[33]);
constraint links(rikudo[35], rikudo[30], rikudo[31], rikudo[36], rikudo[34]);
constraint links(rikudo[36], rikudo[32], rikudo[31], rikudo[35]);

% for links
constraint
    forall(k in 1..links_size)(
        rikudo[links[k, 1]] = rikudo[links[k, 2]] + 1 \/ rikudo[links[k, 2]] = rikudo[links[k, 1]] + 1
    );

solve satisfy;
output [
    "   |" ++ show_int(2, rikudo[33]) ++ "|" ++ show_int(2, rikudo[34]) ++ "|" ++ show_int(2, rikudo[35]) ++ "|" ++ show_int(2, rikudo[36]) ++ "|\n" ++
    "  |" ++ show_int(2, rikudo[28]) ++ "|" ++ show_int(2, rikudo[29]) ++ "|" ++ show_int(2, rikudo[30]) ++ "|" ++ show_int(2, rikudo[31]) ++ "|" ++ show_int(2, rikudo[32]) ++ "|\n" ++
    " |" ++ show_int(2, rikudo[22]) ++ "|" ++ show_int(2, rikudo[23]) ++ "|" ++ show_int(2, rikudo[24]) ++ "|" ++ show_int(2, rikudo[25]) ++ "|" ++ show_int(2, rikudo[26]) ++ "|" ++ show_int(2, rikudo[27]) ++ "|\n" ++
    "|" ++ show_int(2, rikudo[16]) ++ "|" ++ show_int(2, rikudo[17]) ++ "|" ++ show_int(2, rikudo[18]) ++ "|XX|" ++ show_int(2, rikudo[19]) ++ "|" ++ show_int(2, rikudo[20]) ++ "|" ++ show_int(2, rikudo[21]) ++ "|\n" ++
    " |" ++ show_int(2, rikudo[10]) ++ "|" ++ show_int(2, rikudo[11]) ++ "|" ++ show_int(2, rikudo[12]) ++ "|" ++ show_int(2, rikudo[13]) ++ "|" ++ show_int(2, rikudo[14]) ++ "|" ++ show_int(2, rikudo[15]) ++ "|\n" ++
    "  |" ++ show_int(2, rikudo[5]) ++ "|" ++ show_int(2, rikudo[6]) ++ "|" ++ show_int(2, rikudo[7]) ++ "|" ++ show_int(2, rikudo[8]) ++ "|" ++ show_int(2, rikudo[9]) ++ "|\n" ++
    "   |" ++ show_int(2, rikudo[1]) ++ "|" ++ show_int(2, rikudo[2]) ++ "|" ++ show_int(2, rikudo[3]) ++ "|" ++ show_int(2, rikudo[4]) ++ "|\n" ]
