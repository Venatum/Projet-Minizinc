int: n; % avoid errors when wrongly passing data
% Reine 1 à 4
var 1..4: R1;
var 1..4: R2;
var 1..4: R3;
var 1..4: R4;

% ligne
constraint R1 != R2;
constraint R1 != R3;
constraint R1 != R4;
constraint R2 != R3;
constraint R2 != R4;
constraint R3 != R4;


% ou
% global "global.mzn"
% constraint alldifferent([R1, R2, R3, R4]);

% Diagonales montantes
constraint R1 != R2 + 1;
constraint R1 != R3 + 2;
constraint R1 != R4 + 3;
constraint R2 != R3 + 1;
constraint R2 != R4 + 2;
constraint R3 != R4 + 1;

% Diagonales descendantes
constraint R1 != R2 - 1;
constraint R1 != R3 - 2;
constraint R1 != R4 - 3;
constraint R2 != R3 - 1;
constraint R2 != R4 - 2;
constraint R3 != R4 - 1;

solve satisfy;

output [ if fix(q[j]) == i then "|Q" else "| " endif ++
         if j == n then "|\n" else "" endif | i, j in 1..n];